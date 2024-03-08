import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15

Item{
    property var jsonObject

    function loadData(){
        let xhr = new XMLHttpRequest();
        xhr.open("GET", "qrc:/json/context.json");
        xhr.onreadystatechange = function() {
            if (xhr.readyState !== XMLHttpRequest.DONE) {
                return;
            }
            jsonObject = JSON.parse(xhr.responseText);
        }
        xhr.send();
    }

    Column{
        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Home"
            font.pixelSize: 24
        }
        ListView {
            width: parent.width
            height: 120
            model: jsonObject.context_pl

            delegate: Text {
                text: `\n Nazwa: ${modelData.name} \n Lokalizacja: ${modelData.location} \n Adres: ${modelData.address} \n Opis: ${modelData.description}`
            }
        }
    }
    Component.onCompleted: loadData()
}
