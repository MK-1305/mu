# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.17

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /home/ec2-user/mu/cmake-3.17.2/Bootstrap.cmk/cmake

# The command to remove a file.
RM = /home/ec2-user/mu/cmake-3.17.2/Bootstrap.cmk/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ec2-user/mu/cmake-3.17.2

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ec2-user/mu/cmake-3.17.2

# Include any dependencies generated for this target.
include Tests/CMakeServerLib/CMakeFiles/CMakeServerLibTests.dir/depend.make

# Include the progress variables for this target.
include Tests/CMakeServerLib/CMakeFiles/CMakeServerLibTests.dir/progress.make

# Include the compile flags for this target's objects.
include Tests/CMakeServerLib/CMakeFiles/CMakeServerLibTests.dir/flags.make

Tests/CMakeServerLib/CMakeFiles/CMakeServerLibTests.dir/CMakeServerLibTests.cxx.o: Tests/CMakeServerLib/CMakeFiles/CMakeServerLibTests.dir/flags.make
Tests/CMakeServerLib/CMakeFiles/CMakeServerLibTests.dir/CMakeServerLibTests.cxx.o: Tests/CMakeServerLib/CMakeServerLibTests.cxx
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ec2-user/mu/cmake-3.17.2/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object Tests/CMakeServerLib/CMakeFiles/CMakeServerLibTests.dir/CMakeServerLibTests.cxx.o"
	cd /home/ec2-user/mu/cmake-3.17.2/Tests/CMakeServerLib && /usr/bin/g++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/CMakeServerLibTests.dir/CMakeServerLibTests.cxx.o -c /home/ec2-user/mu/cmake-3.17.2/Tests/CMakeServerLib/CMakeServerLibTests.cxx

Tests/CMakeServerLib/CMakeFiles/CMakeServerLibTests.dir/CMakeServerLibTests.cxx.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/CMakeServerLibTests.dir/CMakeServerLibTests.cxx.i"
	cd /home/ec2-user/mu/cmake-3.17.2/Tests/CMakeServerLib && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ec2-user/mu/cmake-3.17.2/Tests/CMakeServerLib/CMakeServerLibTests.cxx > CMakeFiles/CMakeServerLibTests.dir/CMakeServerLibTests.cxx.i

Tests/CMakeServerLib/CMakeFiles/CMakeServerLibTests.dir/CMakeServerLibTests.cxx.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/CMakeServerLibTests.dir/CMakeServerLibTests.cxx.s"
	cd /home/ec2-user/mu/cmake-3.17.2/Tests/CMakeServerLib && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ec2-user/mu/cmake-3.17.2/Tests/CMakeServerLib/CMakeServerLibTests.cxx -o CMakeFiles/CMakeServerLibTests.dir/CMakeServerLibTests.cxx.s

Tests/CMakeServerLib/CMakeFiles/CMakeServerLibTests.dir/testServerBuffering.cpp.o: Tests/CMakeServerLib/CMakeFiles/CMakeServerLibTests.dir/flags.make
Tests/CMakeServerLib/CMakeFiles/CMakeServerLibTests.dir/testServerBuffering.cpp.o: Tests/CMakeServerLib/testServerBuffering.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ec2-user/mu/cmake-3.17.2/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object Tests/CMakeServerLib/CMakeFiles/CMakeServerLibTests.dir/testServerBuffering.cpp.o"
	cd /home/ec2-user/mu/cmake-3.17.2/Tests/CMakeServerLib && /usr/bin/g++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/CMakeServerLibTests.dir/testServerBuffering.cpp.o -c /home/ec2-user/mu/cmake-3.17.2/Tests/CMakeServerLib/testServerBuffering.cpp

Tests/CMakeServerLib/CMakeFiles/CMakeServerLibTests.dir/testServerBuffering.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/CMakeServerLibTests.dir/testServerBuffering.cpp.i"
	cd /home/ec2-user/mu/cmake-3.17.2/Tests/CMakeServerLib && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ec2-user/mu/cmake-3.17.2/Tests/CMakeServerLib/testServerBuffering.cpp > CMakeFiles/CMakeServerLibTests.dir/testServerBuffering.cpp.i

Tests/CMakeServerLib/CMakeFiles/CMakeServerLibTests.dir/testServerBuffering.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/CMakeServerLibTests.dir/testServerBuffering.cpp.s"
	cd /home/ec2-user/mu/cmake-3.17.2/Tests/CMakeServerLib && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ec2-user/mu/cmake-3.17.2/Tests/CMakeServerLib/testServerBuffering.cpp -o CMakeFiles/CMakeServerLibTests.dir/testServerBuffering.cpp.s

# Object files for target CMakeServerLibTests
CMakeServerLibTests_OBJECTS = \
"CMakeFiles/CMakeServerLibTests.dir/CMakeServerLibTests.cxx.o" \
"CMakeFiles/CMakeServerLibTests.dir/testServerBuffering.cpp.o"

# External object files for target CMakeServerLibTests
CMakeServerLibTests_EXTERNAL_OBJECTS =

Tests/CMakeServerLib/CMakeServerLibTests: Tests/CMakeServerLib/CMakeFiles/CMakeServerLibTests.dir/CMakeServerLibTests.cxx.o
Tests/CMakeServerLib/CMakeServerLibTests: Tests/CMakeServerLib/CMakeFiles/CMakeServerLibTests.dir/testServerBuffering.cpp.o
Tests/CMakeServerLib/CMakeServerLibTests: Tests/CMakeServerLib/CMakeFiles/CMakeServerLibTests.dir/build.make
Tests/CMakeServerLib/CMakeServerLibTests: Source/libCMakeLib.a
Tests/CMakeServerLib/CMakeServerLibTests: Source/libCMakeServerLib.a
Tests/CMakeServerLib/CMakeServerLibTests: Source/libCMakeLib.a
Tests/CMakeServerLib/CMakeServerLibTests: Source/kwsys/libcmsys.a
Tests/CMakeServerLib/CMakeServerLibTests: Utilities/std/libcmstd.a
Tests/CMakeServerLib/CMakeServerLibTests: Utilities/cmexpat/libcmexpat.a
Tests/CMakeServerLib/CMakeServerLibTests: Utilities/cmlibarchive/libarchive/libcmlibarchive.a
Tests/CMakeServerLib/CMakeServerLibTests: Utilities/cmliblzma/libcmliblzma.a
Tests/CMakeServerLib/CMakeServerLibTests: Utilities/cmzstd/libcmzstd.a
Tests/CMakeServerLib/CMakeServerLibTests: Utilities/cmbzip2/libcmbzip2.a
Tests/CMakeServerLib/CMakeServerLibTests: Utilities/cmcurl/lib/libcmcurl.a
Tests/CMakeServerLib/CMakeServerLibTests: Utilities/cmzlib/libcmzlib.a
Tests/CMakeServerLib/CMakeServerLibTests: /usr/lib64/libssl.so
Tests/CMakeServerLib/CMakeServerLibTests: /usr/lib64/libcrypto.so
Tests/CMakeServerLib/CMakeServerLibTests: Utilities/cmjsoncpp/libcmjsoncpp.a
Tests/CMakeServerLib/CMakeServerLibTests: Utilities/cmlibuv/libcmlibuv.a
Tests/CMakeServerLib/CMakeServerLibTests: Utilities/cmlibrhash/libcmlibrhash.a
Tests/CMakeServerLib/CMakeServerLibTests: Tests/CMakeServerLib/CMakeFiles/CMakeServerLibTests.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ec2-user/mu/cmake-3.17.2/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable CMakeServerLibTests"
	cd /home/ec2-user/mu/cmake-3.17.2/Tests/CMakeServerLib && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/CMakeServerLibTests.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
Tests/CMakeServerLib/CMakeFiles/CMakeServerLibTests.dir/build: Tests/CMakeServerLib/CMakeServerLibTests

.PHONY : Tests/CMakeServerLib/CMakeFiles/CMakeServerLibTests.dir/build

Tests/CMakeServerLib/CMakeFiles/CMakeServerLibTests.dir/clean:
	cd /home/ec2-user/mu/cmake-3.17.2/Tests/CMakeServerLib && $(CMAKE_COMMAND) -P CMakeFiles/CMakeServerLibTests.dir/cmake_clean.cmake
.PHONY : Tests/CMakeServerLib/CMakeFiles/CMakeServerLibTests.dir/clean

Tests/CMakeServerLib/CMakeFiles/CMakeServerLibTests.dir/depend:
	cd /home/ec2-user/mu/cmake-3.17.2 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ec2-user/mu/cmake-3.17.2 /home/ec2-user/mu/cmake-3.17.2/Tests/CMakeServerLib /home/ec2-user/mu/cmake-3.17.2 /home/ec2-user/mu/cmake-3.17.2/Tests/CMakeServerLib /home/ec2-user/mu/cmake-3.17.2/Tests/CMakeServerLib/CMakeFiles/CMakeServerLibTests.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : Tests/CMakeServerLib/CMakeFiles/CMakeServerLibTests.dir/depend

