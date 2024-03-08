import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    width: 430
    height: 932
    visible: true
    title: qsTr("Tarnów 1000 lat nowoczesności")

    RowLayout {
        anchors{
            horizontalCenter: parent.hohorizontalCenter
            bottom: parent.bottom
        }
        height: parent.height * 0.12
        width: parent.width

        Item {
            width: 10
        }

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
            icon.source: "/icons/SettingsIcon.svg"
            width: parent.width * 0.2
            height: parent.height
            onClicked: stackView.push("screens/SettingsScreen.qml")
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
