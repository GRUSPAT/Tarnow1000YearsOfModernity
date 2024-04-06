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

Item {
    Rectangle{
        anchors.fill: parent
        z:0
        color: Style.backgroundColor
    }
    Column {

        Component.onCompleted: {
            homeButton.icon.color = Style.textColor
            objectsButton.icon.color = Style.textColor
            mapButton.icon.color = Style.textColor
            routesButton.icon.color = Style.accentColor
            settingsButton.icon.color = Style.textColor
        }
        width: rootWindow.width
        height: rootWindow.height
        Rectangle {
            id: topBar
            width: rootWindow.width
            height: rootWindow.height * 0.12
            color: Style.primaryColor
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
                    color: Style.primaryColor
                    id: objekty
                    z:1
                    Text {
                        id:topBarLabel
                        anchors.leftMargin: 20
                        anchors.topMargin: 45
                        font.family: Style.bold
                        text: rootWindow.selectedLanguage === "pl" ? "TRASY" : "ROUTES"
                        font.pixelSize: 32
                    }
                }
                Rectangle{
                    width: topBar.width * 0.35 - 20
                    height: topBar.height - 36
                    color: Style.primaryColor
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
        ScrollView {
            width: parent.width
            height: parent.height - rootWindow.height * 0.07
            leftPadding: 20
            topPadding: 10
            bottomPadding: 180
            contentWidth: parent.width - 20
            contentHeight: objectsList.height
            //ScrollBar.vertical.policy: ScrollBar.AlwaysOn
            ListView {
                id: objectsList
                width: parent.width
                model: rootWindow.selectedLanguage === "pl" ? rootWindow.jsonRoutes.routes_pl : rootWindow.jsonRoutes.routes_en
                spacing: 12

                delegate:
                    Rectangle{
                    id:objectCard
                    width: objectsList.width - 20
                    height: 252
                    radius: 20
                    color: Style.primaryColor
                    border.width: 1
                    border.color: Style.borderColor
                    /*Image {
                        id: objectBG
                        source: "qrc:/images/objects/objectBG.svg"
                        anchors.fill: parent
                        width: parent.width
                        height: parent.height
                    }*/
                    Rectangle{
                        width: 104
                        height: 18
                        color: Style.accentColor
                        z:1
                        radius: 4
                        anchors.top: parent.top
                        anchors.topMargin: 8
                        anchors.horizontalCenter: parent.horizontalCenter
                        Text{
                            anchors.centerIn: parent
                            text: `${modelData.location}`
                            font.pixelSize: 10
                            font.family: Style.bold
                            color: Style.primaryColor
                        }
                    }
                    Column{
                        width: parent.width
                        height: parent.height
                        topPadding: 16
                        leftPadding: 16
                        rightPadding: 16
                        Rectangle{
                            id: imageContainer
                            width: parent.width - 32
                            height: parent.width * 0.45
                            border.width: 2
                            border.color: Style.accentColor
                            color: "transparent"
                            z:0
                            Image {
                                id: objectImage
                                anchors.centerIn: parent
                                width: parent.width - 4
                                height: parent.height - 4
                                source: "qrc:/images/paths/path_example.png"
                                z:0
                            }
                        }
                        Row{
                            topPadding: 6
                            width: parent.width - 32
                            height: 26
                            Text{
                                width: parent.width - 32
                                height: parent.height
                                wrapMode: Text.WordWrap
                                font.pixelSize: 15
                                font.family: Style.bold
                                text: `${modelData.name}`
                            }
                        }
                        Row{
                            width: parent.width - 32
                            height: 46
                            spacing: 4
                            Rectangle{
                                width: parent.width * 0.36
                                height: 44
                                color: Style.primaryColor
                                RoundButton{
                                    id: moreButton
                                    width: 115
                                    height: 44
                                    radius: 5
                                    anchors.left: parent.left
                                    contentItem: Text {
                                        text: rootWindow.selectedLanguage === "pl" ? "Więcej" : "More"
                                        font.pixelSize: 15
                                        font.family: Style.bold
                                        color: Style.primaryColor
                                        horizontalAlignment: Text.AlignHCenter
                                        verticalAlignment: Text.AlignVCenter
                                        elide: Text.ElideRight
                                    }

                                    background: Rectangle {
                                        implicitWidth: 115
                                        implicitHeight: 34
                                        color: Style.accentColor
                                        radius: 5
                                        opacity: moreButton.pressed ? 0.5 : 1.0
                                    }
                                    onClicked: {
                                        mainNavBar.visible = false
                                        slideAnimation.enabled = true
                                        stackView.push("qrc:/screens/RouteDetailsScreen.qml", {modelData})
                                    }
                                }

                            }
                            Rectangle{
                                width: parent.width * 0.64
                                height: 44
                                color: Style.primaryColor
                                RoundButton{
                                    id: navigateButton
                                    width: parent.width - 4
                                    height: 44
                                    radius: 5
                                    contentItem: Row{
                                        width: parent.width
                                        height: parent.height
                                        leftPadding: 4
                                        spacing: 10
                                        IconImage {
                                            //anchors.margins: 4
                                            anchors.verticalCenter: parent.verticalCenter
                                            width: 16
                                            height: 16                                            
                                            source: "qrc:/icons/NavigateIcon.svg"
                                        }
                                        Text {
                                            text: rootWindow.selectedLanguage === "pl" ? "Nawiguj po trasie" : "Navigate the route"
                                            font.pixelSize: 15
                                            font.family: Style.bold
                                            color: Style.accentColor
                                            horizontalAlignment: Text.AlignHCenter
                                            verticalAlignment: Text.AlignVCenter
                                            elide: Text.ElideRight
                                        }
                                    }
                                    background: Rectangle {
                                        implicitWidth: parent.width - 4
                                        implicitHeight: 34
                                        color: navigateButton.pressed ? Style.accentColor : Style.primaryColor
                                        radius: 5
                                        border.color: Style.accentColor
                                        border.width: 1
                                        opacity: navigateButton.pressed ? 0.5 : 1.0
                                    }
                                    onClicked: {
                                        Qt.openUrlExternally(`https://www.google.com/maps/dir/?api=1&destination=${modelData.destination}&waypoints=${modelData.waypoints}&travelmode=walking`)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
