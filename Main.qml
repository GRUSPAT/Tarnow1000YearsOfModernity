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
            left: parent.left
            bottom: parent.bottom
            right: parent.right
        }
        layoutDirection: Qt.LeftToRight
        spacing: 10

        Item {
            width: 8
        }
        ToolButton {
            icon.source: "icons/HomeIcon.png"
            onClicked: stackView.push("screens/HomeScreen.qml")
        }

        ToolButton {
            icon.source: "icons/LocationsIcon.png"
            onClicked: stackView.push("screens/LocationsScreen.qml")
        }

        ToolButton {
            icon.source: "icons/MapIcon.png"
            onClicked: stackView.push("screens/MapScreen.qml")
        }

        ToolButton {
            icon.source: "icons/RoutesIcon.png"
            onClicked: stackView.push("screens/RoutesScreen.qml")
        }

        ToolButton {
            icon.source: "icons/SettingsIcon.png"
            onClicked: stackView.push("screens/SettingsScreen.qml")
        }
    }

    StackView {
        id: stackView
        initialItem: "screens/HomeScreen.qml"
        anchors.fill: parent
    }
}
