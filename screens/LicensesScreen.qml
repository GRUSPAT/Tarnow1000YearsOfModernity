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
    Column {
        width: rootWindow.width
        height: rootWindow.height
        Rectangle {
            id: topBar
            width: rootWindow.width
            height: rootWindow.height * 0.12
            color: Style.primaryColor
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
                    color: Style.primaryColor
                    id: objekty
                    z:1
                    Text {
                        id:topBarLabel
                        anchors.leftMargin: 20
                        anchors.topMargin: 45
                        font.family: Style.bold
                        text: rootWindow.selectedLanguage === "pl" ? "LICENCJE" : "LICENSES"
                        font.pixelSize: 32
                    }
                }
                Rectangle{
                    width: topBar.width * 0.35 - 20
                    height: topBar.height - 45
                    anchors.bottom: parent.bottom
                    color: Style.primaryColor
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
                            color: Style.primaryColor
                            source: "qrc:/icons/CloseIcon.svg"
                        }
                        background: Rectangle {
                            color: Style.accentColor
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

        ListModel {
            id: licensesModelPolish
            ListElement{
                title: 'Aplikacja napisana została w programie Qt Creator Community Edition i jest udostępniona na licencji GNU GPL:'
                text: 'Niniejszy program jest wolnym oprogramowaniem; możesz go rozprowadzać dalej i/lub modyfikować na warunkach Powszechnej Licencji Publicznej GNU, wydanej przez Fundację Wolnego Oprogramowania - według wersji 3 tej Licencji lub (według twojego wyboru) którejś z późniejszych wersji. Niniejszy program rozpowszechniany jest z nadzieją, iż będzie on użyteczny - jednak BEZ JAKIEJKOLWIEK GWARANCJI, nawet domyślnej gwarancji PRZYDATNOŚCI HANDLOWEJ albo PRZYDATNOŚCI DO OKREŚLONYCH ZASTOSOWAŃ. W celu uzyskania bliższych informacji sięgnij do Powszechnej Licencji Publicznej GNU. Z pewnością wraz z niniejszym programem otrzymałeś też egzemplarz Powszechnej Licencji Publicznej GNU (GNU General Public License); jeśli nie - zobacz <http://www.gnu.org/licenses/>.'
            }
            ListElement{
                title: 'Użyty font'
                text: 'Montserrat - zaprojektowany przez Julieta Ulanovsky, Sol Matas, Juan Pablo del Peral, Jacques Le Bailly. Udostępniony na licencji Open Font License. (https://openfontlicense.org/)'
            }
            ListElement{
                title: 'Ikona trasy z zmienionym kolorem:'
                text: '<html><style type="text/css"></style>Vectors and icons by <a href="https://dribbble.com/AkashRajDahal?ref=svgrepo.com" target="_blank">Akashrajdahal</a> in CC Attribution License via <a href="https://www.svgrepo.com/" target="_blank">SVG Repo</a></html>'
            }
            ListElement{
                title: 'Ikona wyszukiwania z zmienionym kolorem:'
                text: '<html><style type="text/css"></style>Vectors and icons by <a href="https://dazzleui.gumroad.com/l/dazzleiconsfree?ref=svgrepo.com" target="_blank">Dazzle Ui</a> in CC Attribution License via <a href="https://www.svgrepo.com/" target="_blank">SVG Repo</a></html>'
            }
            ListElement{
                title: 'Ikona zamykania z zmienionym kolorem:'
                text: '<html><style type="text/css"></style>Vectors and icons by <a href="https://github.com/element-plus/element-plus-icons?ref=svgrepo.com" target="_blank">Element Plus</a> in MIT License via <a href="https://www.svgrepo.com/" target="_blank">SVG Repo</a></html>'
            }
            ListElement{
                title: 'Ikona nawigacji z zmienionym kolorem:'
                text: '<html><style type="text/css"></style>Vectors and icons by <a href="https://nickylimyeanfen.art/#/?ref=svgrepo.com" target="_blank">Nickylimyeanfen</a> in CC Attribution License via <a href="https://www.svgrepo.com/" target="_blank">SVG Repo</a></html>'
            }
            ListElement{
                title: 'Ikona trasy z pinami z zmienionym kolorem:'
                text: '<html><style type="text/css"></style>Vectors and icons by <a href="https://www.figma.com/@d12da0b9_b193_4?ref=svgrepo.com" target="_blank">Giovana</a> in CC Attribution License via <a href="https://www.svgrepo.com/" target="_blank">SVG Repo</a></html>'
            }
            ListElement{
                title: 'Ikona pinu z zmienionym kolorem:'
                text: '<html><style type="text/css"></style>Vectors and icons by <a href="https://github.com/fabric-ds/icons?ref=svgrepo.com" target="_blank">Fabric Design System</a> in MIT License via <a href="https://www.svgrepo.com/" target="_blank">SVG Repo</a></html>'
            }
            ListElement{
                title: 'Ikony domu, ustawień, mapy z zmienionym kolorem:'
                text: '<html><style type="text/css"></style>Vectors and icons by <a href="https://www.figma.com/@thinkcly?ref=svgrepo.com" target="_blank">Konstantin Filatov</a> in CC Attribution License via <a href="https://www.svgrepo.com/" target="_blank">SVG Repo</a></html>'
            }
        }
        ListModel {
            id: licensesModelEnglish
            ListElement{
                title: 'This app was written in Qt Creator Community Edition and is published under GNU GPL License:'
                text: 'This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version. This program is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.\n You should have received a copy of the GNU General Public License along with this program.  If not, see <http://www.gnu.org/licenses/>'
            }
            ListElement{
                title: 'Font used:'
                text: 'Montserrat - designed by Julieta Ulanovsky, Sol Matas, Juan Pablo del Peral, Jacques Le Bailly. These fonts are licensed under the Open Font License. (https://openfontlicense.org/)'
            }
            ListElement{
                title: 'Path icon with changed color:'
                text: '<html><style type="text/css"></style>Vectors and icons by <a href="https://dribbble.com/AkashRajDahal?ref=svgrepo.com" target="_blank">Akashrajdahal</a> in CC Attribution License via <a href="https://www.svgrepo.com/" target="_blank">SVG Repo</a></html>'
            }
            ListElement{
                title: 'Search icon with changed color: '
                text: '<html><style type="text/css"></style>Vectors and icons by <a href="https://dazzleui.gumroad.com/l/dazzleiconsfree?ref=svgrepo.com" target="_blank">Dazzle Ui</a> in CC Attribution License via <a href="https://www.svgrepo.com/" target="_blank">SVG Repo</a></html>'
            }
            ListElement{
                title: 'Close icon with changed color:'
                text: '<html><style type="text/css"></style>Vectors and icons by <a href="https://github.com/element-plus/element-plus-icons?ref=svgrepo.com" target="_blank">Element Plus</a> in MIT License via <a href="https://www.svgrepo.com/" target="_blank">SVG Repo</a></html>'
            }
            ListElement{
                title: 'Navigation icon with changed color:'
                text: '<html><style type="text/css"></style>Vectors and icons by <a href="https://nickylimyeanfen.art/#/?ref=svgrepo.com" target="_blank">Nickylimyeanfen</a> in CC Attribution License via <a href="https://www.svgrepo.com/" target="_blank">SVG Repo</a></html>'
            }
            ListElement{
                title: 'Path with pins icon with changed color:'
                text: '<html><style type="text/css"></style>Vectors and icons by <a href="https://www.figma.com/@d12da0b9_b193_4?ref=svgrepo.com" target="_blank">Giovana</a> in CC Attribution License via <a href="https://www.svgrepo.com/" target="_blank">SVG Repo</a></html>'
            }
            ListElement{
                title: 'Pin icon with changed color:'
                text: '<html><style type="text/css"></style>Vectors and icons by <a href="https://github.com/fabric-ds/icons?ref=svgrepo.com" target="_blank">Fabric Design System</a> in MIT License via <a href="https://www.svgrepo.com/" target="_blank">SVG Repo</a></html>'
            }
            ListElement{
                title: 'Home, Settings, Map icons with changed color:'
                text: '<html><style type="text/css"></style>Vectors and icons by <a href="https://www.figma.com/@thinkcly?ref=svgrepo.com" target="_blank">Konstantin Filatov</a> in CC Attribution License via <a href="https://www.svgrepo.com/" target="_blank">SVG Repo</a></html>'
            }
        }
        ScrollView {
            height: rootWindow.height - rootWindow.height * 0.12
            width: rootWindow.width
            contentHeight: licensesList.height
            contentWidth: licensesList.width
            ListView {
                id: licensesList
                width: parent.width
                topMargin: 20
                model: rootWindow.selectedLanguage === "pl" ? licensesModelPolish : licensesModelEnglish
                ScrollBar.vertical: ScrollBar{
                    id: scroller
                    interactive: false
                    policy: ScrollBar.AsNeeded
                    contentItem: Rectangle {
                        implicitWidth: 4
                        radius: 2
                        color: Style.accentColor
                    }
                    background: Rectangle {
                        implicitWidth: 4
                        color: 'transparent'
                    }
                }
                delegate:
                    Column{
                    width: rootWindow.width - leftPadding - rightPadding
                    spacing: 5
                    rightPadding: 20
                    leftPadding: 20
                    bottomPadding: 10
                    Text {
                        width: parent.width
                        text: model.title
                        font.bold: true
                        font.pixelSize: 14
                        wrapMode: Text.WordWrap
                    }
                    Text {
                        width: parent.width
                        text: model.text
                        font.pixelSize: 12
                        wrapMode: Text.WordWrap
                        onLinkActivated: link1 => Qt.openUrlExternally(link1)
                    }
                }
            }
        }
    }
}
