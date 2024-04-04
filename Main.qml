import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import QtPositioning
//import Qt.labs.settings 1.0
import QtCore

ApplicationWindow {
    id: rootWindow
    flags: Qt.Window | Qt.MaximizeUsingFullscreenGeometryHint;
    width: 430
    height: 932
    visible: true
    title: qsTr("Tarnów 1000 lat nowoczesności")
    Settings {
        id: appSettings
        property string selectedLanguage: "pl"
        property bool initialScreenDisplayed: false
    }

    Component.onCompleted: {
        if(appSettings.initialScreenDisplayed){
            selectedLanguage = appSettings.selectedLanguage
        } else {
            slideAnimation.enabled = true
            mainNavBar.visible = false
            stackView.push("qrc:/screens/InitialScreen.qml")
        }
        loadData()
    }

    property var jsonContext
    property var jsonRoutes
    property string selectedLanguage: "pl"
    property geoCoordinate lastMapCenter: QtPositioning.coordinate(50.01, 20.98)
    property real lastMapZoom: 15
    property var userRoute: []

    function loadData(){
        let xhr = new XMLHttpRequest();
        let xhr2 = new XMLHttpRequest();
        let xhr3 = new XMLHttpRequest();
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

    onSelectedLanguageChanged: {
        appSettings.setValue("selectedLanguage", selectedLanguage)
    }

    Rectangle{
        id: mainNavBar
        anchors{
            horizontalCenter: parent.horizontalCenter
            bottom: parent.bottom
        }
        height: parent.height * 0.095
        width: parent.width
        z:1
        color: "white"
        Rectangle{
            //z:1
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
                onClicked: {
                    slideAnimation.enabled = false
                    stackView.push("qrc:/screens/HomeScreen.qml")
                }
            }
            Button {
                id:objectsButton
                flat: true
                icon.source: "qrc:/icons/LocationsIcon.svg"
                width: parent.width * 0.05
                icon.width: 20
                icon.height: 25
                height: parent.height
                onClicked: {
                    slideAnimation.enabled = false
                    stackView.push("qrc:/screens/LocationsScreen.qml")
                }
            }
            Button {
                id:mapButton
                flat: true
                icon.source: "qrc:/icons/MapIcon.svg"
                width: parent.width * 0.2
                height: parent.height
                icon.height: 25
                onClicked: {
                    slideAnimation.enabled = false
                    stackView.push("qrc:/screens/MapScreen.qml")
                }
            }
            Button {
                id:routesButton
                flat: true
                icon.source: "qrc:/icons/RoutesIcon.svg"
                width: parent.width * 0.2
                height: parent.height
                icon.height: 25
                onClicked: {
                    slideAnimation.enabled = false
                    stackView.push("qrc:/screens/RoutesScreen.qml")
                }
            }
            Button {
                id:settingsButton
                flat: true
                icon.source: "qrc:/icons/SettingsIcon.svg"
                width: parent.width * 0.2
                height: parent.height
                icon.height: 25
                onClicked: {
                    slideAnimation.enabled = false
                    stackView.push("qrc:/screens/SettingsScreen.qml")
                }
            }
        }
    }

    StackView {
        id: stackView
        initialItem: "qrc:/screens/HomeScreen.qml"
        anchors.fill: parent
        pushEnter: Transition {
            id: slideAnimation
            enabled: false
            NumberAnimation {
                properties: "y"
                from: stackView.height
                to: 0
                easing.type: Easing.InOutQuad
            }
        }
        pushExit: Transition {
            NumberAnimation {
                properties: "opacity"
                from: 1
                to: 0
                duration: 300
                easing.type: Easing.InOutQuad
            }
        }
        popEnter: Transition {
            NumberAnimation {
                properties: "opacity"
                from: 0
                to: 1
                duration: 300
                easing.type: Easing.InOutQuad
            }
        }
        popExit: Transition {
            NumberAnimation {
                properties: "y"
                from: 0
                to: stackView.height
                easing.type: Easing.InOutQuad
            }
        }
    }
}
