import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15

Item{
    width: rootWindow.width
    height: rootWindow.height
    Column{
        width: rootWindow.width
        height: rootWindow.height
        Text {
            id: firtsText
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignBottom
            leftPadding: 16
            bottomPadding: 8
            width: rootWindow.width
            height: 100
            text: "WPROWADZENIE"
            font.pixelSize: 24
        }
        SwipeView {
            id: idSwipeView
            width: rootWindow.width
            height: 260
            currentIndex: 0
            //anchors.horizontalCenter: parent.horizontalCenter
            //width: rootWindow.width
            //height: 120

            Item {
                id: firstPage
                width: idSwipeView.width
                height: idSwipeView.height
                Rectangle{
                    width: idSwipeView.width - 20
                    height: idSwipeView.height
                    color: "red"
                    radius: 20
                    anchors.leftMargin: 10
                    anchors.rightMargin: 10
                    anchors.horizontalCenter: parent.horizontalCenter
                    Column {
                        width: parent.width
                        height: parent.height
                        topPadding: 12
                        bottomPadding: 12
                        Rectangle {
                            id: imageRectangle
                            width: parent.width - 24
                            height: parent.height * 0.58
                            color: "blue"
                            radius: 20
                            anchors.margins: 12
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                        Text {
                            id: titleText
                            horizontalAlignment: Text.AlignLeft
                            verticalAlignment: Text.AlignTop
                            leftPadding: 14
                            rightPadding: 14
                            topPadding: 6
                            width: parent.width
                            height: 45
                            text: "Poznaj historię Tarnów 1000 lat Nowoczesności"
                            font.bold: true
                            font.pixelSize: 17
                            wrapMode: Text.WordWrap
                        }
                        RoundButton {
                            id: detailsButton
                            width: 110
                            height: 45
                            radius: 5
                            contentItem: Text {
                                text: "Więcej"
                                color: "white"
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                elide: Text.ElideRight
                                font.bold: true
                            }
                            background: Rectangle {
                                radius: detailsButton.radius
                                color: "blue"
                            }
                            anchors.right: parent.right
                            anchors.rightMargin: 8
                            anchors.bottomMargin: 8
                        }
                    }
                }
            }
            Item {
                id: secondPage
                width: idSwipeView.width
                height: idSwipeView.height
                Rectangle{
                    width: idSwipeView.width - 20
                    height: idSwipeView.height
                    color: "blue"
                    radius: 20
                    anchors.leftMargin: 10
                    anchors.rightMargin: 10
                    anchors.horizontalCenter: parent.horizontalCenter
                    Column {
                        width: parent.width
                        height: parent.height
                        topPadding: 12
                        bottomPadding: 12
                        Rectangle {
                            id: imageRectangleSecond
                            width: parent.width - 24
                            height: parent.height * 0.58
                            color: "red"
                            radius: 20
                            anchors.margins: 12
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                        Text {
                            id: titleTextSecond
                            horizontalAlignment: Text.AlignLeft
                            verticalAlignment: Text.AlignTop
                            topPadding: 6
                            leftPadding: 14
                            rightPadding: 14
                            width: parent.width
                            height: 45
                            text: "Odkryj twórczość Jana Głuszaka Dagamary"
                            font.bold: true
                            font.pixelSize: 17
                            wrapMode: Text.WordWrap
                        }
                        RoundButton {
                            id: detailsButtonSecond
                            width: 110
                            height: 45
                            radius: 5
                            contentItem: Text {
                                text: "Więcej"
                                color: "white"
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                elide: Text.ElideRight
                                font.bold: true
                            }
                            background: Rectangle {
                                radius: detailsButton.radius
                                color: "red"
                            }
                            anchors.right: parent.right
                            anchors.rightMargin: 8
                            anchors.bottomMargin: 8
                        }
                    }
                }
            }
        }
        PageIndicator {
            id: indicator
            count: idSwipeView.count
            currentIndex: idSwipeView.currentIndex
            anchors.horizontalCenter: idSwipeView.horizontalCenter
        }
        Text {
            id: secondText
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignBottom
            leftPadding: 16
            bottomPadding: 8
            width: rootWindow.width
            height: 50
            text: "POLECANE TRASY"
            font.pixelSize: 24
        }
        SwipeView {
            id: idSwipeViewSecond
            width: rootWindow.width * 0.5
            height: 260
            contentWidth: rootWindow.width
            currentIndex: 0
            //anchors.horizontalCenter: parent.horizontalCenter
            //width: rootWindow.width
            //height: 120

            Repeater {
                model: 3
                Item {
                    id: firstRoute
                    width: idSwipeViewSecond.width
                    height: idSwipeViewSecond.height
                    Rectangle{
                        width: idSwipeViewSecond.width - 20
                        height: firstRoute.height
                        color: "red"
                        radius: 20
                        anchors.leftMargin: 10
                        anchors.rightMargin: 10
                        //anchors.horizontalCenter: firstRoute.horizontalCenter
                    }
                }
            }
        }
        PageIndicator {
            id: indicatorSecond
            count: idSwipeViewSecond.count
            currentIndex: idSwipeViewSecond.currentIndex
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
