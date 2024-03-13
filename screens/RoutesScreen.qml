import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15

Item {
    Column{
        width: rootWindow.width
        height: rootWindow.height
        Rectangle{
            anchors.topMargin: 10
            width: rootWindow.width
            height: rootWindow.height * 0.1
            color: "red"
            Row{
                width: parent.width
                height: parent.height
                spacing: 150
                Text {
                    id:topBarLabel
                    anchors.leftMargin: 10
                    anchors.bottom: parent.bottom
                    width: parent.width * 0.5 - 10
                    height: parent.height
                    text: "TRASY"
                    font.pixelSize: 24
                }
                Image {
                    id: topBarLogo
                    anchors.rightMargin: 10
                    anchors.bottom: parent.bottom
                    width: 50
                    height: 50
                    source: "qrc:/images/AppIcon.png"
                }
            }
        }
        ListView {
            width: parent.width
            height: parent.height
            model: rootWindow.jsonRoutes.routes_pl
            spacing: 10

            delegate:
                Rectangle{
                width: parent.width - 40
                height: 200
                anchors.margins: 20
                anchors.horizontalCenter: parent.horizontalCenter
                radius: 20
                color: "blue"
                Column{
                    width: parent.width
                    height: parent.height
                    Image {
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: 300
                        height: 100
                        id: objectImage
                        source: "qrc:/images/AppIcon.png"
                    }
                    Text{
                        width: parent.width - 50
                        height: 40
                        text: `${modelData.name}`
                    }
                    Row{
                        width: parent.width - 50
                        height: 40
                        spacing: 20
                        Button{
                            anchors.verticalCenter: parent.verticalCenter
                            text: "Więcej"
                        }
                        Button{
                            anchors.verticalCenter: parent.verticalCenter
                            text: "Nawiguj po trasie"
                        }
                    }
                }
            }
        }
    }
}
