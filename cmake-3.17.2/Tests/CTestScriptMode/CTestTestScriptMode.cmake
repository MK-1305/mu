# This script will be executed with ctest -S

# Check that the system name is determined correctly:
set(CMAKE_CMAKE_SYSTEM_NAME "Linux")

if (NOT "${CMAKE_SYSTEM_NAME}" STREQUAL "${CMAKE_CMAKE_SYSTEM_NAME}")
   message(FATAL_ERROR "Error: CMAKE_SYSTEM_NAME is \"${CMAKE_SYSTEM_NAME}\", but should be \"Linux\"")
endif()

# this seems to be necessary, otherwise ctest complains that these
# variables are not set:
set(CTEST_COMMAND "\"/home/ec2-user/mu/cmake-3.17.2/bin/ctest\"")
set(CTEST_SOURCE_DIRECTORY "/home/ec2-user/mu/cmake-3.17.2/Tests/CTestScriptMode/")
set(CTEST_BINARY_DIRECTORY "/home/ec2-user/mu/cmake-3.17.2/Tests/CTestScriptMode/")
