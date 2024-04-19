cmake_minimum_required(VERSION 3.0)


# Configure CMake for compiling to wasm
if(COMPILE_TO_WASM)
  message(STATUS "Compiling to wasm")
  set(CMAKE_TOOLCHAIN_FILE "${WASI_SDK_PATH}/share/cmake/wasi-sdk.cmake")
endif()

project(WASM-crypto-algorithms CXX C)


if (NOT CMAKE_BUILD_TYPE)
  message(STATUS "No build type selected, default to *** Release ***")
  set(CMAKE_BUILD_TYPE "Release")
endif()


# Set common flags for wasm compilation
if(COMPILE_TO_WASM)
  set(WASI_FLAGS "")
  string(APPEND CMAKE_C_FLAGS ${WASI_FLAGS})
  string(APPEND CMAKE_CXX_FLAGS ${WASI_FLAGS})
  set(CMAKE_EXECUTABLE_SUFFIX ".wasm")
endif()


# Configure CMake for compiling with musl
if(COMPILE_WITH_MUSL)
  # Set compiler
  set(CMAKE_C_COMPILER "${MUSL_PATH}/bin/x86_64-linux-musl-gcc")
  set(CMAKE_CXX_COMPILER "${MUSL_PATH}/bin/x86_64-linux-musl-g++")
  string(APPEND CMAKE_C_FLAGS " -Wl,-rpath,${MUSL_PATH}/x86_64-linux-musl/lib")
  string(APPEND CMAKE_CXX_FLAGS " -Wl,-rpath,${MUSL_PATH}/x86_64-linux-musl/lib")
  set(CMAKE_EXECUTABLE_SUFFIX ".musl")
endif()



add_executable(aes_test aes_test.c aes.c)
add_executable(arcfour_test arcfour_test.c arcfour.c)
add_executable(base64_test base64_test.c base64.c)
add_executable(blowfish_test blowfish_test.c blowfish.c)
add_executable(des_test des_test.c des.c)
add_executable(md2_test md2_test.c md2.c)
add_executable(md5_test md5_test.c md5.c)
add_executable(rot-13_test rot-13_test.c rot-13.c)
add_executable(sha1_test sha1_test.c sha1.c)
add_executable(sha256_test sha256_test.c sha256.c)

