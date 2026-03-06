cmake_minimum_required(VERSION 3.16)
project(qml_cpp_example LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_CXX_STANDARD 23)

find_package(Qt6 REQUIRED COMPONENTS Quick)

add_executable(qml_cpp_example
    main.cpp
    resources.qrc
)

target_link_libraries(qml_cpp_example
    PRIVATE Qt6::Quick
)
