import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15

Item {
    Column{
        width: rootWindow.width
        height: rootWindow.height
        Rectangle{
            anchors.topMargin: 10
            width: rootWindow.width
            height: rootWindow.height * 0.2
            color: "red"
            z:1
            Column{
                width: parent.width
                height: parent.height
                Row{
                    width: parent.width
                    height: parent.height * 0.5
                    spacing: 150
                    Text {
                        id:topBarLabel
                        anchors.leftMargin: 10
                        anchors.bottom: parent.bottom
                        width: parent.width * 0.5 - 10
                        height: parent.height
                        text: "OBIEKTY"
                        font.pixelSize: 24
                    }
                    Image {
                        id: topBarLogo
                        anchors.rightMargin: 10
                        anchors.bottom: parent.bottom
                        width: 50
                        height: 50
                        source: "qrc:/images/AppIcon.png"
                    }
                }
                Rectangle{
                    anchors{
                        horizontalCenter: parent.horizontalCenter
                        margins: 10
                    }
                    width: parent.width - 20
                    height: parent.height * 0.5 - 20
                    radius: 10
                    border.width: 2
                    border.color: "black"
                    Row{
                        anchors.verticalCenter: parent.verticalCenter
                        width: parent.width
                        height: parent.height
                        IconImage{
                            anchors.margins: 4
                            anchors.verticalCenter: parent.verticalCenter
                            width: 30
                            height: 30
                            source: "qrc:/icons/SettingsIcon.svg"
                        }
                        TextField{
                            width: parent.width - 48
                            height: 30
                            anchors.margins: 4
                            anchors.verticalCenter: parent.verticalCenter
                            placeholderText: "Wyszukaj"
                        }
                    }
                }
            }
        }
        ScrollView {
            width: parent.width
            height: parent.height
            ListView {
                width: parent.width
                height: parent.height
                model: rootWindow.jsonContext.context_pl
                spacing: 10

                delegate:
                    Rectangle{
                    width: parent.width - 40
                    height: 200
                    anchors.margins: 20
                    anchors.horizontalCenter: parent.horizontalCenter
                    radius: 20
                    color: "blue"
                    Column{
                        width: parent.width
                        height: parent.height
                        Image {
                            anchors.horizontalCenter: parent.horizontalCenter
                            width: 300
                            height: 100
                            id: objectImage
                            source: "qrc:/images/AppIcon.png"
                        }
                        Text{
                            width: parent.width - 50
                            height: 40
                            text: `${modelData.id + 1}. ${modelData.name}`
                        }
                        Row{
                            width: parent.width - 50
                            height: 40
                            spacing: 20
                            IconImage {
                                anchors.margins: 4
                                anchors.verticalCenter: parent.verticalCenter
                                width: 30
                                height: 30
                                source: "qrc:/icons/SettingsIcon.svg"
                            }
                            Text {
                                text: `${modelData.address}`
                            }
                            Button{
                                text: "Więcej"
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
}
