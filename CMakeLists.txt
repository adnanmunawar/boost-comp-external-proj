cmake_minimum_required(VERSION 3.2)

# set the project name
project(test_proj)

message("*** ADDING BOOST AS AN EXTERNAL PROJECT")
include(ExternalBoost.cmake)

# Common step regardless of if Boost is pre-installed or added as external proj
include_directories(${Boost_INCLUDE_DIR})

message("-- *** Boost_INCLUDE_DIR: " ${Boost_INCLUDE_DIR})

# add the executable
add_executable(example_program_options src/example_program_options.cpp)
add_executable(example_filesystem src/example_filesystem.cpp)

add_dependencies(example_program_options BOOST_EXTERNAL_PROJECT)
add_dependencies(example_filesystem BOOST_EXTERNAL_PROJECT)

target_link_libraries(example_program_options ${Boost_LIBRARIES})
target_link_libraries(example_filesystem ${Boost_LIBRARIES})
