#pragma author WerWolv
#pragma description GPT (GUID Partition Table) blob

#pragma endian little

//#include <std/sys.pat>
//#include <std/io.pat>
//#include <std/core.pat>
//#include <std/string.pat>

//#include <type/magic.pat>
//#include <type/size.pat>
#include <type/bcd.pat>
#include <type/GUID.pat>

#include <std/hash.pat>

// struct GUID {
//     u32 GUID_data1;
//     u16 GUID_data2;
//     u16 GUID_data3;
//     u8  GUID_data4[8];
// } [[format("GUID_formatter")]];
//
// fn GUID_formatter(GUID guid) {
//     return std::format("{:08X}-{:04X}-{:04X}-{:02X}{:02X}{:02X}{:02X}{:02X}{:02X}{:02X}{:02X}",
//                         guid.GUID_data1, guid.GUID_data2, guid.GUID_data3, 
//                         guid.GUID_data4[0], guid.GUID_data4[1], guid.GUID_data4[2], guid.GUID_data4[3],
//                         guid.GUID_data4[4], guid.GUID_data4[5], guid.GUID_data4[6], guid.GUID_data4[7]);
// };

// GPT Header Pattern
struct GPTHeader {
    u64 magic;              // The magic number should be "EFI PART" (0x5452415020494645)
    type::BCD<4> revision;           // Revision of the GPT header
    u32 headerSize;         // Size of the GPT header
    u32 headerCRC32;        // CRC32 of the header
    u32 reserved;           // Reserved; should be zero
    u64 currentLBA;         // LBA of this header
    u64 backupLBA;          // LBA of the backup header
    u64 firstUsableLBA;     // First usable LBA for partitions
    u64 lastUsableLBA;      // Last usable LBA
    type::GUID diskGUID;          // Disk GUID
    u64 partEntryStartingLBA; // Starting LBA of the array of partition entries
    u32 numPartEntries;     // Number of partition entries in the array
    u32 partEntrySize;      // Size of a single partition entry (usually 128 bytes)
    u32 partArrayCRC32;     // CRC32 of the partition array
    // The rest of the header is padded to the sector size, which is usually 512 bytes.
};

struct GPTEntry {
    type::GUID partitionTypeGUID; // Partition type GUID
    type::GUID uniquePartitionGUID; // Unique partition GUID
    u64 startingLBA;         // Starting LBA of the partition
    u64 endingLBA;           // Ending LBA of the partition
    u64 attributes;          // Attributes of the partition
    char16 partitionName[36];   // Partition name (UTF-16LE encoded)
    //partitionName = std::mem::read_string()
};

// Parse the GPT Header
GPTHeader gptHeader @ 0x200;

// Parse GPT Partition Entries
// Specify the number of elements in the entries array based on numPartEntries from GPTHeader
// Note that imHex may not support complex offset calculations within the pattern,
// so this might not work as intended if imHex does not support compound offsets yet.
// Check imHex documentation or support for more information on supported features.
GPTEntry entries[gptHeader.numPartEntries] @ (gptHeader.partEntryStartingLBA * 0x200);

// Calculate header CRC32
u32 init = 0xFFFFFFFF;
u32 poly = 0x04C11DB7;
u32 xorout = 0xFFFFFFFF;
bool reflect_in = true;
bool reflect_out = true;

GPTHeader tempHeader = gptHeader;
tempHeader.headerCRC32 = 0x00;

u32 headerCRC = std::hash::crc32(tempHeader, init, poly, xorout, reflect_in, reflect_out);
std::print("real headerCRC32 is {} ({:#010X})", headerCRC, headerCRC);
if (headerCRC == gptHeader.headerCRC32) {
    std::print("GPTHeader.headerCRC32 verify pass");
} else {
    std::print("GPTHeader.headerCRC32 verify fail");
}
