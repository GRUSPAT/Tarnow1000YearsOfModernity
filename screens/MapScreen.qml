import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtLocation
import QtPositioning

Item {

    property color backgroundColor: "#F2F3F3"
    property color primaryColor: "#FCFCFC"
    property color textColor: "#000000"
    property color accentColor: "#5A8A98"

    Component.onCompleted: {
        homeButton.icon.color = textColor
        objectsButton.icon.color = textColor
        mapButton.icon.color = accentColor
        routesButton.icon.color = textColor
        settingsButton.icon.color = textColor
    }

    Map {
        id: map
        anchors.fill: parent
        //activeMapType: map.supportedMapTypes[1]

        minimumZoomLevel: 14
        maximumZoomLevel: 16

        zoomLevel: 15
        plugin: Plugin {
            name: "osm"
            PluginParameter {
               // name: "osm.mapping.providersrepository.address"
                 // value: "qrc:/"
                name: 'osm.mapping.offline.directory'
                value: 'qrc:/offline_tiles_2/'
            }
        }
        center: QtPositioning.coordinate(50.01, 20.98)

       // property geoCoordinate startCentroid

        PinchHandler {
            id: pinch
            target: null
            onActiveChanged: if (active) {
                                 map.startCentroid = map.toCoordinate(pinch.centroid.position, false)
                             }
            onScaleChanged: (delta) => {
                                map.zoomLevel += Math.log2(delta)
                                map.alignCoordinateToPoint(map.startCentroid, pinch.centroid.position)
                            }
            grabPermissions: PointerHandler.TakeOverForbidden
        }
        DragHandler {
            id: drag
            target: null
            onTranslationChanged: (delta) => map.pan(-delta.x, -delta.y)
        }
        Shortcut {
            enabled: map.zoomLevel < map.maximumZoomLevel
            sequence: StandardKey.ZoomIn
            onActivated: map.zoomLevel = Math.round(map.zoomLevel + 1)
        }
        Shortcut {
            enabled: map.zoomLevel > map.minimumZoomLevel
            sequence: StandardKey.ZoomOut
            onActivated: map.zoomLevel = Math.round(map.zoomLevel - 1)
        }
    }
}
