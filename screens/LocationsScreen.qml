import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15

Item {
    Column{
        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Obiekty"
            font.pixelSize: 24
        }
        ListView {
            width: parent.width
            height: 120
            model: rootWindow.jsonObject.context_pl

            delegate: Text {
                text: `\n Nazwa: ${modelData.name} \n Lokalizacja: ${modelData.location} \n Adres: ${modelData.address} \n Opis: ${modelData.description}`
            }
        }
    }
}
