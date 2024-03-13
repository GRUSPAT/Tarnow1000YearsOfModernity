import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    id: rootWindow
    width: 430
    height: 932
    visible: true
    title: qsTr("Tarnów 1000 lat nowoczesności")

    Component.onCompleted: loadData()

    property var jsonContext
    property var jsonRoutes

    function loadData(){
        let xhr = new XMLHttpRequest();
        let xhr2 = new XMLHttpRequest();
        xhr.open("GET", "qrc:/json/context.json");
        xhr2.open("GET", "qrc:/json/routes.json");
        xhr.onreadystatechange = function() {
            if (xhr.readyState !== XMLHttpRequest.DONE) {
                return;
            }
            jsonContext = JSON.parse(xhr.responseText);
        }
        xhr2.onreadystatechange = function() {
            if (xhr2.readyState !== XMLHttpRequest.DONE) {
                return;
            }
            jsonRoutes = JSON.parse(xhr2.responseText);
        }
        xhr.send();
        xhr2.send();
    }

    Rectangle{
        anchors{
            horizontalCenter: parent.hohorizontalCenter
            bottom: parent.bottom
        }
        height: parent.height * 0.07
        width: parent.width
        z:1
        color: "white"
        RowLayout {
            anchors.centerIn: parent

            Button {
                flat: true
                icon.source: "qrc:/icons/HomeIcon.svg"
                width: parent.width * 0.2
                height: parent.height
                onClicked: stackView.push("screens/HomeScreen.qml")
            }

            Button {
                flat: true
                icon.source: "qrc:/icons/LocationsIcon.svg"
                width: parent.width * 0.2
                height: parent.height
                onClicked: stackView.push("screens/LocationsScreen.qml")
            }

            Button {
                flat: true
                icon.source: "qrc:/icons/MapIcon.svg"
                width: parent.width * 0.2
                height: parent.height
                onClicked: stackView.push("screens/MapScreen.qml")
            }

            Button {
                flat: true
                icon.source: "qrc:/icons/RoutesIcon.svg"
                width: parent.width * 0.2
                height: parent.height
                onClicked: stackView.push("screens/RoutesScreen.qml")
            }

            Button {
                flat: true
                icon.source: "qrc:/icons/SettingsIcon.svg"
                width: parent.width * 0.2
                height: parent.height
                onClicked: stackView.push("screens/SettingsScreen.qml")
            }
        }
    }

    StackView {
        id: stackView
        initialItem: "screens/HomeScreen.qml"
        anchors.fill: parent
        pushEnter: Transition {
            from: "fromState"
            to: "toState"
            enabled: false
        }
        pushExit: Transition {
            from: "fromState"
            to: "toState"
            enabled: false
        }
    }
}
