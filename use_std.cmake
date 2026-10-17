
set(THIS_DIR ${TEST_ROOT_DIR}/use_std)

add_executable(my_app ${THIS_DIR}/hello.cpp)
target_compile_features(my_app PRIVATE cxx_std_23)  # 确保启用 C++23
target_compile_options(my_app PRIVATE -fmodules)    # 只保留 -fmodules
set_target_properties(my_app PROPERTIES CXX_MODULE_STD ON)
if(WIN32 AND CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    target_link_libraries(my_app PRIVATE stdc++exp)
endif()
