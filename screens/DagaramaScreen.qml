import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15

Item {
    property color backgroundColor: "#F2F3F3"
    property color primaryColor: "#FCFCFC"
    property color textColor: "#000000"
    property color accentColor: "#5A8A98"

    Column {
        width: rootWindow.width
        height: rootWindow.height
        bottomPadding: rootWindow.height * 0.07
        FontLoader {
            id: font
            source: "qrc:/fonts/Montserrat-Bold.ttf"
        }
        Rectangle {
            id: topBar
            width: rootWindow.width
            height: rootWindow.height * 0.1
            color: primaryColor
            z:1
            Row{
                height: topBar.height * 0.5
                width: topBar.width
                topPadding: 36
                leftPadding: 20
                rightPadding: 20
                Rectangle{
                    anchors.bottom: parent.bottom
                    width: topBar.width * 0.65 - 20
                    height: topBar.height * 0.5 - 45
                    color: primaryColor
                    id: objekty
                    z:1
                    Text {
                        id:topBarLabel
                        anchors.leftMargin: 20
                        anchors.topMargin: 45
                        font.family: font.font.family
                        text: rootWindow.selectedLanguage === "pl" ? "Jan Głuszak Dagarama" : "Jan Głuszak Dagarama"
                        font.pixelSize: 20
                    }
                }
                Rectangle{
                    width: topBar.width * 0.35 - 20
                    height: topBar.height * 0.5 - 36
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
            }
        }
        Rectangle {
            width: rootWindow.width
            height: 1
            color: "black"
        }
        ScrollView{
            id: jakies
            width: rootWindow.width
            height: rootWindow.height *0.73
            contentHeight: rowcontent.height
            //clip: true
            ScrollBar.vertical.policy: ScrollBar.AlwaysOn

            Row{
                id: rowcontent
                width: rootWindow.width-198
                height: 2000
                spacing: 0

                Column{
                    width: rootWindow.width* 0.5 -9
                    height: parent.height
                    spacing: 9

                    Repeater{
                        width: parent.width
                        model: 8
                        Image{
                            width: rootWindow.width* 0.5 -9
                            source: `qrc:/images/dagarama/${index + 1}`
                            fillMode: Image.PreserveAspectFit
                        }
                    }

                }
                Column{
                    width: rootWindow.width* 0.5 -9
                    height: parent.height
                    spacing: 9

                    Repeater{
                        width: parent.width
                        model: 10
                        Image{
                            width: rootWindow.width* 0.5 -9
                            source: `qrc:/images/dagarama/${index + 9}`
                            fillMode: Image.PreserveAspectFit
                        }
                    }

                }
            }
        }

    }
}
