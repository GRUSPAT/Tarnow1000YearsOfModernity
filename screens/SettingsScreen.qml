import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Effects

Item {
    property color backgroundColor: "#F2F3F3"
    property color primaryColor: "#FCFCFC"
    property color textColor: "#000000"
    property color accentColor: "#5A8A98"

    Component.onCompleted: {
        homeButton.icon.color = textColor
        objectsButton.icon.color = textColor
        mapButton.icon.color = textColor
        routesButton.icon.color = textColor
        settingsButton.icon.color = accentColor
    }

    ListModel {
        id: languageModel
        ListElement { name: "Polski"; code: "pl" }
        ListElement { name: "English"; code: "en" }
    }

    Rectangle{
        anchors.fill: parent
        z:0
        color: primaryColor
    }
    Column {
        width: rootWindow.width
        height: rootWindow.height
        bottomPadding: rootWindow.height * 0.07
        //leftPadding: 20
        FontLoader {
            id: font
            source: "qrc:/fonts/Montserrat-Bold.ttf"
        }
        Rectangle {
            id: topBar
            width: rootWindow.width
            height: rootWindow.height * 0.2
            color: primaryColor
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
                        text: rootWindow.selectedLanguage === "pl" ? "USTAWIENIA" : "SETTINGS"
                        font.pixelSize: 32
                    }
                }
                Rectangle{
                    width: topBar.width * 0.35 - 20
                    height: topBar.height *0.5 - 36
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
                color: primaryColor
                Text {
                    width: parent.width
                    height: parent.height
                    horizontalAlignment: Text.AlignRight
                    verticalAlignment: Text.AlignVCenter
                    font.family: font.font.family
                    font.pixelSize: 18
                    text: rootWindow.selectedLanguage === "pl" ? "Wybierz język" : "Select language"
                }
            }
            Rectangle{
                width: parent.width * 0.45
                height: parent.height
                color: primaryColor
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
                        font.family: font.font.family
                        color: "black"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        elide: Text.ElideRight
                    }
                    background: Rectangle {
                        implicitWidth: 105
                        implicitHeight: 34
                        color: primaryColor
                        radius: 5
                        border.color: accentColor
                        border.width: 1
                    }
                    onClicked: languagePopup.visible = true
                    Popup {
                        id: languagePopup
                        width: languageButton.width
                        height: 120
                        parent: languageButton
                        x: parent.x
                        y: parent.y + 26
                        contentItem: ListView {
                            model: languageModel
                            delegate: ItemDelegate {
                                width: languagePopup.width
                                height: 50
                                text: model.name
                                onClicked: {
                                    rootWindow.selectedLanguage = model.code
                                    languagePopup.visible = false
                                }
                            }
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
            color: primaryColor
            RoundButton {
                id: aboutAppButton
                width: parent.width
                height: parent.height
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                contentItem: Text {
                    text: rootWindow.selectedLanguage === "pl" ? "O aplikacji" : "About the application"
                    font.pixelSize: 18
                    font.family: font.font.family
                    color: "black"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                }
                background: Rectangle {
                    implicitWidth: parent.width
                    implicitHeight: parent.height
                    color: primaryColor
                }
                onClicked: stackView.push("qrc:/screens/AboutAppScreen.qml")
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
            color: primaryColor
            RoundButton {
                id: authorsButton
                width: parent.width
                height: parent.height
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                contentItem: Text {
                    text: rootWindow.selectedLanguage === "pl" ? "Autorzy" : "Authors"
                    font.pixelSize: 18
                    font.family: font.font.family
                    color: "black"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                }
                background: Rectangle {
                    implicitWidth: parent.width
                    implicitHeight: parent.height
                    color: primaryColor
                }
                onClicked: stackView.push("qrc:/screens/AuthorsScreen.qml")
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
            color: primaryColor
            RoundButton {
                id: licensesButton
                width: parent.width
                height: parent.height
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                contentItem: Text {
                    text: rootWindow.selectedLanguage === "pl" ? "Licencje" : "Licenses"
                    font.pixelSize: 18
                    font.family: font.font.family
                    color: "black"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                }
                background: Rectangle {
                    implicitWidth: parent.width
                    implicitHeight: parent.height
                    color: primaryColor
                }
                onClicked: stackView.push("qrc:/screens/LicensesScreen.qml")
            }
        }
        Rectangle {
            width: rootWindow.width
            height: 1
            color: "black"
        }
    }
}
