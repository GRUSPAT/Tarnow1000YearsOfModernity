import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15

Item {

    property color backgroundColor: "#F2F3F3"
    property color primaryColor: "#FCFCFC"
    property color textColor: "#000000"
    property color accentColor: "#5A8A98"
    property color borderColor: "#C5C5C5"


    Rectangle{
        anchors.fill: parent
        z:0
        color: backgroundColor
    }
    Column {

        Component.onCompleted: {
            homeButton.icon.color = textColor
            objectsButton.icon.color = textColor
            mapButton.icon.color = textColor
            routesButton.icon.color = accentColor
            settingsButton.icon.color = textColor
        }


        width: rootWindow.width
        height: rootWindow.height
        FontLoader {
            id: font
            source: "qrc:/fonts/Montserrat-Bold.ttf"
        }
        Rectangle {
            id: topBar
            width: rootWindow.width
            height: rootWindow.height * 0.12
            color: primaryColor
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
                    color: primaryColor
                    id: objekty
                    z:1
                    Text {
                        id:topBarLabel
                        anchors.leftMargin: 20
                        anchors.topMargin: 45
                        font.family: font.font.family
                        //    font.weight: font.font.weight
                        //   font.styleName: font.font.styleName
                        // font.family: font.name
                        text: rootWindow.selectedLanguage === "pl" ? "TRASY" : "ROUTES"
                        font.pixelSize: 32
                    }
                }
                Rectangle{
                    width: topBar.width * 0.35 - 20
                    height: topBar.height - 36
                    color: primaryColor
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
                model: rootWindow.jsonRoutes.routes_pl
                spacing: 12

                delegate:
                    Rectangle{
                    id:objectCard
                    FontLoader { id: font2; source: "qrc:/fonts/Montserrat-Bold.ttf" }
                    width: objectsList.width - 20
                    height: 252
                    radius: 20
                    color: primaryColor
                    border.width: 1
                    border.color: borderColor
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
                        color: accentColor
                        z:1
                        radius: 4
                        anchors.top: parent.top
                        anchors.topMargin: 8
                        anchors.horizontalCenter: parent.horizontalCenter
                        Text{
                            anchors.centerIn: parent
                            text: `${modelData.location}`
                            font.pixelSize: 10
                            font.family: font2.font.family
                            color: primaryColor
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
                            border.color: accentColor
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
                                font.family: font2.name
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
                                color: primaryColor
                                RoundButton{
                                    id: moreButton
                                    width: 115
                                    height: 44
                                    radius: 5
                                    anchors.left: parent.left
                                    contentItem: Text {
                                        text: rootWindow.selectedLanguage === "pl" ? "Więcej" : "More"
                                        font.pixelSize: 15
                                        font.family: font2.name
                                        color: primaryColor
                                        horizontalAlignment: Text.AlignHCenter
                                        verticalAlignment: Text.AlignVCenter
                                        elide: Text.ElideRight
                                    }

                                    background: Rectangle {
                                        implicitWidth: 115
                                        implicitHeight: 34
                                        color: accentColor
                                        radius: 5
                                        opacity: moreButton.pressed ? 0.5 : 1.0
                                    }
                                    onClicked: {
                                        stackView.push("qrc:/screens/RouteDetailsScreen.qml", {modelData})
                                    }
                                }

                            }
                            Rectangle{
                                width: parent.width * 0.64
                                height: 44
                                color: primaryColor
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
                                            source: "qrc:/icons/SettingsIcon.svg"
                                        }
                                        Text {
                                            text: rootWindow.selectedLanguage === "pl" ? "Nawiguj po trasie" : "Navigate the route"
                                            font.pixelSize: 15
                                            font.family: font2.name
                                            color: accentColor
                                            horizontalAlignment: Text.AlignHCenter
                                            verticalAlignment: Text.AlignVCenter
                                            elide: Text.ElideRight
                                        }
                                    }
                                    background: Rectangle {
                                        implicitWidth: parent.width - 4
                                        implicitHeight: 34
                                        color: navigateButton.pressed ? accentColor : primaryColor
                                        radius: 5
                                        border.color: accentColor
                                        border.width: 1
                                        opacity: navigateButton.pressed ? 0.5 : 1.0
                                    }
                                    onClicked: {
                                        Qt.openUrlExternally("https://www.google.com/maps/dir/?api=1&origin=Google+Pyrmont+NSW&destination=QVB&destination_place_id=ChIJISz8NjyuEmsRFTQ9Iw7Ear8&travelmode=walking")
                                    }
                                }
                            }
                        }
                    }
                }
                //Text {
                //    text: `\n Nazwa: ${modelData.name} \n Lokalizacja: ${modelData.location} \n Adres: ${modelData.address} \n Opis: ${modelData.description}`
                //}
            }
        }
    }
}
