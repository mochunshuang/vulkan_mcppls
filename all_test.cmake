enable_testing()

set(TEST_ROOT_DIR "${CMAKE_SOURCE_DIR}/test")
include(${TEST_ROOT_DIR}/use_std.cmake)


add_executable(hello_triangle
${TEST_ROOT_DIR}/hello_triangle.cpp
)
target_link_libraries(hello_triangle PUBLIC ${BASE_LIBS})
target_compile_features(hello_triangle PRIVATE cxx_std_23)  # 确保启用 C++23
target_compile_options(hello_triangle PRIVATE -fmodules)    # 只保留 -fmodules
set_target_properties(hello_triangle PROPERTIES CXX_MODULE_STD ON)
if(WIN32 AND CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    target_link_libraries(hello_triangle PRIVATE stdc++exp)
endif()