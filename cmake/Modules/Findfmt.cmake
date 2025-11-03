# Find path to the fmt library (https://github.com/fmtlib/fmt)

# This module defines
# fmt_INCLUDE_DIRS, where to find the headers
# fmt_LIBRARIES, the libraries to link against
# fmt_FOUND, whether or not the library was found

find_path(fmt_INCLUDE_DIRS fmt/format.h
    ~/fmt/include
    /usr/local/include
    /usr/include
    ~/git/fmt/include
  ${PROJECT_SOURCE_DIR})

find_library(fmt_LIBRARIES
  NAMES fmt
  PATHS
    ~/fmt/lib
    /usr/local/lib
    /usr/lib
    ~/git/fmt/lib
  ${PROJECT_SOURCE_DIR})

if(fmt_INCLUDE_DIRS AND fmt_LIBRARIES)
  set(fmt_FOUND "YES")
endif()

if(fmt_FOUND)
  if(NOT fmt_FIND_QUIETLY)
    message(STATUS "Found fmt: ${fmt_LIBRARIES}")
  endif()
else()
  if(fmt_FIND_REQUIRED)
    message(FATAL_ERROR "Could not find fmt")
  endif()
endif()
