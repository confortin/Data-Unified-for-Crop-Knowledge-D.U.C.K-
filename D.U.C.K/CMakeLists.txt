cmake_minimum_required(VERSION 3.16)

project(farmer_Duck VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Encontra os módulos necessários do Qt6
find_package(Qt6 REQUIRED COMPONENTS Core Quick Qml Core5Compat)

qt_standard_project_setup(REQUIRES 6.10)

qt_add_executable(appfarmer_Duck
    main.cpp
)

qt_add_qml_module(appfarmer_Duck
    URI farmer_Duck
    QML_FILES
        Main.qml
        BotoesFisicos.qml
        telas/TelaColheita.qml
        telas/TelaHome.qml
        telas/TelaGps.qml
        telas/TelaCLima.qml
        telas/TelaMaquina.qml
        telas/TelaVelocidade.qml
        telas/ShadowCard.qml
)

# Configurações para iOS/macOS
set_target_properties(appfarmer_Duck PROPERTIES
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

# Linka as bibliotecas necessárias
target_link_libraries(appfarmer_Duck
    PRIVATE Qt6::Quick Qt6::Core Qt6::Qml Qt6::Core5Compat
)

install(TARGETS appfarmer_Duck
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)