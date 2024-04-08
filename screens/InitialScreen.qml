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
        z: 0
        color: Style.primaryColor
    }
    Rectangle{
        width: parent.width
        height: parent.height
        anchors.fill: parent
        color: "transparent"
        Column{
            width: parent.width
            height: parent.height
            anchors.fill: parent
            anchors.topMargin: parent.height * 0.07
            anchors.bottomMargin: parent.height * 0.07
            spacing: 14
            ListView{
                property bool enableTimer: true
                id: imageRow
                width: parent.width - 20
                height: parent.height * 0.19
                anchors.leftMargin: 10
                anchors.rightMargin: 10
                orientation: ListView.Horizontal
                layoutDirection: Qt.LeftToRight
                model: 7
                spacing: 16
                interactive: false
                displayMarginEnd: imageRow.contentWidth
                delegate: Item {
                    height: imageRow.height
                    width: imageItem.implicitWidth
                    Image {
                        id: imageItem
                        height: parent.height
                        fillMode: Image.PreserveAspectFit
                        source: `qrc:/images/objects/${index + 1}/miniature.png`
                    }
                    Timer {
                        id: timer
                        property bool direction: true
                        interval: 20
                        repeat: true
                        running: imageRow.enableTimer
                        onTriggered: {
                            if (imageItem.x + imageRow.contentWidth - imageRow.width < 0) {
                                timer.direction = false
                            } else if(imageItem.x === 0){
                                timer.direction = true
                            }
                            if (timer.direction){
                                imageItem.x -= 1
                            } else {
                                imageItem.x += 1
                            }
                        }
                    }
                }
            }
            ListView{
                property bool enableTimer: true
                id: imageRow2
                width: parent.width - 20
                height: parent.height * 0.19
                anchors.leftMargin: 10
                anchors.rightMargin: 10
                orientation: ListView.Horizontal
                layoutDirection: Qt.RightToLeft
                model: 7
                spacing: 16
                interactive: false
                displayMarginEnd: imageRow2.contentWidth
                delegate: Item {
                    height: imageRow2.height
                    width: imageItem2.implicitWidth
                    Image {
                        id: imageItem2
                        height: parent.height
                        fillMode: Image.PreserveAspectFit
                        source: `qrc:/images/objects/${29 - index}/miniature.png`
                    }
                    Timer {
                        id: timer2
                        property bool direction: true
                        interval: 20
                        repeat: true
                        running: imageRow2.enableTimer
                        onTriggered: {
                            if (imageItem2.x - (imageRow2.contentWidth - imageRow2.width) > 0) {
                                timer2.direction = false
                            } else if(imageItem2.x === 0){
                                timer2.direction = true
                            }
                            if (timer2.direction){
                                imageItem2.x += 1
                            } else {
                                imageItem2.x -= 1
                            }
                        }
                    }
                }
            }
            Row{
                width: parent.width
                height: parent.height * 0.16
                spacing: 8
                leftPadding: 12
                Image {
                    anchors.verticalCenter: parent.verticalCenter
                    width: parent.width * 0.5 - 12
                    fillMode: Image.PreserveAspectFit
                    source: "qrc:/images/Tarnow1000LatLogo_2.png"
                }
                Text {
                    width: parent.width * 0.5 - 20
                    height: parent.height
                    color: Style.accentColor
                    verticalAlignment: Text.AlignVCenter
                    font.pixelSize: 13
                    font.family: Style.bold
                    text: "Odkrywaj Tarnów, podążaj ustalonymi trasami lub twórz nowe, dzięki aplikacji pełnej ciekawych miejsc"
                    wrapMode: Text.WordWrap
                    lineHeight: 15
                    lineHeightMode: Text.FixedHeight
                }
            }
            ListView{
                property bool enableTimer: true
                id: imageRow3
                width: parent.width - 20
                height: parent.height * 0.19
                anchors.leftMargin: 10
                anchors.rightMargin: 10
                orientation: ListView.Horizontal
                layoutDirection: Qt.LeftToRight
                model: 7
                spacing: 16
                interactive: false
                displayMarginEnd: imageRow3.contentWidth
                delegate: Item {
                    height: imageRow3.height
                    width: imageItem3.implicitWidth
                    Image {
                        id: imageItem3
                        height: parent.height
                        fillMode: Image.PreserveAspectFit
                        source: `qrc:/images/objects/${index + 7}/miniature.png`
                    }
                    Timer {
                        id: timer3
                        property bool direction: true
                        interval: 20
                        repeat: true
                        running: imageRow3.enableTimer
                        onTriggered: {
                            if (imageItem3.x + imageRow3.contentWidth - imageRow3.width < 0) {
                                timer3.direction = false
                            } else if(imageItem3.x === 0){
                                timer3.direction = true
                            }
                            if (timer3.direction){
                                imageItem3.x -= 1
                            } else {
                                imageItem3.x += 1
                            }
                        }
                    }
                }
            }
            ListView{
                property bool enableTimer: true
                id: imageRow4
                width: parent.width - 20
                height: parent.height * 0.19
                anchors.leftMargin: 10
                anchors.rightMargin: 10
                orientation: ListView.Horizontal
                layoutDirection: Qt.RightToLeft
                model: 7
                spacing: 16
                interactive: false
                displayMarginEnd: imageRow4.contentWidth
                delegate: Item {
                    height: imageRow4.height
                    width: imageItem4.implicitWidth
                    Image {
                        id: imageItem4
                        height: parent.height
                        fillMode: Image.PreserveAspectFit
                        source: `qrc:/images/objects/${22 - index}/miniature.png`
                    }
                    Timer {
                        id: timer4
                        property bool direction: true
                        interval: 20
                        repeat: true
                        running: imageRow4.enableTimer
                        onTriggered: {
                            if (imageItem4.x - (imageRow4.contentWidth - imageRow4.width) > 0) {
                                timer4.direction = false
                            } else if(imageItem4.x === 0){
                                timer4.direction = true
                            }
                            if (timer4.direction){
                                imageItem4.x += 1
                            } else {
                                imageItem4.x -= 1
                            }
                        }
                    }
                }
            }
        }
        RoundButton{
            id: acceptButton
            z: 1
            width: parent.width * 0.8
            height: 80
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: parent.height * 0.1
            contentItem: Text {
                anchors.centerIn: parent
                width: parent.width
                height: parent.height
                color: Style.primaryColor
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 24
                font.family: Style.bold
                text: "Kontynuuj"
            }
            background: Rectangle {
                color: Style.accentColor
                radius: 8
                opacity: acceptButton.pressed ? 0.5 : 1.0
            }
            onClicked: {
                imageRow.enableTimer = false
                imageRow2.enableTimer = false
                imageRow3.enableTimer = false
                imageRow4.enableTimer = false
                mainNavBar.visible = true
                appSettings.setValue("initialScreenDisplayed", true)
                stackView.push("qrc:/screens/HomeScreen.qml")
            }
        }
    }
}
