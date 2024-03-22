import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Effects

Item {
    property color backgroundColor: "#F2F3F3"
    property color primaryColor: "#FCFCFC"
    property color textColor: "#000000"
    property color accentColor: "#5A8A98"

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
        homeButton.icon.color = textColor
        objectsButton.icon.color = accentColor
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
        width: rootWindow.width
        height: rootWindow.height
        bottomPadding: rootWindow.height * 0.07
        //leftPadding: 20
        Rectangle{
            id: topBar
            width: rootWindow.width
            height: rootWindow.height * 0.2
            color: primaryColor
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
                        color: primaryColor
                        id: objekty
                        z:1
                        Text {
                            anchors.leftMargin: 20
                            anchors.topMargin: 45
                            font.family: font.font.family
                            //    font.weight: font.font.weight
                            //   font.styleName: font.font.styleName
                            // font.family: font.name
                            id:topBarLabel
                            text: rootWindow.selectedLanguage === "pl" ? "OBIEKTY" : "OBJECTS"
                            font.pixelSize: 32
                        }
                    }
                    Rectangle{
                        width: topBar.width * 0.5 -20
                        height: topBar.height *0.5 -36
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
                        color: primaryColor
                        border.width: 1
                        border.color: accentColor
                        z:1
                        Row{
                            anchors.verticalCenter: parent.verticalCenter
                            width: parent.width
                            height: 38
                            padding: 2
                            IconImage{
                                width: 36
                                height: 36
                                source: "qrc:/icons/SettingsIcon.svg"
                            }
                            TextField{
                                id: textField
                                width: parent.width - 48
                                height: 36
                                font.family: font.font.family
                                placeholderText: rootWindow.selectedLanguage === "pl" ? "Wyszukaj" : "Search"
                                placeholderTextColor: textField.activeFocus || (textField.length !== 0) ? "transparent" : accentColor
                                background: Rectangle {
                                    color: primaryColor
                                    border.width: 0
                                }
                                opacity: 0.5
                                cursorDelegate: Rectangle {
                                    visible: textField.cursorVisible
                                    color: accentColor
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
                model: rootWindow.jsonContext.context_pl
                spacing: 20

                delegate:
                    Rectangle{
                    id:objectCard
                    FontLoader { id: font2; source: "qrc:/fonts/Montserrat-Bold.ttf" }
                    width: objectsList.width - 20
                    height: 260
                    radius: 20
                    color: primaryColor
                    /*Image {
                        id: objectBG
                        source: "qrc:/images/objects/objectBG.svg"
                        anchors.fill: parent
                        width: parent.width
                        height: parent.height
                    }*/
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
                                //anchors.fill: parent
                                width: parent.width
                                height: parent.height
                                //fillMode: Image.PreserveAspectCrop
                                //clip:true
                                source: "qrc:/images/objects/object_1/miniature_1.png"
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
                                    color: accentColor
                                    Text{
                                        anchors.centerIn: parent
                                        text: `${modelData.location}`
                                        font.family: font2.font.family
                                        font.pixelSize: 8
                                        color: primaryColor

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
                                font.family: font2.name
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
                                Row{
                                    width: parent.width
                                    height: parent.height
                                    spacing: 10
                                    IconImage {
                                        //anchors.margins: 4
                                        anchors.verticalCenter: parent.verticalCenter
                                        width: 30
                                        height: 30
                                        source: "qrc:/icons/SettingsIcon.svg"
                                    }
                                    Text {
                                        anchors.verticalCenter: parent.verticalCenter
                                        text: `${modelData.address}`
                                        font.family: font2.name
                                    }
                                }

                            }
                            Rectangle{
                                width: parent.width * 0.35
                                height: 44
                                RoundButton{
                                    id: moreButton
                                    width: 105
                                    height: 44
                                    radius: 5
                                    anchors.right: parent.right

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
                                        implicitWidth: 105
                                        implicitHeight: 34
                                        color: accentColor
                                        radius: 5
                                        opacity: moreButton.pressed ? 0.5 : 1.0
                                    }
                                    onClicked: {
                                        stackView.push("qrc:/screens/LocationDetailsScreen.qml", {modelData})
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

