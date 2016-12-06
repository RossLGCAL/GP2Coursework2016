# - Find TinyXML
# Find the native TinyXML includes and library
#
#   TINYXML_FOUND       - True if TinyXML found.
#   TINYXML_INCLUDE_DIR - where to find tinyxml.h, etc.
#   TINYXML_LIBRARIES   - List of libraries when using TinyXML.
#
# found here - https://github.com/dropbox/encfs/blob/master/CMakeModules/FindTinyXML.cmake
# modified by Brian McDonald for Mac OS on 2/6/16
# modified by Brian McDonald for TinyXML2 on 18/07/16

IF( TINYXML_INCLUDE_DIR )
    # Already in cache, be silent
    SET( TinyXML_FIND_QUIETLY TRUE )
ENDIF( TINYXML_INCLUDE_DIR )

FIND_PATH( TINYXML_INCLUDE_DIR "tinyxml2.h"
           PATH_SUFFIXES "tinyxml2"
         HINTS /opt/local/include
		$ENV{TINYXML_PATH}/include)

FIND_LIBRARY( TINYXML_LIBRARIES
              NAMES "tinyxml2"
              PATH_SUFFIXES "tinyxml2"
            HINTS /opt/local/lib
	   $ENV{TINYXML_PATH}/lib )

# handle the QUIETLY and REQUIRED arguments and set TINYXML_FOUND to TRUE if
# all listed variables are TRUE
INCLUDE( "FindPackageHandleStandardArgs" )
FIND_PACKAGE_HANDLE_STANDARD_ARGS( "TinyXML" DEFAULT_MSG TINYXML_INCLUDE_DIR TINYXML_LIBRARIES )

MESSAGE(${TINYXML_LIBRARIES})
MARK_AS_ADVANCED( TINYXML_INCLUDE_DIR TINYXML_LIBRARIES )
