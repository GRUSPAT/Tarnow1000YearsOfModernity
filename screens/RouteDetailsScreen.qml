import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtPositioning

Item {
    id: detailsRouteWindow
    property color backgroundColor: "#F2F3F3"
    property color primaryColor: "#FCFCFC"
    property color textColor: "#000000"
    property color accentColor: "#5A8A98"

    property var modelData

    Column {
        width: rootWindow.width
        height: rootWindow.height
        bottomPadding: rootWindow.height * 0.095
        spacing: -20
        FontLoader {
            id: font
            source: "qrc:/fonts/Montserrat-Bold.ttf"
        }
        Rectangle{
            id: imagesRectangle
            width: parent.width
            height: parent.height * 0.35
            color: primaryColor
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
                        width: imagesSwipeView.width
                        height: imagesSwipeView.height
                        fillMode: Image.PreserveAspectCrop
                        clip:true
                        asynchronous: true
                        source: `qrc:/images/objects/${modelData}/1`
                        onStatusChanged: {
                            if(status === Image.Ready){
                                loadingImage.visible = false
                            }
                        }
                    }
                }
            }
            BusyIndicator {
                id: loadingImage
                anchors.centerIn: parent
                width: 40
                height: 40
                running: true
                z:1
            }
            PageIndicator {
                id: indicator
                bottomPadding: 25
                count: imagesSwipeView.count
                currentIndex: imagesSwipeView.currentIndex
                anchors.horizontalCenter: imagesSwipeView.horizontalCenter
                anchors.bottom: parent.bottom
                visible: modelData.photos.length > 1 ? true : false
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
                        secondNavBar.visible = false
                        mainNavBar.visible = true
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
                height: parent.height - rootWindow.height * 0.095 + 20
                contentHeight: nameRectangle.height + descriptionText.contentHeight + 60
                ScrollBar.vertical.policy: ScrollBar.AlwaysOff
                Column{
                    width: parent.width - 64
                    height: parent.height
                    padding: 32
                    Rectangle{
                        id: nameRectangle
                        width: parent.width
                        height: labelText.contentHeight + 20
                        color: primaryColor
                        Text {
                            id: labelText
                            anchors.fill: parent
                            text: `${modelData.name}`
                            wrapMode: Text.WordWrap
                            font.family: font.font.family
                            font.pixelSize: 22
                            color: textColor
                        }
                    }
                    Rectangle{
                        id: descriptionRectangle
                        width: parent.width
                        height: parent.height * 0.5
                        color: primaryColor
                        Text {
                            id: descriptionText
                            anchors.fill: parent
                            text: `${modelData.description}`
                            wrapMode: Text.WordWrap
                            font.family: font.font.family
                            font.pixelSize: 13
                            color: textColor
                            lineHeight: 20
                            lineHeightMode: Text.FixedHeight
                            horizontalAlignment: Text.AlignJustify
                            verticalAlignment: Text.AlignTop
                        }
                    }
                }
            }
            Rectangle{
                id: secondNavBar
                anchors{
                    //margins: 0
                    horizontalCenter: parent.horizontalCenter
                    bottom: parent.bottom
                }
                height: parent.height * 0.095 + 8
                width: parent.width
                z:1
                color: "white"
                Rectangle{
                    anchors.margins: 0
                    z:1
                    //anchors.top: parent.top
                    height: 1
                    width: parent.width
                    color: "#C5C5C5"
                }

                Rectangle{
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: parent.width
                    height: parent.height * 0.85
                    color: "transparent"
                    Button{
                        id: secondNavigateButton
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        width: parent.width * 0.34
                        height: 32
                        contentItem: Row{
                            anchors.horizontalCenter: parent.horizontalCenter
                            width: parent.width
                            height: parent.height
                            leftPadding: 2
                            spacing: 16
                            IconImage {
                                anchors.verticalCenter: parent.verticalCenter
                                width: 18
                                height: 18
                                source: "qrc:/icons/NavigateIcon.svg"
                                color: primaryColor
                            }
                            Text {
                                anchors.verticalCenter: parent.verticalCenter
                                text: rootWindow.selectedLanguage === "pl" ? "Nawiguj" : "Navigate"
                                font.pixelSize: 11
                                font.family: font.name
                                color: primaryColor
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                elide: Text.ElideRight
                            }
                        }
                        background: Rectangle {
                            anchors.fill: parent
                            implicitWidth: parent.width
                            implicitHeight: parent.height
                            color: accentColor
                            radius: 5
                            opacity: secondNavigateButton.pressed ? 0.5 : 1.0
                        }
                        onClicked: {
                            Qt.openUrlExternally(`https://www.google.com/maps/dir/?api=1&destination=${detailsRouteWindow.modelData.destination}&waypoints=${detailsRouteWindow.modelData.waypoints}&travelmode=walking`)
                        }
                    }
                }
            }
        }
    }
}
