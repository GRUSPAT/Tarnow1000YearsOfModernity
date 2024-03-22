import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15

Item {
    property color backgroundColor: "#F2F3F3"
    property color primaryColor: "#FCFCFC"
    property color textColor: "#000000"
    property color accentColor: "#5A8A98"

    property var modelData

    Column {
        width: rootWindow.width
        height: rootWindow.height
        bottomPadding: rootWindow.height * 0.07
        FontLoader {
            id: font
            source: "qrc:/fonts/Montserrat-Bold.ttf"
        }
        Rectangle{
            width: parent.width
            height: parent.height * 0.55
            Image {
                id: objectImage
                anchors.fill: parent
                width: parent.width
                height: parent.height
                fillMode: Image.PreserveAspectCrop
                clip:true
                source: "qrc:/images/objects/object_1/miniature_1.png"
            }
            Row{
                width: parent.width
                height: parent.height
                anchors.fill: parent
                z:1
                topPadding: 35
                leftPadding: 340
                RoundButton{
                    id: closeButton
                    width: 40
                    height: 40
                    contentItem: Text {
                        text: "X"
                        font.family: font.font.family
                        font.pixelSize: 20
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        color: primaryColor
                    }
                    background: Rectangle {
                        color: accentColor
                        radius: 5
                        opacity: closeButton.pressed ? 0.5 : 1.0
                    }
                    onClicked: {
                        stackView.pop()
                    }
                }
            }
        }
        Rectangle {
            width: rootWindow.width
            height: rootWindow.height * 0.45
            color: primaryColor
            radius: 20

            Column{
                width: parent.width - 64
                height: parent.height
                padding: 32
                Rectangle{
                    width: parent.width
                    height: 50
                    Text {
                        anchors.fill: parent
                        text: `${modelData.name}`
                        wrapMode: Text.WordWrap
                        font.family: font.font.family
                        font.pixelSize: 16
                        color: textColor
                    }
                }
                Rectangle{
                    width: parent.width
                    height: 40
                    Row{
                        width: parent.width
                        height: parent.height
                        IconImage {
                            anchors.verticalCenter: parent.verticalCenter
                            width: 20
                            height: 20
                            source: "qrc:/icons/SettingsIcon.svg"
                        }
                        Text {
                            anchors.verticalCenter: parent.verticalCenter
                            text: `${modelData.address}`
                            font.family: font.name
                            font.pixelSize: 10
                            color: textColor
                        }
                    }
                }
                Rectangle{
                    width: parent.width
                    height: 400
                    Text {
                        anchors.fill: parent
                        text: `${modelData.description}`
                        wrapMode: Text.WordWrap
                        font.family: font.font.family
                        font.pixelSize: 11
                        color: textColor
                        horizontalAlignment: Text.AlignJustify
                        verticalAlignment: Text.AlignTop
                    }
                }
            }
        }
    }
}
