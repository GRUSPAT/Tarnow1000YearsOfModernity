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
import QtPositioning
import App 1.0

Item {
    id: detailsLocationWindow
    property var modelData

    Column {
        width: rootWindow.width
        height: rootWindow.height
        bottomPadding: rootWindow.height * 0.095
        spacing: -20
        Rectangle{
            id: imagesRectangle
            width: parent.width
            height: parent.height * 0.35
            color: Style.primaryColor
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
                        source: `qrc:/images/objects/${detailsLocationWindow.modelData.id + 1}/${index + 1}`
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
                visible: modelData.photos > 1 ? true : false
                delegate: Rectangle {
                    implicitWidth: index === indicator.currentIndex ? 20 : 8
                    implicitHeight: 8

                    radius: width / 2
                    color: index === indicator.currentIndex ? Style.accentColor : Style.primaryColor

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
                        color: Style.primaryColor
                        source: "qrc:/icons/CloseIcon.svg"
                    }
                    background: Rectangle {
                        color: Style.accentColor
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
            color: Style.primaryColor
            radius: 20
            ScrollView {
                id: objectDataScroll
                width: parent.width
                height: parent.height - rootWindow.height * 0.095 + 20
                contentHeight: nameRectangle.height + addressRectangle.height + descriptionText.contentHeight + 60
                ScrollBar.vertical.policy: ScrollBar.AlwaysOff
                Column{
                    width: parent.width - 64
                    height: parent.height
                    padding: 32
                    //bottomPadding: 80
                    Rectangle{
                        id: nameRectangle
                        width: parent.width
                        height: labelText.contentHeight
                        color: Style.primaryColor
                        Text {
                            id: labelText
                            anchors.fill: parent
                            text: `${modelData.name}`
                            wrapMode: Text.WordWrap
                            font.family: Style.bold
                            font.pixelSize: 22
                            color: Style.textColor
                        }
                    }
                    Rectangle{
                        id: addressRectangle
                        width: parent.width
                        height: 48
                        color: Style.primaryColor
                        Row{
                            width: parent.width
                            height: parent.height - 20
                            spacing: 8
                            anchors.centerIn: parent
                            IconImage {
                                anchors.verticalCenter: parent.verticalCenter
                                width: 20
                                height: 20
                                source: "qrc:/icons/AddressIcon.svg"
                            }
                            Text {
                                anchors.verticalCenter: parent.verticalCenter
                                text: `${modelData.address}`
                                font.family: Style.bold
                                font.pixelSize: 11
                                color: Style.textColor
                            }
                        }
                    }
                    Rectangle{
                        id: descriptionRectangle
                        width: parent.width
                        height: parent.height * 0.5
                        color: Style.primaryColor
                        Text {
                            id: descriptionText
                            anchors.fill: parent
                            text: `${modelData.description}`
                            wrapMode: Text.WordWrap
                            font.family: Style.bold
                            font.pixelSize: 13
                            color: Style.textColor
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
                Row {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    topPadding: 12
                    width: parent.width
                    height: parent.height
                    leftPadding: 10
                    spacing: -20
                    Rectangle{
                        width: parent.width * 0.5
                        height: parent.height * 0.5
                        color: "transparent"
                        Button{
                            id: showOnMap
                            anchors.horizontalCenter: parent.horizontalCenter
                            width: parent.width * 0.7
                            height: 32
                            contentItem: Row{
                                width: parent.width
                                height: parent.height
                                leftPadding: -15
                                spacing: 6
                                IconImage {
                                    anchors.verticalCenter: parent.verticalCenter
                                    width: 18
                                    height: 18
                                    source: "qrc:/icons/AddressIcon.svg"
                                    color: Style.primaryColor
                                }
                                Text {
                                    anchors.verticalCenter: parent.verticalCenter
                                    text: rootWindow.selectedLanguage === "pl" ? "Pokaż na mapie" : "Show on map"
                                    font.pixelSize: 11
                                    font.family: Style.bold
                                    color: Style.primaryColor
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                    elide: Text.ElideRight
                                }
                            }
                            background: Rectangle {
                                anchors.fill: parent
                                implicitWidth: parent.width
                                implicitHeight: parent.height
                                color: Style.accentColor
                                radius: 5
                                opacity: showOnMap.pressed ? 0.5 : 1.0
                            }
                            onClicked: {
                                var resultCoordinate = detailsLocationWindow.modelData.coordinate.trim().split(",")
                                rootWindow.lastMapCenter = QtPositioning.coordinate(resultCoordinate[0], resultCoordinate[1])
                                rootWindow.lastMapZoom = 15.5
                                slideAnimation.enabled = false
                                secondNavBar.visible = false
                                mainNavBar.visible = true
                                stackView.push("qrc:/screens/MapScreen.qml", {modelData})
                            }
                        }
                    }
                    Rectangle{
                        width: parent.width * 0.5
                        height: parent.height * 0.5
                        color: "transparent"
                        Button{
                            id: secondNavigateButton
                            anchors.horizontalCenter: parent.horizontalCenter
                            width: parent.width * 0.7
                            height: 32
                            contentItem: Row{
                                width: parent.width
                                height: parent.height
                                leftPadding: 2
                                spacing: 16
                                IconImage {
                                    anchors.verticalCenter: parent.verticalCenter
                                    width: 18
                                    height: 18
                                    source: "qrc:/icons/NavigateIcon.svg"
                                    color: Style.primaryColor
                                }
                                Text {
                                    anchors.verticalCenter: parent.verticalCenter
                                    text: rootWindow.selectedLanguage === "pl" ? "Nawiguj" : "Navigate"
                                    font.pixelSize: 11
                                    font.family: Style.bold
                                    color: Style.primaryColor
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                    elide: Text.ElideRight
                                }
                            }
                            background: Rectangle {
                                anchors.fill: parent
                                implicitWidth: parent.width
                                implicitHeight: parent.height
                                color: Style.accentColor
                                radius: 5
                                opacity: secondNavigateButton.pressed ? 0.5 : 1.0
                            }
                            onClicked: {
                                var resultDestination = detailsLocationWindow.modelData.coordinate.trim().split(",")
                                Qt.openUrlExternally(`https://www.google.com/maps/dir/?api=1&destination=${resultDestination[0] + "%2C" +resultDestination[1]}&travelmode=walking`)
                            }
                        }
                    }
                }
            }
        }
    }
}
