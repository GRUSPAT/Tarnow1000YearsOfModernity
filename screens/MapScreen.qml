import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtLocation
import QtPositioning

Item {
    Map {
        id: map
        anchors.fill: parent
        activeMapType: map.supportedMapTypes[1]
        zoomLevel: 1
        plugin: Plugin {
            name: "osm"
            PluginParameter {
                name: 'osm.mapping.offline.directory'
                value: ':/offline_tiles/'
            }
        }
        //center: QtPositioning.coordinate(50.01, 20.98)

        property geoCoordinate startCentroid

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
