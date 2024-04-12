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
        width: rootWindow.width
        height: rootWindow.height
        bottomPadding: rootWindow.height * 0.07
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
                        text: rootWindow.selectedLanguage === "pl" ? "AUTORZY" : "AUTHORS"
                        font.pixelSize: 32
                    }
                }
                Rectangle{
                    width: topBar.width * 0.35 - 20
                    height: topBar.height - 45
                    anchors.bottom: parent.bottom
                    color: Style.primaryColor
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
                            color: Style.primaryColor
                            source: "qrc:/icons/CloseIcon.svg"
                        }
                        background: Rectangle {
                            color: Style.accentColor
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
        ListModel {
            id: authorsModelPolish
            ListElement{
                title: 'Aplikacja mobilna:'
                text: 'Patryk Gruszowski \nMichał Groński'
            }
            ListElement{
                title: 'Zdjęcia:'
                text: 'Adam Pieprzycki'
            }
            ListElement{
                title: 'Materiały:'
                text: 'Aleksandra Kubisztal'
            }
            ListElement{
                title: 'Tekst:'
                text: ''
            }
            ListElement{
                title: 'Tłumaczenie:'
                text: ''
            }
            ListElement{
                title: 'Współpraca:'
                text: 'Daniel Król \nEwa Łączyńska-Widz'
            }
        }
        ListModel {
            id: authorsModelEnglish
            ListElement{
                title: 'Mobile app:'
                text: 'Patryk Gruszowski \nMichał Groński'
            }
            ListElement{
                title: 'Photos:'
                text: 'Adam Pieprzycki'
            }
            ListElement{
                title: 'Materials:'
                text: 'Aleksandra Kubisztal'
            }
            ListElement{
                title: 'Text:'
                text: ''
            }
            ListElement{
                title: 'Translation:'
                text: ''
            }
            ListElement{
                title: 'Collaboration:'
                text: 'Daniel Król \nEwa Łączyńska-Widz'
            }
        }
        ScrollView {
            height: rootWindow.height - rootWindow.height * 0.12
            width: rootWindow.width
            contentHeight: authorsList.height
            contentWidth: authorsList.width
            ListView {
                id: authorsList
                width: parent.width
                topMargin: 20
                model: rootWindow.selectedLanguage === "pl" ? authorsModelPolish : authorsModelEnglish
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
                    Column{
                    width: rootWindow.width - leftPadding - rightPadding
                    spacing: 5
                    rightPadding: 20
                    leftPadding: 20
                    bottomPadding: 10
                    Text {
                        width: parent.width
                        text: model.title
                        font.bold: true
                        font.pixelSize: 14
                        wrapMode: Text.WordWrap
                    }
                    Text {
                        width: parent.width
                        text: model.text
                        font.pixelSize: 12
                        wrapMode: Text.WordWrap
                        onLinkActivated: link1 => Qt.openUrlExternally(link1)
                    }
                }
            }
        }
    }
}
