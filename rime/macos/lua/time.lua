local function translator(input, seg)
    if (input == "t") then  -- 关键字更改，可以用or语句定义多个关键字
        yield(Candidate("t", seg.start, seg._end, os.date("%H:%M"), " "))
        yield(Candidate("t", seg.start, seg._end, os.date("%H点%M分"), " "))
        yield(Candidate("t", seg.start, seg._end, os.date("%H:%M:%S"), " "))
    end
end
return translator