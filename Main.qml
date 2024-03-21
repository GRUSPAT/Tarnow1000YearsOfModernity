import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import QtPositioning

ApplicationWindow {
    id: rootWindow
    flags: Qt.Window | Qt.MaximizeUsingFullscreenGeometryHint;
    width: 430
    height: 932
    visible: true
    title: qsTr("Tarnów 1000 lat nowoczesności")

    Component.onCompleted: loadData()

    property var jsonContext
    property var jsonRoutes
    property string selectedLanguage: "pl"
    property geoCoordinate lastMapCenter: QtPositioning.coordinate(50.01, 20.98)

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
            console.log(jsonContext.context_pl[0].name)
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
        height: parent.height * 0.08
        width: parent.width
        z:1
        color: "white"
        Rectangle{

        z:1
        anchors.top: parent.top
        height: 1
        width: parent.width
        color: "#C5C5C5"
        }
        RowLayout {
           // anchors.centerIn: parent
           anchors.top: parent.top
           anchors.horizontalCenter: parent.horizontalCenter
            Button {
                id:homeButton
                flat: true
                icon.source: "qrc:/icons/HomeIcon.svg"
                width: parent.width * 0.2
                height: parent.height
                icon.height: 25
                onClicked: stackView.push("qrc:/screens/HomeScreen.qml")
            }

            Button {
                id:objectsButton
                flat: true
                icon.source: "qrc:/icons/LocationsIcon.svg"
                width: parent.width * 0.05
                icon.width: 20
                icon.height: 25
                height: parent.height
                onClicked: stackView.push("qrc:/screens/LocationsScreen.qml")
            }

            Button {
                id:mapButton
                flat: true
                icon.source: "qrc:/icons/MapIcon.svg"
                width: parent.width * 0.2
                height: parent.height
                icon.height: 25
                onClicked: stackView.push("qrc:/screens/MapScreen.qml")
            }

            Button {
                id:routesButton
                flat: true
                icon.source: "qrc:/icons/RoutesIcon.svg"
                width: parent.width * 0.2
                height: parent.height
                icon.height: 25
                onClicked: stackView.push("qrc:/screens/RoutesScreen.qml")
            }

            Button {
                id:settingsButton
                flat: true
                icon.source: "qrc:/icons/SettingsIcon.svg"
                width: parent.width * 0.2
                height: parent.height
                icon.height: 25
                onClicked: stackView.push("qrc:/screens/SettingsScreen.qml")
            }
        }
    }

    StackView {
        id: stackView
        initialItem: "qrc:/screens/HomeScreen.qml"
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
