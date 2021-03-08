include(ExternalProject)

# Enable C11 support for boost?
# set(CMAKE_CXX_STANDARD 11)
# set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(Boost_ROOT ${CMAKE_BINARY_DIR}/thirdparty/boost)
set(Boost_INCLUDE_DIR ${Boost_ROOT}/include)
set(Boost_LIB_DIR ${Boost_ROOT}/lib)

ExternalProject_Add(BOOST_EXTERNAL_PROJECT
                    PREFIX ${Boost_ROOT}
                    GIT_REPOSITORY "https://github.com/boostorg/boost.git"
                    GIT_TAG "boost-1.75.0"
                    GIT_SUBMODULES "tools
                     libs/any
                     libs/align
                     libs/algorithm
                     libs/array
                     libs/assert
                     libs/atomic
                     libs/bind
                     libs/config
                     libs/concept_check
                     libs/conversion
                     libs/container
                     libs/container_hash
                     libs/core
                     libs/detail
                     libs/dynamic_bitset
                     libs/exception
                     libs/function
                     libs/function_types
                     libs/functional
                     libs/fusion
                     libs/headers
                     libs/integer
                     libs/intrusive
                     libs/io
                     libs/iterator
                     libs/lambda
                     libs/lexical_cast
                     libs/math
                     libs/move
                     libs/mpl
                     libs/multiprecision
                     libs/numeric
                     libs/optional
                     libs/predef
                     libs/preprocessor
                     libs/range
                     libs/random
                     libs/rational
                     libs/regex
                     libs/smart_ptr
                     libs/static_assert
                     libs/system
                     libs/throw_exception
                     libs/tokenizer
                     libs/tuple
                     libs/type_index
                     libs/typeof
                     libs/type_traits
                     libs/unordered
                     libs/utility
                     libs/winapi
                     libs/filesystem
                     libs/program_options"
                    GIT_SHALLOW True
                    UPDATE_COMMAND ""
                    PATCH_COMMAND ""
                    BINARY_DIR ${Boost_ROOT}/src/boost
                    SOURCE_DIR ${Boost_ROOT}/src/boost
                    INSTALL_DIR ${Boost_ROOT}
                    BUILD_ALWAYS False
                    CMAKE_ARGS -DBOOST_BUILD_TESTS=OFF -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR>
                    CONFIGURE_COMMAND ./bootstrap.sh --with-libraries=filesystem,program_options --prefix=${Boost_ROOT}
                    BUILD_COMMAND ./b2 install
                    )

link_directories(${Boost_LIB_DIR})

#Set this var to make the linking similar to linking via an external install of yaml-cpp
set (Boost_LIBRARIES boost_filesystem boost_program_options)
