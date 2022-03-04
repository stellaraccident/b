# Use clang for C and C++ compilation.
set(CMAKE_C_COMPILER "clang")
set(CMAKE_CXX_COMPILER "clang++")

# Create static archives as "thin".
set(CMAKE_CXX_ARCHIVE_CREATE "<CMAKE_AR> cruT <TARGET> <LINK_FLAGS> <OBJECTS>")
set(CMAKE_C_ARCHIVE_CREATE "<CMAKE_AR> cruT <TARGET> <LINK_FLAGS> <OBJECTS>")
set(CMAKE_CXX_ARCHIVE_APPEND "<CMAKE_AR> rT <TARGET> <LINK_FLAGS> <OBJECTS>")
set(CMAKE_C_ARCHIVE_APPEND "<CMAKE_AR> rT <TARGET> <LINK_FLAGS> <OBJECTS>")

# Enable split-dwarf debug info (creates .dwo files).
string(APPEND CMAKE_C_FLAGS "-gsplit-dwarf ")
string(APPEND CMAKE_CXX_FLAGS "-gsplit-dwarf ")

# Use LLD and enable linking to external debug info vs copying into binaries.
string(APPEND CMAKE_EXE_LINKER_FLAGS "-fuse-ld=lld -Wl,--gdb-index ")
string(APPEND CMAKE_SHARED_LINKER_FLAGS "-fuse-ld=lld -Wl,--gdb-index ")
string(APPEND CMAKE_MODULE_LINKER_FLAGS "-fuse-ld=lld -Wl,--gdb-index ")
