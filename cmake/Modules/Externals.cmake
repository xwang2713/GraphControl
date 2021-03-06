find_package( AGGSRC )
if ( AGGSRC_FOUND )
else ( )
    MESSAGE( "AGG Sources not found:  " ${AGG_ROOT})
endif ( )

find_package( GRAPHVIZSRC )
if ( GRAPHVIZSRC_FOUND )
else ( )
    MESSAGE( "GRAPHVIZ Sources not found:  " ${GRAPHVIZSRC_ROOT})
endif ( )

if ( WIN32 AND EXTERNALS_DIRECTORY )
    set ( EXPAT_INCLUDE_DIRS "${EXTERNALS_DIRECTORY}/expat-2.0.1" )
    set ( FREETYPE_INCLUDE_DIR_freetype2 "${EXTERNALS_DIRECTORY}/ft248/freetype-2.4.8/include" )
    set ( FREETYPE_INCLUDE_DIR_ft2build "${EXTERNALS_DIRECTORY}/ft248/freetype-2.4.8/include" )
    set ( FREETYPE_INCLUDE_DIRS ${FREETYPE_INCLUDE_DIR_freetype2} ${FREETYPE_INCLUDE_DIR_ft2build} )
    set ( FREETYPE_LIBRARY "${EXTERNALS_DIRECTORY}/ft248/freetype-2.4.8/objs/win32/vc2015/freetype248MT.lib" )
    set ( BOOST_INCLUDEDIR "${EXTERNALS_DIRECTORY}/Boost/include/boost-1_58" CACHE PATH "Boost headers folder" )
    set ( BOOST_LIBRARYDIR "${EXTERNALS_DIRECTORY}/Boost/windows-i386-vc140" CACHE PATH "Boost libraries folder" )
else ( WIN32 AND EXTERNALS_DIRECTORY )
    find_package( EXPAT )
    if ( EXPAT_FOUND )
    else ( )
        MESSAGE( "EXPAT not found:  " ${EXPAT_ROOT})
    endif ( )

    find_package( Freetype )
    if( FREETYPE_FOUND )
    else( )
        MESSAGE( "Freetype library was not found" )
    endif( )
endif ( WIN32 AND EXTERNALS_DIRECTORY )

if(WIN32)
elseif(APPLE)
    find_path(CARBON_INCLUDE_DIR Carbon.h)
    find_library(CARBON_FRAMEWORK Carbon) 
    find_path(QT_INCLUDE_DIR QuickTime.h)
    find_library(COCOA_FRAMEWORK Cocoa)
    find_library(SYSCONFIG_FRAMEWORK SystemConfiguration)
    find_library(FOUNDATION_FRAMEWORK Foundation)
    find_library(APPLICATIONSERVICES_FRAMEWORK ApplicationServices)
    find_library(QUARTZCORE_FRAMEWORK QuartzCore)

    find_library(CORE_SERVICES CoreServices)
    find_library(SYS_CONFIG SystemConfiguration)
    message("Found: ${CORE_SERVICES} ${SYS_CONFIG}")
elseif(UNIX)
    find_package( Threads )
    if( THREADS_FOUND )
    else( )
        MESSAGE( "Threads library was not found" )
    endif( )
endif()
