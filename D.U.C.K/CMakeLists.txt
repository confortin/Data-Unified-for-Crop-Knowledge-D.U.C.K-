cmake_minimum_required(VERSION 3.16)

project(farmer_Duck VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.10)

qt_add_executable(appfarmer_Duck
    main.cpp
)

qt_add_qml_module(appfarmer_Duck
    URI farmer_Duck
    QML_FILES
        Main.qml
        QML_FILES BotoesFisicos.qml
        QML_FILES
        RESOURCES
        QML_FILES telas/TelaColheita.qml
        QML_FILES telas/TelaHome.qml
        QML_FILES telas/TelaGps.qml
        QML_FILES telas/TelaCLima.qml
        QML_FILES telas/TelaMaquina.qml
        QML_FILES telas/TelaVelocidade.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appfarmer_Duck PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appfarmer_Duck
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appfarmer_Duck
    PRIVATE Qt6::Quick
)

install(TARGETS appfarmer_Duck
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
