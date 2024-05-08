cmake_minimum_required(VERSION 3.10)

project(OT-MP-PSI)

set(CMAKE_CXX_STANDARD 11)
set(THREADS_PREFER_PTHREAD_FLAG ON)
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/modules")

find_package(libhcs REQUIRED)
find_package(GMP REQUIRED)
find_package(NTL REQUIRED)
find_package(Threads REQUIRED)
find_package(OpenMP REQUIRED)

add_library(psi_utils ./global/psi_utils.cpp ./global/psi_utils.h)
add_library(Keyholder ./server/Keyholder.h ./server/Keyholder.cpp)
add_library(Elementholder ./client/Elementholder.cpp ./client/Elementholder.h)
add_library(Recon ./client/Recon.cpp ./client/Recon.h)
add_library(client ./client/client.cpp ./client/client.h)

add_executable(server ./server/server.cpp)
target_link_libraries(server
        psi_utils
        Keyholder
        ${libhcs_LIBRARY}
        ${NTL_LIBRARY}
        ${GMP_LIBRARIES}
        Threads::Threads)

add_executable(benchmark ./benchmark/benchmark.cpp)
target_link_libraries(benchmark
        psi_utils
        Keyholder
        Elementholder
        Recon
        client
        ${libhcs_LIBRARY}
        ${NTL_LIBRARY}
        ${GMP_LIBRARIES}
        Threads::Threads
        OpenMP::OpenMP_CXX)

