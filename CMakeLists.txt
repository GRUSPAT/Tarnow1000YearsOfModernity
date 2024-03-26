cmake_minimum_required(VERSION 3.16)

project(Tarnow1000YearsOfModernity VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTORCC ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick Qml Svg Location Positioning)

set(SOURCES main.cpp)
qt_add_big_resources(SOURCES resources.qrc)

list(APPEND SOURCES resources.qrc)
set_property(SOURCE resources.qrc PROPERTY SKIP_AUTORCC ON)

qt_standard_project_setup()

qt_add_executable(appTarnow1000YearsOfModernity
    main.cpp
    #resources.qrc
    MANUAL_FINALIZATION
    ${SOURCES}
)

if(APPLE)
    if(IOS)
        #Added name of app
        set_target_properties(appTarnow1000YearsOfModernity PROPERTIES OUTPUT_NAME "Tarnów 1000")
        #Added .xcassets with app icon and images
        set(asset_catalog_path "${CMAKE_CURRENT_SOURCE_DIR}/ios/Resources.xcassets")
        target_sources(appTarnow1000YearsOfModernity PRIVATE "${asset_catalog_path}")
        set_source_files_properties( ${asset_catalog_path} PROPERTIES
            MACOSX_PACKAGE_LOCATION Resources
        )
    #Added .plist; launchScreen; icon
    set_target_properties(appTarnow1000YearsOfModernity PROPERTIES
        MACOSX_BUNDLE_INFO_PLIST "${CMAKE_CURRENT_SOURCE_DIR}/ios/Info.cmake.ios.plist"
        QT_IOS_LAUNCH_SCREEN "${CMAKE_CURRENT_SOURCE_DIR}/ios/LaunchScreen.storyboard"
        XCODE_ATTRIBUTE_ASSETCATALOG_COMPILER_APPICON_NAME AppIcon
    )
else()
    #Added .plist for macos
    set_target_properties(appTarnow1000YearsOfModernity PROPERTIES
        MACOSX_BUNDLE_INFO_PLIST "${CMAKE_CURRENT_SOURCE_DIR}/Info.cmake.macos.plist"
    )
endif()
else()
    set_property(TARGET appTarnow1000YearsOfModernity APPEND PROPERTY
        QT_ANDROID_PACKAGE_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/android
    )
    qt_finalize_executable(appTarnow1000YearsOfModernity)
endif()

qt_add_qml_module(appTarnow1000YearsOfModernity
    URI Tarnow1000YearsOfModernity
    VERSION 1.0

    QML_FILES
    Main.qml

    RESOURCES
    Info.cmake.macos.plist
    ios/Info.cmake.ios.plist
    ios/LaunchScreen.storyboard
    #resources.qrc
)


# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appTarnow1000YearsOfModernity PROPERTIES
    #    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appTarnow1000YearsOfModernity
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appTarnow1000YearsOfModernity
    PRIVATE Qt6::Quick
    PRIVATE Qt6::Qml
    PRIVATE Qt6::Svg
    PRIVATE Qt6::Location
    PRIVATE Qt6::Positioning
)

include(GNUInstallDirs)
install(TARGETS appTarnow1000YearsOfModernity
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
