cmake_minimum_required(VERSION 3.16)
project(qml_cpp_example LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)
find_package(Boost REQUIRED COMPONENTS system)

file(GLOB SRC "${CMAKE_SOURCE_DIR}/src/*.cpp" "${CMAKE_SOURCE_DIR}/src/*.hpp")

add_executable(qml_cpp_example
    ${SRC}
    "${CMAKE_SOURCE_DIR}/src/resources.qrc"
)

target_link_libraries(qml_cpp_example
    PRIVATE Qt6::Quick Boost::system
)
