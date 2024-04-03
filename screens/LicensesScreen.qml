import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15

Item {
    property color backgroundColor: "#F2F3F3"
    property color primaryColor: "#FCFCFC"
    property color textColor: "#000000"
    property color accentColor: "#5A8A98"

    Rectangle{
        anchors.fill: parent
        z:0
        color: backgroundColor
    }
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
            height: rootWindow.height * 0.12
            color: primaryColor
            z:1
            Row{
                height: topBar.height
                width: topBar.width
                topPadding: 36
                leftPadding: 20
                rightPadding: 20
                Rectangle{
                    anchors.bottom: parent.bottom
                    width: topBar.width * 0.65 - 20
                    height: topBar.height - 45
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
                    height: topBar.height - 45
                    anchors.bottom: parent.bottom
                    color: primaryColor
                    z:1
                    RoundButton{
                        id: closeButton
                        width: 40
                        height: 40
                        anchors.right: parent.right
                        anchors.topMargin: 45
                        contentItem: IconImage {
                            anchors.centerIn: parent
                            width: 34
                            height: 34
                            color: primaryColor
                            source: "qrc:/icons/CloseIcon.svg"
                        }
                        background: Rectangle {
                            color: accentColor
                            radius: 5
                            opacity: closeButton.pressed ? 0.5 : 1.0
                        }
                        onClicked: {
                            mainNavBar.visible = true
                            slideAnimation.enabled = false
                            stackView.pop()
                        }
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
            font.family: font.font.family
            width: parent.width
            wrapMode: Text.WordWrap
            text: rootWindow.selectedLanguage === "pl" ? 'Aplikacja napisana została w programie Qt Creator Community i jest udostępniona na licencji GNU GPL:' :
                                                         'This app was written in Qt Creator Community and is published under GNU GPL License:'
            font.pixelSize: 14
        }
        Text {
            font.family: font.font.family
            width: parent.width
            wrapMode: Text.WordWrap
            text: rootWindow.selectedLanguage === "pl" ?
                      "Niniejszy program jest wolnym oprogramowaniem; możesz go rozprowadzać dalej i/lub modyfikować na warunkach Powszechnej Licencji Publicznej GNU, wydanej przez Fundację Wolnego Oprogramowania - według wersji 3 tej Licencji lub (według twojego wyboru) którejś z późniejszych wersji.\n

    Niniejszy program rozpowszechniany jest z nadzieją, iż będzie on użyteczny - jednak BEZ JAKIEJKOLWIEK GWARANCJI, nawet domyślnej gwarancji PRZYDATNOŚCI HANDLOWEJ albo PRZYDATNOŚCI DO OKREŚLONYCH ZASTOSOWAŃ. W celu uzyskania bliższych informacji sięgnij do Powszechnej Licencji Publicznej GNU.\n
    Z pewnością wraz z niniejszym programem otrzymałeś też egzemplarz Powszechnej Licencji Publicznej GNU (GNU General Public License); jeśli nie - zobacz <http://www.gnu.org/licenses/>." :
                      'This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.\n

    This program is distributed in the hope that it will be useful
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.\n

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>'
            font.pixelSize: 12
        }
        Text {
            id: licenseTextSVG1
            font.family: font.font.family
            width: parent.width
            wrapMode: Text.WordWrap
            text: rootWindow.selectedLanguage === "pl" ? '<html><style type="text/css"></style>Vectors and icons by <a href="https://dribbble.com/AkashRajDahal?ref=svgrepo.com" target="_blank">Akashrajdahal</a> in CC Attribution License via <a href="https://www.svgrepo.com/" target="_blank">SVG Repo</a></html>' :
                                                         '<html><style type="text/css"></style>Vectors and icons by <a href="https://dribbble.com/AkashRajDahal?ref=svgrepo.com" target="_blank">Akashrajdahal</a> in CC Attribution License via <a href="https://www.svgrepo.com/" target="_blank">SVG Repo</a></html>'
            font.pixelSize: 12
            onLinkActivated: link1 => Qt.openUrlExternally(link1)
        }
        Text {
            id: licenseTextSVG2
            font.family: font.font.family
            width: parent.width
            wrapMode: Text.WordWrap
            text: rootWindow.selectedLanguage === "pl" ? '<html><style type="text/css"></style>Vectors and icons by <a href="https://dazzleui.gumroad.com/l/dazzleiconsfree?ref=svgrepo.com" target="_blank">Dazzle Ui</a> in CC Attribution License via <a href="https://www.svgrepo.com/" target="_blank">SVG Repo</a></html>' :
                                                         '<html><style type="text/css"></style>Vectors and icons by <a href="https://dazzleui.gumroad.com/l/dazzleiconsfree?ref=svgrepo.com" target="_blank">Dazzle Ui</a> in CC Attribution License via <a href="https://www.svgrepo.com/" target="_blank">SVG Repo</a></html>'
            font.pixelSize: 12
            onLinkActivated: link1 => Qt.openUrlExternally(link1)
        }
        Text {
            id: licenseTextSVG3
            font.family: font.font.family
            width: parent.width
            wrapMode: Text.WordWrap
            text: rootWindow.selectedLanguage === "pl" ? '<html><style type="text/css"></style>Vectors and icons by <a href="https://github.com/element-plus/element-plus-icons?ref=svgrepo.com" target="_blank">Element Plus</a> in MIT License via <a href="https://www.svgrepo.com/" target="_blank">SVG Repo</a></html>' :
                                                         '<html><style type="text/css"></style>Vectors and icons by <a href="https://github.com/element-plus/element-plus-icons?ref=svgrepo.com" target="_blank">Element Plus</a> in MIT License via <a href="https://www.svgrepo.com/" target="_blank">SVG Repo</a></html>'
            font.pixelSize: 12
            onLinkActivated: link1 => Qt.openUrlExternally(link1)
        }
        Text {
            id: licenseTextSVG4
            font.family: font.font.family
            width: parent.width
            wrapMode: Text.WordWrap
            text: rootWindow.selectedLanguage === "pl" ? '<html><style type="text/css"></style>Vectors and icons by <a href="https://nickylimyeanfen.art/#/?ref=svgrepo.com" target="_blank">Nickylimyeanfen</a> in CC Attribution License via <a href="https://www.svgrepo.com/" target="_blank">SVG Repo</a></html>' :
                                                         '<html><style type="text/css"></style>Vectors and icons by <a href="https://nickylimyeanfen.art/#/?ref=svgrepo.com" target="_blank">Nickylimyeanfen</a> in CC Attribution License via <a href="https://www.svgrepo.com/" target="_blank">SVG Repo</a></html>'
            font.pixelSize: 12
            onLinkActivated: link1 => Qt.openUrlExternally(link1)
        }
        Text {
            id: licenseTextSVG5
            font.family: font.font.family
            width: parent.width
            wrapMode: Text.WordWrap
            text: rootWindow.selectedLanguage === "pl" ? '<html><style type="text/css"></style>Vectors and icons by <a href="https://www.figma.com/@d12da0b9_b193_4?ref=svgrepo.com" target="_blank">Giovana</a> in CC Attribution License via <a href="https://www.svgrepo.com/" target="_blank">SVG Repo</a></html>' :
                                                         '<html><style type="text/css"></style>Vectors and icons by <a href="https://www.figma.com/@d12da0b9_b193_4?ref=svgrepo.com" target="_blank">Giovana</a> in CC Attribution License via <a href="https://www.svgrepo.com/" target="_blank">SVG Repo</a></html>'
            font.pixelSize: 12
            onLinkActivated: link1 => Qt.openUrlExternally(link1)
        }
        Text {
            id: licenseTextSVG6
            font.family: font.font.family
            width: parent.width
            wrapMode: Text.WordWrap
            text: rootWindow.selectedLanguage === "pl" ? '<html><style type="text/css"></style>Vectors and icons by <a href="https://github.com/fabric-ds/icons?ref=svgrepo.com" target="_blank">Fabric Design System</a> in MIT License via <a href="https://www.svgrepo.com/" target="_blank">SVG Repo</a></html>' :
                                                         '<html><style type="text/css">Vectors and icons by <a href="https://github.com/fabric-ds/icons?ref=svgrepo.com" target="_blank">Fabric Design System</a> in MIT License via <a href="https://www.svgrepo.com/" target="_blank">SVG Repo</a></style></html>'
            font.pixelSize: 12
            onLinkActivated: link1 => Qt.openUrlExternally(link1)
        }
        Text {
            id: licenseTextSVG7
            font.family: font.font.family
            width: parent.width
            wrapMode: Text.WordWrap
            text: rootWindow.selectedLanguage === "pl" ? '<html><style type="text/css"></style>Vectors and icons by <a href="https://www.figma.com/@thinkcly?ref=svgrepo.com" target="_blank">Konstantin Filatov</a> in CC Attribution License via <a href="https://www.svgrepo.com/" target="_blank">SVG Repo</a></html>' : '<html><style type="text/css"></style>Vectors and icons by <a href="https://www.figma.com/@thinkcly?ref=svgrepo.com" target="_blank">Konstantin Filatov</a> in CC Attribution License via <a href="https://www.svgrepo.com/" target="_blank">SVG Repo</a></html>'
            font.pixelSize: 12
            onLinkActivated: link1 => Qt.openUrlExternally(link1)
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
