import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15

Item{
    width: rootWindow.width
    height: rootWindow.height
    property color backgroundColor: "#F2F3F3"
    property color primaryColor: "#FCFCFC"
    property color textColor: "#000000"
    property color accentColor: "#5A8A98"
    property color borderColor: "#C5C5C5"

    Component.onCompleted: {
        homeButton.icon.color = accentColor
        objectsButton.icon.color = textColor
        mapButton.icon.color = textColor
        routesButton.icon.color = textColor
        settingsButton.icon.color = textColor
    }

    Rectangle{
        anchors.fill: parent
        z:0
        color: backgroundColor
    }
    Column{
        FontLoader { id: font; source: "qrc:/fonts/Montserrat-Bold.ttf" }
        //FontLoader { id: font22; source: "qrc:/fonts/Montserrat-VariableFont_wght.ttf" }
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
            height: 100
            text: rootWindow.selectedLanguage === "pl" ? "WPROWADZENIE" : "INTRODUCTION"
            font.pixelSize: 24
            //font.weight: 900
            font.family: font.font.family
        }
        SwipeView {
            id: idSwipeView
            width: rootWindow.width
            height: 300
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
                    color: primaryColor
                    radius: 20
                    anchors.leftMargin: 10
                    anchors.rightMargin: 10
                    anchors.horizontalCenter: parent.horizontalCenter
                    border.width: 1
                    border.color: borderColor
                    Column {
                        width: parent.width
                        height: parent.height
                        topPadding: 12
                        bottomPadding: 12
                        spacing: 8
                        Rectangle {
                            id: imageRectangle
                            width: parent.width - 24
                            height: parent.height * 0.58
                            color: "blue"
                            radius: 20
                           // anchors.margins: 12
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
                            topPadding: 6
                            width: parent.width
                            height: 45
                            text: rootWindow.selectedLanguage === "pl" ? "Poznaj historię Tarnów 1000 lat Nowoczesności" : "Explore the history of Tarnow 1000 Years of Modernity"
                            font.bold: true
                            font.pixelSize: 17
                            font.family: font.font.family
                            wrapMode: Text.WordWrap
                        }
                        RoundButton {
                            id: detailsButton
                            width: 110
                            height: 45
                            radius: 5
                            contentItem: Text {
                                text: rootWindow.selectedLanguage === "pl" ? "Więcej" : "More"
                                color: primaryColor
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                elide: Text.ElideRight
                                font.bold: true
                                font.family: font.font.family
                            }
                            background: Rectangle {
                                radius: detailsButton.radius
                                color: accentColor
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
                    color: primaryColor
                    radius: 20
                    anchors.leftMargin: 10
                    anchors.rightMargin: 10
                    anchors.horizontalCenter: parent.horizontalCenter
                    border.width: 1
                    border.color: borderColor
                    Column {
                        width: parent.width
                        height: parent.height
                        topPadding: 12
                        bottomPadding: 12
                        spacing: 8
                        Rectangle {
                            id: imageRectangleSecond
                            width: parent.width - 24
                            height: parent.height * 0.58
                            color: "red"
                            radius: 20
                            anchors.margins: 12
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
                            topPadding: 6
                            leftPadding: 14
                            rightPadding: 14
                            width: parent.width
                            height: 45
                            text: rootWindow.selectedLanguage === "pl" ? "Odkryj twórczość Jana Głuszaka Dagamary" : "Discover the work of Jan Glushak Dagamara"
                            font.bold: true
                            font.pixelSize: 17
                            font.family: font.font.family
                            wrapMode: Text.WordWrap
                        }
                        RoundButton {
                            id: detailsButtonSecond
                            width: 110
                            height: 45
                            radius: 5
                            contentItem: Text {
                                text: rootWindow.selectedLanguage === "pl" ? "Więcej" : "More"
                                color: primaryColor
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                elide: Text.ElideRight
                                font.bold: true
                                font.family: font.font.family
                            }
                            background: Rectangle {
                                radius: detailsButton.radius
                                color: accentColor
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
            topPadding: 30
            bottomPadding: 30
            id: indicator
            count: idSwipeView.count
            currentIndex: idSwipeView.currentIndex
            anchors.horizontalCenter: idSwipeView.horizontalCenter
            delegate: Rectangle {
                    implicitWidth: 8
                    implicitHeight: 8

                    radius: width / 2
                    color: accentColor

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
            width: rootWindow.width
            height: 50
            text: rootWindow.selectedLanguage === "pl" ? "POLECANE TRASY" : "RECOMMENDED ROUTES"
            font.pixelSize: 24
            font.family: font.font.family
        }
        SwipeView {
            id: idSwipeViewSecond
            width: rootWindow.width
            height: 260
            contentWidth: rootWindow.width
            currentIndex: 0
            //anchors.horizontalCenter: parent.horizontalCenter
            //width: rootWindow.width
            //height: 120


            Item {
                id: firstRoute
                width: idSwipeViewSecond.width * 0.5
                height: idSwipeViewSecond.height
                Row{
                    leftPadding: 10
                    rightPadding: 10
                    spacing: 10
                    Rectangle{
                        width: firstRoute.width *0.5 - 15
                        height: firstRoute.height
                        color: primaryColor
                        radius: 20
                        border.width: 1
                        border.color: borderColor
                        Rectangle{
                            width: 63
                            height: 17
                            color: accentColor
                            z:1
                            anchors.top: parent.top
                            anchors.topMargin: 5
                            anchors.horizontalCenter: parent.horizontalCenter
                            Text{
                                anchors.centerIn: parent
                                text: "Mościce"
                                font.pixelSize: 10
                                font.family: font.font.family
                                color: primaryColor
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
                                border.color: accentColor
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
                                font.family: font.font.family
                            }
                            RoundButton{
                                width: parent.width * 0.5
                                height: parent.height *0.13
                                anchors.horizontalCenter: parent.horizontalCenter
                                contentItem: Text {
                                    text: rootWindow.selectedLanguage === "pl" ? "Więcej" : "More"
                                    font.pixelSize: 12
                                    font.family: font.name
                                    color: primaryColor
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                    elide: Text.ElideRight
                                }

                                background: Rectangle {
                                    anchors.fill: parent
                                    width: parent.width
                                    height: parent.height
                                    color: accentColor
                                    radius: 3
                                }
                            }
                        }

                        // anchors.horizontalCenter: parent.horizontalCenter
                    }
                    Rectangle{
                        width: firstRoute.width *0.5 - 15
                        height: firstRoute.height
                        color: primaryColor
                        radius: 20
                        border.width: 1
                        border.color: borderColor
                        Rectangle{
                            width: 63
                            height: 17
                            color: accentColor
                            z:1
                            anchors.top: parent.top
                            anchors.topMargin: 5
                            anchors.horizontalCenter: parent.horizontalCenter
                            Text{
                                anchors.centerIn: parent
                                text: "Mościce"
                                font.pixelSize: 10
                                font.family: font.font.family
                                color: primaryColor
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
                                border.color: accentColor
                                color: backgroundColor
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
                                text: "Przez mościckie wille"
                                font.pixelSize: 12
                                font.family: font.font.family
                            }
                            RoundButton{
                                width: parent.width * 0.5
                                height: parent.height *0.13
                                anchors.horizontalCenter: parent.horizontalCenter
                                contentItem: Text {
                                    text: rootWindow.selectedLanguage === "pl" ? "Więcej" : "More"
                                    font.pixelSize: 12
                                    font.family: font.name
                                    color: primaryColor
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                    elide: Text.ElideRight
                                }

                                background: Rectangle {
                                    anchors.fill: parent
                                    width: parent.width
                                    height: parent.height
                                    color: accentColor
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
                width: idSwipeViewSecond.width * 0.5
                height: idSwipeViewSecond.height
                Row{
                    leftPadding: 10
                    rightPadding: 10
                    spacing: 10
                    Rectangle{
                        width: firstRoute.width *0.5 - 15
                        height: firstRoute.height
                        color: primaryColor
                        radius: 20
                        border.width: 1
                        border.color: borderColor
                        Rectangle{
                            width: 63
                            height: 17
                            color: accentColor
                            z:1
                            anchors.top: parent.top
                            anchors.topMargin: 5
                            anchors.horizontalCenter: parent.horizontalCenter
                            Text{
                                anchors.centerIn: parent
                                text: "Mościce"
                                font.pixelSize: 10
                                font.family: font.font.family
                                color: primaryColor
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
                                border.color: accentColor
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
                                font.family: font.font.family
                            }
                            RoundButton{
                                width: parent.width * 0.5
                                height: parent.height *0.13
                                anchors.horizontalCenter: parent.horizontalCenter
                                contentItem: Text {
                                    text: rootWindow.selectedLanguage === "pl" ? "Więcej" : "More"
                                    font.pixelSize: 12
                                    font.family: font.name
                                    color: primaryColor
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                    elide: Text.ElideRight
                                }

                                background: Rectangle {
                                    anchors.fill: parent
                                    width: parent.width
                                    height: parent.height
                                    color: accentColor
                                    radius: 3
                                }
                            }
                        }
                    }
                    Rectangle{
                        width: firstRoute.width *0.5 - 15
                        height: firstRoute.height
                        color: accentColor
                        radius: 20
                        border.width: 1
                        border.color: borderColor
                        RoundButton{
                            anchors.fill: parent
                            contentItem: Text {
                                anchors.centerIn: parent
                                text: rootWindow.selectedLanguage === "pl" ? "Zobacz \n Wszystkie" : "See All"
                                font.pixelSize: 20
                                font.family: font.name
                                color: primaryColor
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                elide: Text.ElideRight
                            }

                            background: Rectangle {
                                anchors.fill: parent
                                color: accentColor
                                radius: 20
                            }
                        }

                        // anchors.horizontalCenter: parent.horizontalCenter

                    }
                }
            }
        }
        PageIndicator {
            topPadding: 30
            id: indicatorSecond
            count: idSwipeViewSecond.count
            currentIndex: idSwipeViewSecond.currentIndex
            anchors.horizontalCenter: parent.horizontalCenter
            delegate: Rectangle {
                    implicitWidth: 8
                    implicitHeight: 8

                    radius: width / 2
                    color: accentColor

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
