import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15

Item {
    property color backgroundColor: "#F2F3F3"
    property color primaryColor: "#FCFCFC"
    property color textColor: "#000000"
    property color accentColor: "#5A8A98"

    Column {
        width: rootWindow.width
        height: rootWindow.height
        bottomPadding: rootWindow.height * 0.07
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
                    height: topBar.height * 0.5 - 45
                    color: primaryColor
                    id: objekty
                    z:1
                    Text {
                        id:topBarLabel
                        anchors.leftMargin: 20
                        anchors.topMargin: 45
                        font.family: font.font.family
                        text: rootWindow.selectedLanguage === "pl" ? "LICENSJE" : "LICENSES"
                        font.pixelSize: 32
                    }
                }
                Rectangle{
                    width: topBar.width * 0.35 - 20
                    height: topBar.height * 0.5 - 36
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
        Text {
            id: licenseTextQt
            font.family: font.font.family
            width: parent.width
            wrapMode: Text.WordWrap
            text: rootWindow.selectedLanguage === "pl" ? "Użyty font:\n
Montserrat - zaprojektowany przez Julieta Ulanovsky, Sol Matas, Juan Pablo del Peral, Jacques Le Bailly. Udostępniony na licencji Open Font License. (https://openfontlicense.org/)" : "This app was written in Qt Creator Community and is published under GNU GPL License:\n
This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>"
            font.pixelSize: 12
        }
        Text {
            id: licenseTextFont
            font.family: font.font.family
            width: parent.width
            wrapMode: Text.WordWrap
            text: rootWindow.selectedLanguage === "pl" ? "Użyty font:\n
Montserrat - zaprojektowany przez Julieta Ulanovsky, Sol Matas, Juan Pablo del Peral, Jacques Le Bailly. Udostępniony na licencji Open Font License. (https://openfontlicense.org/)" : "Fonts used:\n
Montserrat - designed by Julieta Ulanovsky, Sol Matas, Juan Pablo del Peral, Jacques Le Bailly. These fonts are licensed under the Open Font License. (https://openfontlicense.org/)"
            font.pixelSize: 12
        }
    }
}
