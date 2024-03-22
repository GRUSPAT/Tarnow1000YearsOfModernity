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

    Column {
        width: rootWindow.width
        height: rootWindow.height
        FontLoader {
            id: font
            source: "qrc:/fonts/Montserrat-Bold.ttf"
        }
        Rectangle {
            id: topBar
            width: rootWindow.width
            height: rootWindow.height * 0.12
            color: primaryColor
            z:1
            Row{
                height: topBar.height
                width: topBar.width
                topPadding: 36
                leftPadding: 20
                rightPadding: 20
                Rectangle{
                    anchors.bottom: parent.bottom
                    width: topBar.width * 0.65 - 20
                    height: topBar.height - 45
                    color: primaryColor
                    id: objekty
                    z:1
                    Text {
                        id:topBarLabel
                        anchors.leftMargin: 20
                        anchors.topMargin: 45
                        font.family: font.font.family
                        //    font.weight: font.font.weight
                        //   font.styleName: font.font.styleName
                        // font.family: font.name
                        text: rootWindow.selectedLanguage === "pl" ? "MAPA" : "MAP"
                        font.pixelSize: 32
                    }
                }
                Rectangle{
                    width: topBar.width * 0.35 - 20
                    height: topBar.height - 36
                    color: primaryColor
                    z:1
                    Image {
                        anchors.right: parent.right
                        id: topBarLogo
                        width: 93
                        height: 44
                        source: "qrc:/images/Tarnow1000LatLogo.png"
                    }
                }

                Component.onCompleted: {
                    homeButton.icon.color = textColor
                    objectsButton.icon.color = textColor
                    mapButton.icon.color = accentColor
                    routesButton.icon.color = textColor
                    settingsButton.icon.color = textColor
                }

            }
        }
        Map {
            id: map
            width: parent.width
            height: parent.height * 0.8
            anchors.horizontalCenter: parent.horizontalCenter
            activeMapType: map.supportedMapTypes[0]

            minimumZoomLevel: 13
            maximumZoomLevel: 15.5

            zoomLevel: rootWindow.lastMapZoom
            plugin: Plugin {
                name: "osm"
                PluginParameter {
                    name: 'osm.mapping.offline.directory'
                    value: ':/offline_tiles/'
                }
                PluginParameter{
                    name: "osm.mapping.providersrepository.disabled"
                    value: "true"
                }
            }

            center: rootWindow.lastMapCenter

            property geoCoordinate startCentroid
            property geoCoordinate maxTopLeft: QtPositioning.coordinate(50.0429, 20.8852)
            property geoCoordinate maxBottomRight: QtPositioning.coordinate(49.9583, 21.0167)
            property var region: QtPositioning.rectangle(maxTopLeft, maxBottomRight)

            PinchHandler {
                id: pinch
                target: null
                onActiveChanged: if (active) {
                                     map.startCentroid = map.toCoordinate(pinch.centroid.position, false)
                                 }
                onScaleChanged: (delta) => {
                                    if (map.zoomLevel + Math.log2(delta) < map.maximumZoomLevel){
                                        map.zoomLevel += Math.log2(delta)
                                    } else {
                                        map.zoomLevel = map.maximumZoomLevel
                                    }
                                    if (map.zoomLevel + Math.log2(delta) > map.minimumZoomLevel){
                                        map.zoomLevel += Math.log2(delta)
                                    } else {
                                        map.zoomLevel = map.minimumZoomLevel
                                    }
                                    map.alignCoordinateToPoint(map.startCentroid, pinch.centroid.position)
                                }
                onTranslationChanged: (delta) => {
                                          var topLeft = map.toCoordinate(Qt.point(0, 0), false)
                                          var bottomRight = map.toCoordinate(Qt.point(parseInt(map.width), parseInt(map.height)), false)
                                          var isTopLeftEdgeInRegion = map.region.contains(topLeft);
                                          var isBottomRightEdgeInRegion = map.region.contains(bottomRight);

                                          if (!isTopLeftEdgeInRegion){
                                              if(topLeft.longitude < map.maxTopLeft.longitude){
                                                  map.center.longitude += map.maxTopLeft.longitude - topLeft.longitude
                                              }
                                              if (topLeft.latitude > map.maxTopLeft.latitude){
                                                  map.center.latitude += map.maxTopLeft.latitude - topLeft.latitude
                                              }
                                          }
                                          if (!isBottomRightEdgeInRegion){
                                              if(bottomRight.longitude > map.maxBottomRight.longitude){
                                                  map.center.longitude += map.maxBottomRight.longitude - bottomRight.longitude
                                              }
                                              if (bottomRight.latitude < map.maxBottomRight.latitude){
                                                  map.center.latitude += map.maxBottomRight.latitude - bottomRight.latitude
                                              }
                                          }
                                      }
                grabPermissions: PointerHandler.TakeOverForbidden
                onTranslationChanged: (delta) => {
                                          var topLeft = map.toCoordinate(Qt.point(0, 0), false)
                                          var bottomRight = map.toCoordinate(Qt.point(parseInt(map.width), parseInt(map.height)), false)
                                          var isTopLeftEdgeInRegion = map.region.contains(topLeft);
                                          var isBottomRightEdgeInRegion = map.region.contains(bottomRight);

                                          if (!isTopLeftEdgeInRegion){
                                              if(topLeft.longitude < map.maxTopLeft.longitude){
                                                  map.center.longitude += map.maxTopLeft.longitude - topLeft.longitude
                                              }
                                              if (topLeft.latitude > map.maxTopLeft.latitude){
                                                  map.center.latitude += map.maxTopLeft.latitude - topLeft.latitude
                                              }
                                          }
                                          if (!isBottomRightEdgeInRegion){
                                              if(bottomRight.longitude > map.maxBottomRight.longitude){
                                                  map.center.longitude += map.maxBottomRight.longitude - bottomRight.longitude
                                              }
                                              if (bottomRight.latitude < map.maxBottomRight.latitude){
                                                  map.center.latitude += map.maxBottomRight.latitude - bottomRight.latitude
                                              }
                                          }
                                      }


            }
            DragHandler {
                id: drag
                target: null

                onTranslationChanged: (delta) => {
                                          var topLeft = map.toCoordinate(Qt.point(0, 0), false)
                                          var bottomRight = map.toCoordinate(Qt.point(parseInt(map.width), parseInt(map.height)), false)
                                          var isTopLeftEdgeInRegion = map.region.contains(topLeft);
                                          var isBottomRightEdgeInRegion = map.region.contains(bottomRight);

                                          if (!isTopLeftEdgeInRegion){
                                              if(topLeft.longitude < map.maxTopLeft.longitude){
                                                  map.center.longitude += map.maxTopLeft.longitude - topLeft.longitude
                                              }
                                              if (topLeft.latitude > map.maxTopLeft.latitude){
                                                  map.center.latitude += map.maxTopLeft.latitude - topLeft.latitude
                                              }
                                          }
                                          if (!isBottomRightEdgeInRegion){
                                              if(bottomRight.longitude > map.maxBottomRight.longitude){
                                                  map.center.longitude += map.maxBottomRight.longitude - bottomRight.longitude
                                              }
                                              if (bottomRight.latitude < map.maxBottomRight.latitude){
                                                  map.center.latitude += map.maxBottomRight.latitude - bottomRight.latitude
                                              }
                                          }
                                          map.pan(-delta.x, -delta.y);
                                      }
            }
            onCenterChanged: {
                rootWindow.lastMapCenter = center
            }
            onZoomLevelChanged: {
                rootWindow.lastMapZoom = map.zoomLevel
            }
        }
    }
}

