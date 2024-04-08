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
    function searchLocations(text) {
        var searchingText = text.toLocaleLowerCase()
        var tempContext = []
        var resultContext = []
        if(rootWindow.selectedLanguage === "pl"){
            tempContext = rootWindow.jsonContext.context_pl
        } else{
            tempContext = rootWindow.jsonContext.context_en
        }
        var count = tempContext.length
        for (var i = 0; i < count; ++i){
            var name = tempContext[i].name.toLocaleLowerCase()
            if (name.indexOf(searchingText) !== -1) {
                resultContext.push(tempContext[i])
            }
        }
        objectsList.model = resultContext
    }

    Component.onCompleted: {
        homeButton.icon.color = Style.textColor
        objectsButton.icon.color = Style.accentColor
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
        bottomPadding: rootWindow.height * 0.095
        Rectangle{
            id: topBar
            width: rootWindow.width
            height: rootWindow.height * 0.2
            color: Style.primaryColor
            z:1
            radius: 18
            Column{
                width: parent.width
                height: parent.height
                Row{
                    height: topBar.height * 0.5
                    width: topBar.width
                    topPadding: 36
                    leftPadding: 20
                    rightPadding: 20
                    Rectangle{
                        anchors.bottom: parent.bottom
                        width: topBar.width * 0.5 -20
                        height: topBar.height *0.5 -45
                        color: Style.primaryColor
                        id: objekty
                        z:1
                        Text {
                            anchors.leftMargin: 20
                            anchors.topMargin: 45
                            font.family: Style.bold
                            id:topBarLabel
                            text: rootWindow.selectedLanguage === "pl" ? "OBIEKTY" : "OBJECTS"
                            font.pixelSize: 32
                        }
                    }
                    Rectangle{
                        width: topBar.width * 0.5 -20
                        height: topBar.height *0.5 -36
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
                Row{
                    height: topBar.height  * 0.5
                    width: topBar.width
                    topPadding: 18
                    leftPadding: 20
                    rightPadding: 20
                    Rectangle{
                        height: 42
                        width: parent.width - 40
                        radius: 16
                        color: Style.primaryColor
                        border.width: 1
                        border.color: Style.accentColor
                        z:1
                        Row{
                            anchors.verticalCenter: parent.verticalCenter
                            width: parent.width
                            height: 38
                            padding: 2
                            leftPadding: 16
                            spacing: -8
                            IconImage{
                                anchors.verticalCenter: parent.verticalCenter
                                width: 20
                                height: 20
                                visible: textField.activeFocus || (textField.length !== 0) ? false : true
                                source: "qrc:/icons/SearchIcon.svg"
                            }
                            TextField{
                                id: textField
                                anchors.verticalCenter: parent.verticalCenter
                                width: parent.width - 50
                                height: 34
                                font.family: Style.bold
                                font.pixelSize: 18
                                color: Style.textColor
                                placeholderText: rootWindow.selectedLanguage === "pl" ? "Wyszukaj" : "Search"
                                placeholderTextColor: textField.activeFocus || (textField.length !== 0) ? "transparent" : Style.accentColor
                                background: Rectangle {
                                    color: "transparent"
                                    border.width: 0
                                }
                                opacity: textField.activeFocus || (textField.length !== 0) ? 1 : 0.5
                                cursorDelegate: Rectangle {
                                    visible: textField.cursorVisible
                                    color: Style.accentColor
                                    width: textField.cursorRectangle.width
                                }
                                onTextChanged: searchLocations(textField.text)
                                onEditingFinished: searchLocations(textField.text)
                            }
                        }
                    }
                }
            }
        }
        ScrollView {
            width: parent.width
            height: parent.height - rootWindow.height * 0.095
            leftPadding: 20
            topPadding: 10
            bottomPadding: 180
            contentWidth: parent.width - 20
            contentHeight: objectsList.contentHeight
            ScrollBar.vertical: ScrollBar{
                interactive: false
                policy: ScrollBar.AsNeeded
                contentItem: Rectangle {
                    implicitWidth: 4
                    color: 'transparent'
                }
                background: Rectangle {
                    implicitWidth: 4
                    color: 'transparent'
                }
            }
            ListView {
                id: objectsList
                width: parent.width
                model: rootWindow.selectedLanguage === "pl" ? rootWindow.jsonContext.context_pl : rootWindow.jsonContext.context_en
                spacing: 20
                ScrollBar.vertical: ScrollBar{
                    id: scroller
                    interactive: false
                    policy: ScrollBar.AsNeeded
                    contentItem: Rectangle {
                        implicitWidth: 4
                        radius: 2
                        color: Style.accentColor
                    }
                    background: Rectangle {
                        implicitWidth: 4
                        color: 'transparent'
                    }
                }
                delegate:
                    Rectangle{
                    id:objectCard
                    width: objectsList.width - 20
                    height: 260
                    radius: 20
                    color: Style.primaryColor
                    border.color: Style.borderColor
                    border.width: 1
                    Column{
                        width: parent.width
                        height: parent.height
                        topPadding: 16
                        leftPadding: 16
                        rightPadding: 16
                        Rectangle{
                            width: parent.width - 32
                            height: parent.height * 0.55
                            radius: 12
                            Image {
                                id: objectImage
                                width: parent.width
                                height: parent.height

                                source: `qrc:/images/objects/${modelData.id + 1}/miniature.png`
                            }
                            Row{
                                topPadding: 8
                                leftPadding: 11
                                anchors.fill: parent
                                z:1
                                Rectangle{
                                    width: 63
                                    height: 17
                                    radius: 3
                                    color: Style.accentColor
                                    Text{
                                        anchors.centerIn: parent
                                        text: `${modelData.location}`
                                        font.family: Style.bold
                                        font.pixelSize: 8
                                        color: Style.primaryColor
                                    }
                                }
                            }
                        }
                        Row{
                            topPadding: 10
                            width: parent.width - 32
                            Text{
                                width: parent.width - 32
                                wrapMode: Text.WordWrap
                                font.pixelSize: 15
                                font.family: Style.bold
                                height: 40
                                text: `${modelData.id + 1}. ${modelData.name}`
                            }
                        }
                        Row{
                            width: parent.width - 32
                            height: 46

                            Rectangle{
                                width: parent.width * 0.65
                                height: 44
                                color: Style.primaryColor
                                Row{
                                    width: parent.width
                                    height: parent.height
                                    spacing: 8
                                    IconImage {
                                        //anchors.margins: 4
                                        anchors.verticalCenter: parent.verticalCenter
                                        width: 20
                                        height: 20
                                        source: "qrc:/icons/AddressIcon.svg"
                                    }
                                    Text {
                                        anchors.verticalCenter: parent.verticalCenter
                                        text: `${modelData.address}`
                                        font.family: Style.regular
                                        font.pixelSize: 12
                                    }
                                }
                            }
                            Rectangle{
                                width: parent.width * 0.35
                                height: 44
                                color: Style.primaryColor
                                RoundButton{
                                    id: moreButton
                                    width: 105
                                    height: 44
                                    radius: 5
                                    anchors.right: parent.right

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
                                        implicitWidth: 105
                                        implicitHeight: 34
                                        color: Style.accentColor
                                        radius: 5
                                        opacity: moreButton.pressed ? 0.5 : 1.0
                                    }
                                    onClicked: {
                                        mainNavBar.visible = false
                                        slideAnimation.enabled = true
                                        stackView.push("qrc:/screens/LocationDetailsScreen.qml", {modelData})
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

