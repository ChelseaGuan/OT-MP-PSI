# Locate libhcs header file
FIND_PATH(libhcs_INCLUDE_DIR libhcs.h
        HINTS
        /usr/local/include
)

# Locate libhcs library file
FIND_LIBRARY(libhcs_LIBRARY
        NAMES libhcs.so
        HINTS
        /usr/local/lib
)

# Check if libhcs was found
INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(libhcs DEFAULT_MSG  libhcs_LIBRARY libhcs_INCLUDE_DIR)

MARK_AS_ADVANCED(libhcs_LIBRARY libhcs_INCLUDE_DIR)
