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
            height: parent.height * 0.35
            SwipeView{
                id: imagesSwipeView
                width: parent.width
                height: parent.height
                currentIndex: 0
                Repeater{
                    width: parent.width
                    height: parent.height
                    model: modelData.photos
                    Image {
                        id: objectImage
                        //anchors.fill: imagesSwipeView
                        width: imagesSwipeView.width
                        height: imagesSwipeView.height
                        fillMode: Image.PreserveAspectCrop
                        clip:true
                        source: "qrc:/images/objects/object_1/miniature_1.png"
                    }
                }
            }
            PageIndicator {
                id: indicator
                bottomPadding: 10
                count: imagesSwipeView.count
                currentIndex: imagesSwipeView.currentIndex
                anchors.horizontalCenter: imagesSwipeView.horizontalCenter
                anchors.bottom: parent.bottom
                delegate: Rectangle {
                    implicitWidth: index === indicator.currentIndex ? 20 : 8
                    implicitHeight: 8

                    radius: width / 2
                    color: index === indicator.currentIndex ? accentColor : primaryColor

                    opacity: 1

                    required property int index

                    Behavior on implicitWidth {
                        NumberAnimation {
                            duration: 400
                            easing.type: Easing.InOutQuad
                        }
                    }
                }
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
                        slideAnimation.enabled = false
                        stackView.pop()
                    }
                }
            }
        }
        Rectangle {
            width: rootWindow.width
            height: rootWindow.height * 0.65
            color: primaryColor
            radius: 20
            ScrollView {
                id: objectDataScroll
                width: parent.width
                height: parent.height - rootWindow.height * 0.07
                ScrollBar.vertical.policy: ScrollBar.AlwaysOff
                Column{
                    width: parent.width - 64
                    height: parent.height
                    padding: 32
                    Rectangle{
                        width: parent.width
                        height: 50
                        color: primaryColor
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
                        height: 400
                        color: primaryColor
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
}
