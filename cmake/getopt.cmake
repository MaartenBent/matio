if(NOT HAVE_GETOPT)
    set(getopt_SOURCES
        ${PROJECT_SOURCE_DIR}/getopt/getopt_long.c
        ${PROJECT_SOURCE_DIR}/getopt/getopt.h
    )
    add_library(getopt STATIC ${getopt_SOURCES})
    target_include_directories(getopt PUBLIC ${PROJECT_SOURCE_DIR}/getopt)
    target_compile_definitions(getopt PRIVATE REPLACE_GETOPT)

    if(MSVC)
        set_target_properties(getopt PROPERTIES COMPILE_FLAGS "/wd4267")
        target_compile_definitions(getopt PRIVATE _CRT_SECURE_NO_WARNINGS)
    endif()
endif()
