import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15

Item {
    property color backgroundColor: "#F2F3F3"
    property color primaryColor: "#FCFCFC"
    property color textColor: "#000000"
    property color accentColor: "#5A8A98"

    Rectangle{
        anchors.fill: parent
        z:0
        color: backgroundColor
    }
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
                        text: rootWindow.selectedLanguage === "pl" ? "Jan Głuszak Dagarama" : "Jan Głuszak Dagarama"
                        font.pixelSize: 20
                    }
                }
                Rectangle{
                    width: topBar.width * 0.35 - 20
                    height: topBar.height - 45
                    anchors.bottom: parent.bottom
                    color: primaryColor
                    z:1
                    RoundButton{
                        id: closeButton
                        width: 40
                        height: 40
                        anchors.right: parent.right
                        anchors.topMargin: 45
                        contentItem: IconImage {
                            anchors.centerIn: parent
                            width: 34
                            height: 34
                            color: primaryColor
                            source: "qrc:/icons/CloseIcon.svg"
                        }
                        background: Rectangle {
                            color: accentColor
                            radius: 5
                            opacity: closeButton.pressed ? 0.5 : 1.0
                        }
                        onClicked: {
                            mainNavBar.visible = true
                            slideAnimation.enabled = false
                            stackView.pop()
                        }
                    }
                }
            }
        }
        ScrollView{
            id: jakies
            width: rootWindow.width
            height: rootWindow.height * 0.88
            contentHeight: rowcontent.height
            //clip: true
            ScrollBar.vertical.policy: ScrollBar.AlwaysOn

            Row{
                id: rowcontent
                width: rootWindow.width - 198
                height: 2000
                spacing: 0

                Column{
                    width: rootWindow.width * 0.5 - 9
                    height: parent.height
                    spacing: 9

                    Repeater{
                        width: parent.width
                        model: 8
                        Image{
                            width: rootWindow.width* 0.5 - 9
                            source: `qrc:/images/dagarama/${index + 1}`
                            fillMode: Image.PreserveAspectFit
                        }
                    }
                }
                Column{
                    width: rootWindow.width * 0.5 - 9
                    height: parent.height
                    spacing: 9

                    Repeater{
                        width: parent.width
                        model: 10
                        Image{
                            width: rootWindow.width* 0.5 - 9
                            source: `qrc:/images/dagarama/${index + 9}`
                            fillMode: Image.PreserveAspectFit
                        }
                    }
                }
            }
        }
    }
}
