/*
    © 2024 Patryk Gruszowski, Michał Groński

    This file is part of Tarnow 1000 Years of Modernity.

    Tarnow 1000 Years of Modernity is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 3 of the License, or
    (at your option) any later version.

    Tarnow 1000 Years of Modernity is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Foobar.  If not, see <http://www.gnu.org/licenses/>.
*/
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import App 1.0

Item{
    width: rootWindow.width
    height: rootWindow.height
    Component.onCompleted: {
        homeButton.icon.color = Style.accentColor
        objectsButton.icon.color = Style.textColor
        mapButton.icon.color = Style.textColor
        routesButton.icon.color = Style.textColor
        settingsButton.icon.color = Style.textColor
    }
    Rectangle{
        anchors.fill: parent
        z:0
        color: Style.backgroundColor
    }
    Column{
        width: rootWindow.width
        height: rootWindow.height
        //spacing: 5
        Text {
            id: firtsText
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignBottom
            leftPadding: 16
            bottomPadding: 8
            width: rootWindow.width
            height: parent.height * 0.12
            text: rootWindow.selectedLanguage === "pl" ? "WPROWADZENIE" : "INTRODUCTION"
            font.pixelSize: 24
            font.family: Style.regular
        }
        SwipeView {
            id: idSwipeView
            width: rootWindow.width
            height: parent.height * 0.34
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
                    color: Style.primaryColor
                    radius: 20
                    anchors.leftMargin: 10
                    anchors.rightMargin: 10
                    anchors.horizontalCenter: parent.horizontalCenter
                    border.width: 1
                    border.color: Style.borderColor
                    Column {
                        width: parent.width
                        height: parent.height
                        topPadding: 12
                        bottomPadding: 12
                        Rectangle {
                            id: imageRectangle
                            width: parent.width - 24
                            height: parent.height * 0.6
                            radius: 20
                            anchors.horizontalCenter: parent.horizontalCenter
                            Image {
                                anchors.fill: parent
                                id: firstItemImage
                                source: "qrc:/images/main/main_1_miniature.png"
                            }
                        }
                        Text {
                            id: titleText
                            horizontalAlignment: Text.AlignLeft
                            verticalAlignment: Text.AlignTop
                            leftPadding: 14
                            rightPadding: 14
                            topPadding: 8
                            width: parent.width
                            text: rootWindow.selectedLanguage === "pl" ? "Poznaj historię Tarnów 1000 lat Nowoczesności" : "Explore the history of Tarnow 1000 Years of Modernity"
                            font.bold: true
                            font.pixelSize: 17
                            font.family: Style.bold
                            wrapMode: Text.WordWrap
                        }
                        RoundButton {
                            id: detailsButton
                            width: 110
                            height: parent.height * 0.16
                            anchors.right: parent.right
                            anchors.rightMargin: 8
                            anchors.bottomMargin: 8
                            radius: 5
                            contentItem: Text {
                                text: rootWindow.selectedLanguage === "pl" ? "Więcej" : "More"
                                color: Style.primaryColor
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                elide: Text.ElideRight
                                font.bold: true
                                font.family: Style.bold
                            }
                            background: Rectangle {
                                radius: detailsButton.radius
                                color: Style.accentColor
                                opacity: detailsButton.pressed ? 0.5 : 1.0
                            }
                            onClicked: {
                                mainNavBar.visible = false
                                slideAnimation.enabled = true
                                stackView.push("qrc:/screens/TarnowScreen.qml")
                            }
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
                    color: Style.primaryColor
                    radius: 20
                    anchors.leftMargin: 10
                    anchors.rightMargin: 10
                    anchors.horizontalCenter: parent.horizontalCenter
                    border.width: 1
                    border.color: Style.borderColor
                    Column {
                        width: parent.width
                        height: parent.height
                        topPadding: 12
                        bottomPadding: 12
                        Rectangle {
                            id: imageRectangleSecond
                            width: parent.width - 24
                            height: parent.height * 0.6
                            radius: 20
                            anchors.horizontalCenter: parent.horizontalCenter
                            Image {
                                anchors.fill: parent
                                id: secondItemImage
                                source: "qrc:/images/main/main_2_miniature.png"
                            }
                        }
                        Text {
                            id: titleTextSecond
                            horizontalAlignment: Text.AlignLeft
                            verticalAlignment: Text.AlignTop
                            leftPadding: 14
                            rightPadding: 14
                            topPadding: 8
                            width: parent.width
                            text: rootWindow.selectedLanguage === "pl" ? "Odkryj twórczość Jana Głuszaka Dagamary" : "Discover the work of Jan Glushak Dagamara"
                            font.bold: true
                            font.pixelSize: 17
                            font.family: Style.bold
                            wrapMode: Text.WordWrap
                        }
                        RoundButton {
                            id: detailsButtonSecond
                            width: 110
                            height: parent.height * 0.16
                            anchors.right: parent.right
                            anchors.rightMargin: 8
                            anchors.bottomMargin: 8
                            radius: 5
                            contentItem: Text {
                                text: rootWindow.selectedLanguage === "pl" ? "Więcej" : "More"
                                color: Style.primaryColor
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                elide: Text.ElideRight
                                font.bold: true
                                font.family: Style.bold
                            }
                            background: Rectangle {
                                radius: detailsButton.radius
                                color: Style.accentColor
                                opacity: detailsButtonSecond.pressed ? 0.5 : 1.0
                            }
                            onClicked: {
                                mainNavBar.visible = false
                                slideAnimation.enabled = true
                                stackView.push("qrc:/screens/DagaramaScreen.qml")
                            }
                        }
                    }
                }
            }
        }
        PageIndicator {
            topPadding: 10
            bottomPadding: 14
            id: indicator
            count: idSwipeView.count
            currentIndex: idSwipeView.currentIndex
            anchors.horizontalCenter: idSwipeView.horizontalCenter
            delegate: Rectangle {
                    implicitWidth: 8
                    implicitHeight: 8

                    radius: width / 2
                    color: Style.accentColor

                    opacity: index === indicator.currentIndex ? 0.95 : pressed ? 0.7 : 0.45

                    required property int index

                    Behavior on opacity {
                        OpacityAnimator {
                            duration: 100
                        }
                    }
                }
        }
        Text {
            id: secondText
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignBottom
            leftPadding: 16
            bottomPadding: 8
            width: parent.width
            height: parent.height * 0.04
            text: rootWindow.selectedLanguage === "pl" ? "POLECANE TRASY" : "RECOMMENDED ROUTES"
            font.pixelSize: 24
            font.family: Style.regular
        }
        SwipeView {
            id: idSwipeViewSecond
            width: parent.width
            height: parent.height * 0.29
            currentIndex: 0
            //contentWidth: rootWindow.width
            //anchors.horizontalCenter: parent.horizontalCenter
            //width: rootWindow.width
            //height: 120
            Item {
                id: firstRoute
                width: idSwipeViewSecond.width
                height: idSwipeViewSecond.height
                Row{
                    leftPadding: 10
                    rightPadding: 10
                    spacing: 10
                    Rectangle{
                        width: firstRoute.width * 0.5 - 15
                        height: firstRoute.height
                        color: Style.primaryColor
                        radius: 20
                        border.width: 1
                        border.color: Style.borderColor
                        Rectangle{
                            width: 63
                            height: 17
                            color: Style.accentColor
                            z:1
                            anchors.top: parent.top
                            anchors.topMargin: 5
                            anchors.horizontalCenter: parent.horizontalCenter
                            Text{
                                anchors.centerIn: parent
                                text: "Mościce"
                                font.pixelSize: 10
                                font.family: Style.bold
                                color: Style.primaryColor
                            }
                        }
                        Column{
                            topPadding: 13
                            rightPadding: 13
                            leftPadding: 13
                            width: parent.width
                            height: parent.height
                            spacing: 7
                            z:0
                            Rectangle{
                                id: imageContainer
                                width: parent.width - 26
                                height: parent.width - 26
                                border.width: 2
                                border.color: Style.accentColor
                                color: "transparent"
                                z:0
                                Image {
                                    anchors.centerIn: parent

                                    width: parent.width-4
                                    height: parent.width-4
                                    id: pathImageMini
                                    source: "qrc:/images/paths/path_example.png"
                                    z:0
                                }
                            }

                            Text{
                                text: rootWindow.selectedLanguage === "pl" ? "Przez wille w Mościcach" : "Through the villas of Mościce"
                                font.pixelSize: 12
                                font.family: Style.bold
                                wrapMode: Text.WordWrap
                            }
                            RoundButton{
                                width: parent.width * 0.5
                                height: parent.height * 0.13
                                anchors.horizontalCenter: parent.horizontalCenter
                                contentItem: Text {
                                    text: rootWindow.selectedLanguage === "pl" ? "Więcej" : "More"
                                    font.pixelSize: 12
                                    font.family: Style.bold
                                    color: Style.primaryColor
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                    elide: Text.ElideRight
                                }
                                background: Rectangle {
                                    anchors.fill: parent
                                    width: parent.width
                                    height: parent.height
                                    color: Style.accentColor
                                    radius: 3
                                }
                            }
                        }
                        // anchors.horizontalCenter: parent.horizontalCenter
                    }
                    Rectangle{
                        width: firstRoute.width * 0.5 - 15
                        height: firstRoute.height
                        color: Style.primaryColor
                        radius: 20
                        border.width: 1
                        border.color: Style.borderColor
                        Rectangle{
                            width: 63
                            height: 17
                            color: Style.accentColor
                            z:1
                            anchors.top: parent.top
                            anchors.topMargin: 5
                            anchors.horizontalCenter: parent.horizontalCenter
                            Text{
                                anchors.centerIn: parent
                                text: "Mościce"
                                font.pixelSize: 10
                                font.family: Style.bold
                                color: Style.primaryColor
                            }
                        }
                        Column{
                            topPadding: 13
                            rightPadding: 13
                            leftPadding: 13
                            width: parent.width
                            height: parent.height
                            spacing: 7
                            z:0
                            Rectangle{
                                width: parent.width - 26
                                height: parent.width - 26
                                border.width: 2
                                border.color: Style.accentColor
                                color: Style.backgroundColor
                                Image {
                                    anchors.centerIn: parent

                                    width: parent.width-4
                                    height: parent.width-4
                                    id: pathImageMini2
                                    source: "qrc:/images/paths/path_example.png"
                                    z:0
                                }
                            }
                            Text{
                                text: rootWindow.selectedLanguage === "pl" ? "Przez wille w Mościcach" : "Through the villas of Mościce"
                                font.pixelSize: 12
                                font.family: Style.bold
                                wrapMode: Text.WordWrap
                            }
                            RoundButton{
                                width: parent.width * 0.5
                                height: parent.height *0.13
                                anchors.horizontalCenter: parent.horizontalCenter
                                contentItem: Text {
                                    text: rootWindow.selectedLanguage === "pl" ? "Więcej" : "More"
                                    font.pixelSize: 12
                                    font.family: Style.bold
                                    color: Style.primaryColor
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                    elide: Text.ElideRight
                                }

                                background: Rectangle {
                                    anchors.fill: parent
                                    width: parent.width
                                    height: parent.height
                                    color: Style.accentColor
                                    radius: 3
                                }
                            }
                        }
                        // anchors.horizontalCenter: parent.horizontalCenter
                    }
                }

            }
            Item {
                id: secondRoute
                width: idSwipeViewSecond.width
                height: idSwipeViewSecond.height
                Row{
                    leftPadding: 10
                    rightPadding: 10
                    spacing: 10
                    Rectangle{
                        width: firstRoute.width * 0.5 - 15
                        height: firstRoute.height
                        color: Style.primaryColor
                        radius: 20
                        border.width: 1
                        border.color: Style.borderColor
                        Rectangle{
                            width: 63
                            height: 17
                            color: Style.accentColor
                            z:1
                            anchors.top: parent.top
                            anchors.topMargin: 5
                            anchors.horizontalCenter: parent.horizontalCenter
                            Text{
                                anchors.centerIn: parent
                                text: "Mościce"
                                font.pixelSize: 10
                                font.family: Style.bold
                                color: Style.primaryColor
                            }
                        }
                        Column{
                            topPadding: 13
                            rightPadding: 13
                            leftPadding: 13
                            width: parent.width
                            height: parent.height
                            spacing: 7
                            z:0
                            Rectangle{
                                id: imageContainer3
                                width: parent.width - 26
                                height: parent.width - 26
                                border.width: 2
                                border.color: Style.accentColor
                                color: "transparent"
                                z:0
                                Image {
                                    anchors.centerIn: parent

                                    width: parent.width-4
                                    height: parent.width-4
                                    id: pathImageMini3
                                    source: "qrc:/images/paths/path_example.png"
                                    z:0
                                }
                            }

                            Text{
                                text: rootWindow.selectedLanguage === "pl" ? "Przez wille w Mościcach" : "Through the villas of Mościce"
                                font.pixelSize: 12
                                font.family: Style.bold
                                wrapMode: Text.WordWrap
                            }
                            RoundButton{
                                width: parent.width * 0.5
                                height: parent.height * 0.13
                                anchors.horizontalCenter: parent.horizontalCenter
                                contentItem: Text {
                                    text: rootWindow.selectedLanguage === "pl" ? "Więcej" : "More"
                                    font.pixelSize: 12
                                    font.family: Style.bold
                                    color: Style.primaryColor
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                    elide: Text.ElideRight
                                }

                                background: Rectangle {
                                    anchors.fill: parent
                                    width: parent.width
                                    height: parent.height
                                    color: Style.accentColor
                                    radius: 3
                                }
                            }
                        }
                    }
                    Rectangle{
                        width: firstRoute.width * 0.5 - 15
                        height: firstRoute.height
                        color: Style.accentColor
                        radius: 20
                        border.width: 1
                        border.color: Style.borderColor
                        RoundButton{
                            anchors.fill: parent
                            contentItem: Text {
                                anchors.centerIn: parent
                                text: rootWindow.selectedLanguage === "pl" ? "Zobacz \n Wszystkie" : "See All"
                                font.pixelSize: 20
                                font.family: Style.bold
                                color: Style.primaryColor
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                elide: Text.ElideRight
                            }

                            background: Rectangle {
                                anchors.fill: parent
                                color: Style.accentColor
                                radius: 20
                            }
                            onClicked: stackView.push("qrc:/screens/RoutesScreen.qml")
                        }

                        // anchors.horizontalCenter: parent.horizontalCenter

                    }
                }
            }
        }
        PageIndicator {
            topPadding: 12
            id: indicatorSecond
            count: idSwipeViewSecond.count
            currentIndex: idSwipeViewSecond.currentIndex
            anchors.horizontalCenter: parent.horizontalCenter
            delegate: Rectangle {
                    implicitWidth: 8
                    implicitHeight: 8

                    radius: width / 2
                    color: Style.accentColor

                    opacity: index === indicatorSecond.currentIndex ? 0.95 : pressed ? 0.7 : 0.45

                    required property int index

                    Behavior on opacity {
                        OpacityAnimator {
                            duration: 100
                        }
                    }
                }
        }
    }
}
