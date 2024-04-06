/*
    © 2024 Patryk Gruszowski, Michał Groński

    This file is part of Tarnow 1000 Years of Modernity.

    Tarnow 1000 Years of Modernity is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 3 of the License, or
    (at your option) any later version.

    Tarnow 1000 Years of Modernity is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Foobar.  If not, see <http://www.gnu.org/licenses/>.
*/
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import App 1.0

Item {
    Rectangle{
        anchors.fill: parent
        z:0
        color: Style.backgroundColor
    }
    Rectangle{
        width: parent.width
        height: parent.height
        anchors.fill: parent
        color: Style.primaryColor
        z:1
        RoundButton{
            id: acceptButton
            width: 120
            height: 40
            anchors.centerIn: parent
            contentItem: Text {
                anchors.centerIn: parent
                width: parent.width
                height: parent.height
                color: Style.primaryColor
                text: "Dalej"
            }
            background: Rectangle {
                color: Style.accentColor
                radius: 5
                opacity: acceptButton.pressed ? 0.5 : 1.0
            }
            onClicked: {
                mainNavBar.visible = true
                //slideAnimation.enabled = false
                appSettings.setValue("initialScreenDisplayed", true)
                stackView.push("qrc:/screens/HomeScreen.qml")
            }
        }
    }
}
