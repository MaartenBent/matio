add_executable(matdump
    ${PROJECT_SOURCE_DIR}/tools/matdump.c
    ${PROJECT_SOURCE_DIR}/snprintf/snprintf.c
)
if(MSVC)
    set_target_properties(matdump PROPERTIES OUTPUT_NAME "matdump${NAME_SUFFIX}")
    set_target_properties(matdump PROPERTIES DEBUG_POSTFIX "d")
    set_target_properties(matdump PROPERTIES COMPILE_FLAGS "/wd4267")
    target_compile_definitions(matdump PRIVATE _CRT_SECURE_NO_WARNINGS)
endif()

target_link_libraries(matdump matio)
if(NOT HAVE_GETOPT)
    target_link_libraries(matdump getopt)
endif()

install(TARGETS matdump
        PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
)
