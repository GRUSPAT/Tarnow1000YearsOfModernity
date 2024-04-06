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
import QtQuick.Effects
import App 1.0

Item {
    Component.onCompleted: {
        homeButton.icon.color = Style.textColor
        objectsButton.icon.color = Style.textColor
        mapButton.icon.color = Style.textColor
        routesButton.icon.color = Style.textColor
        settingsButton.icon.color = Style.accentColor
    }

    ListModel {
        id: languageModel
        ListElement { name: "Polski"; code: "pl" }
        ListElement { name: "English"; code: "en" }
    }

    Rectangle{
        anchors.fill: parent
        z:0
        color: Style.primaryColor
    }
    Column {
        width: rootWindow.width
        height: rootWindow.height
        bottomPadding: rootWindow.height * 0.07
        //leftPadding: 20
        Rectangle {
            id: topBar
            width: rootWindow.width
            height: rootWindow.height * 0.2
            color: Style.primaryColor
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
                    height: topBar.height *0.5 - 45
                    color: Style.primaryColor
                    id: objekty
                    z:1
                    Text {
                        id:topBarLabel
                        anchors.leftMargin: 20
                        anchors.topMargin: 45
                        font.family: Style.bold
                        text: rootWindow.selectedLanguage === "pl" ? "USTAWIENIA" : "SETTINGS"
                        font.pixelSize: 32
                    }
                }
                Rectangle{
                    width: topBar.width * 0.35 - 20
                    height: topBar.height *0.5 - 36
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
        Rectangle {
            width: rootWindow.width
            height: 1
            color: "black"
        }
        Row {
            width: rootWindow.width
            height: rootWindow.height * 0.1
            spacing: 10
            Rectangle {
                width: parent.width * 0.55
                height: parent.height
                color: Style.primaryColor
                Text {
                    width: parent.width
                    height: parent.height
                    horizontalAlignment: Text.AlignRight
                    verticalAlignment: Text.AlignVCenter
                    font.family: Style.bold
                    font.pixelSize: 18
                    text: rootWindow.selectedLanguage === "pl" ? "Wybierz język" : "Select language"
                }
            }
            Rectangle{
                width: parent.width * 0.45
                height: parent.height
                color: Style.primaryColor
                RoundButton {
                    id: languageButton
                    width: 105
                    height: 44
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    radius: 5
                    contentItem: Text {
                        text: rootWindow.selectedLanguage === "pl" ? "POLSKI" : "ENGLISH"
                        font.pixelSize: 15
                        font.family: Style.bold
                        color: "black"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        elide: Text.ElideRight
                    }
                    background: Rectangle {
                        implicitWidth: 105
                        implicitHeight: 34
                        color: Style.primaryColor
                        radius: 5
                        border.color: Style.accentColor
                        border.width: 1
                    }
                    onClicked: languagePopup.visible = true
                    Popup {
                        id: languagePopup
                        width: languageButton.width
                        height: 100
                        parent: languageButton
                        x: parent.x
                        y: parent.y + 26
                        padding: 10
                        enter: Transition {
                            NumberAnimation {
                                target: languagePopup
                                properties: "opacity"
                                from: 0
                                to: 1
                                duration: 200
                                easing.type: Easing.InOutQuad
                            }
                        }
                        exit: Transition {
                            NumberAnimation {
                                target: languagePopup
                                properties: "opacity"
                                from: 1
                                to: 0
                                duration: 200
                                easing.type: Easing.InOutQuad
                            }
                        }
                        contentItem: ListView {
                            anchors.horizontalCenter: parent.horizontalCenter
                            model: languageModel
                            delegate: ItemDelegate {
                                anchors.horizontalCenter: parent.horizontalCenter
                                width: parent.width - 20
                                height: 40
                                //text: model.name
                                contentItem: Text {
                                    anchors.centerIn: parent
                                    width: parent.width
                                    height: parent.width
                                    text: model.name
                                    font.pixelSize: 14
                                    font.family: Style.bold
                                    color: "black"
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                }
                                background: Rectangle{
                                    anchors.fill: parent
                                    implicitWidth:  parent.width
                                    implicitHeight: parent.height
                                    color: "transparent"
                                    radius: 8
                                }
                                onClicked: {
                                    rootWindow.selectedLanguage = model.code
                                    languagePopup.visible = false
                                }
                            }
                        }
                        background: Rectangle{
                            anchors.fill: parent
                            implicitWidth:  parent.width
                            implicitHeight: parent.height
                            color: "white"
                            radius: 8
                            border.color: Style.borderColor
                            border.width: 1
                        }

                        onClosed: languageButton.forceActiveFocus()
                        focus: true
                    }
                }
            }
        }
        Rectangle {
            width: rootWindow.width
            height: 1
            color: "black"
        }
        Rectangle {
            width: rootWindow.width
            height: rootWindow.height * 0.1
            color: Style.primaryColor
            RoundButton {
                id: aboutAppButton
                width: parent.width
                height: parent.height
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                contentItem: Text {
                    text: rootWindow.selectedLanguage === "pl" ? "O aplikacji" : "About the application"
                    font.pixelSize: 18
                    font.family: Style.bold
                    color: "black"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                }
                background: Rectangle {
                    implicitWidth: parent.width
                    implicitHeight: parent.height
                    color: Style.primaryColor
                }
                onClicked: {
                    mainNavBar.visible = false
                    slideAnimation.enabled = true
                    stackView.push("qrc:/screens/AboutAppScreen.qml")
                }
            }
        }
        Rectangle {
            width: rootWindow.width
            height: 1
            color: "black"
        }
        Rectangle {
            width: rootWindow.width
            height: rootWindow.height * 0.1
            color: Style.primaryColor
            RoundButton {
                id: authorsButton
                width: parent.width
                height: parent.height
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                contentItem: Text {
                    text: rootWindow.selectedLanguage === "pl" ? "Autorzy" : "Authors"
                    font.pixelSize: 18
                    font.family: Style.bold
                    color: "black"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                }
                background: Rectangle {
                    implicitWidth: parent.width
                    implicitHeight: parent.height
                    color: Style.primaryColor
                }
                onClicked: {
                    mainNavBar.visible = false
                    slideAnimation.enabled = true
                    stackView.push("qrc:/screens/AuthorsScreen.qml")
                }
            }
        }
        Rectangle {
            width: rootWindow.width
            height: 1
            color: "black"
        }
        Rectangle {
            width: rootWindow.width
            height: rootWindow.height * 0.1
            color: Style.primaryColor
            RoundButton {
                id: licensesButton
                width: parent.width
                height: parent.height
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                contentItem: Text {
                    text: rootWindow.selectedLanguage === "pl" ? "Licencje" : "Licenses"
                    font.pixelSize: 18
                    font.family: Style.bold
                    color: "black"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                }
                background: Rectangle {
                    implicitWidth: parent.width
                    implicitHeight: parent.height
                    color: Style.primaryColor
                }
                onClicked: {
                    mainNavBar.visible = false
                    slideAnimation.enabled = true
                    stackView.push("qrc:/screens/LicensesScreen.qml")
                }
            }
        }
        Rectangle {
            width: rootWindow.width
            height: 1
            color: "black"
        }
    }
}
