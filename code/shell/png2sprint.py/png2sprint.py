from os import listdir
from PIL import Image
import math

import sys,getopt

g_inputDir = ''
g_outputFile = ''
g_spriteW = 256
g_spriteH = 256
g_countPerLine = 10
g_countLimit = 100
g_crop = [128, 128, 128 + g_spriteW, 128 + g_spriteH]

def params(argv):
    global g_inputDir, g_outputFile
    global g_spriteW, g_spriteH
    global g_countPerLine, g_countLimit
    global g_crop

    try:
        opts, args = getopt.getopt(argv,"hi:o:s:p:l:c:",["inputdir=","outputfile="])
    except getopt.GetoptError:
        print('py -i <inputDir> -o <outputFile> -s 100x100 -p 10 -l 100 -c 128,128,384,384')
        sys.exit(2)

    for (opt, arg) in opts:

        if opt == '-h':
            sys.exit()
        elif opt == "-i" or opt == "--inputDir":
            g_inputDir = arg
        elif opt == "-o" or opt == "--outputFile":
            g_outputFile = arg
        elif opt == "-s":
            sizeStrs = arg.split("x")
            g_spriteW = int(sizeStrs[0])
            g_spriteH = int(sizeStrs[1])
        elif opt == "-p":
            temp = int(arg)
            if temp > 0 :
                g_countPerLine = int(arg)
            else:
                print('count-per-line must > 0')
        elif opt == "-l":
            temp = int(arg)
            if temp > 0 :
                g_countLimit = temp
            else:
                print('count limit must > 0')
        elif opt == "-c":
            crop = arg.split(",")
            for i in range(len(crop)):
                crop[i] = int(crop[i])
            g_crop = tuple(crop)
            if len(crop) != 4:
                print('crop must have 4 elements')
                sys.exit(2)
            elif g_crop[2] <= g_crop[0] or g_crop[3] <= g_crop[1]:
                print('start.x >= end.x or start.y >= end.y')
                sys.exit(2)

def sprite(inDir, outFile):
    dirs = listdir(inDir)
    print(sorted(dirs))
    ims = [Image.open(('%s/%s' % (inDir, fn))) for fn in sorted(dirs) if fn.endswith('.png')]
    count = len(ims)
    if g_countLimit > 0 and count > g_countLimit:
        count = g_countLimit
    line = math.ceil(count / g_countPerLine)
    print("count:", len(ims), " line:", line)

    if len(ims) > 0:
        width, height = ims[0].size
        print("new image w:", g_spriteW * g_countPerLine, " h:", line * g_spriteH)
        result = Image.new(ims[0].mode, (g_spriteW * g_countPerLine, line * g_spriteH))

        for i, im in enumerate(ims):
            if (g_countLimit > 0 and i >= g_countLimit):
                break
            impTmp = im
            if(g_crop[2] > 0 and g_crop[3] > 0):
                impTmp = im.crop(g_crop)
            impTmp = impTmp.resize((g_spriteW, g_spriteH))
            #print("paste image size:", impTmp.size)
            x = (i % g_countPerLine) * g_spriteW
            y = int(i / g_countPerLine) * g_spriteH
            result.paste(impTmp, box=(x, y))
            print("paste image:", i + 1 ,"/", count, ", @x:", x, " y:", y, ", size:", impTmp.size, sep='')
        result.show()
        print("out image size:", result.size)
        result.save(outFile) #输出文件名
        print("process done.")
    else:
        print('no file')

params(sys.argv[1:])
if len(g_inputDir) == 0 :
    g_inputDir = './' #目录地址
if len(g_outputFile) == 0 :
    print('g_outputFile:', g_outputFile)
    if len(g_inputDir) > 2:
        tempOut = g_inputDir
        if (g_inputDir.endswith('/') or g_inputDir.endswith('\\')):
            inlen = len(g_inputDir)
            print('inlen:', inlen)
            tempOut = g_inputDir[:inlen-1]
        g_outputFile = tempOut + ".png"
    else:
        g_outputFile = g_inputDir + "out.png"

print('-----------------------# input args #------------------------')
print('inputDir:', g_inputDir, "outputFile:", g_outputFile)
print('size:', g_spriteW, g_spriteH)
print('count limit:', g_countLimit, "countPerLine:", g_countPerLine)
print('crop:', g_crop)
print('----------------------###############-----------------------')

sprite(g_inputDir, g_outputFile)
