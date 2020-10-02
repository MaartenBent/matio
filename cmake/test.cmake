add_executable(test_mat ${PROJECT_SOURCE_DIR}/test/test_mat.c)
if(MSVC)
    set_target_properties(test_mat PROPERTIES OUTPUT_NAME "test_mat${NAME_SUFFIX}")
    set_target_properties(test_mat PROPERTIES DEBUG_POSTFIX "d")
    set_target_properties(test_mat PROPERTIES COMPILE_FLAGS "/wd4267")
    target_compile_definitions(test_mat PRIVATE _CRT_SECURE_NO_WARNINGS)
endif()

target_link_libraries(test_mat matio)
if(NOT HAVE_GETOPT)
    target_link_libraries(test_mat getopt)
endif()

if(NOT HAVE_SNPRINTF OR UNIX)
    add_executable(test_snprintf
        ${PROJECT_SOURCE_DIR}/test/test_snprintf.c
        ${PROJECT_SOURCE_DIR}/snprintf/snprintf.c
    )
    if(HAVE_LIBM)
        target_link_libraries(test_snprintf m)
    endif()
    target_include_directories(test_snprintf PUBLIC
        ${PROJECT_SOURCE_DIR}/src
        ${PROJECT_BINARY_DIR}/src
    )
endif()
