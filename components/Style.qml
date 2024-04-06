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
pragma Singleton
import QtQuick 2.15
QtObject {
    readonly property color backgroundColor: "#F2F3F3"
    readonly property color primaryColor: "#FCFCFC"
    readonly property color textColor: "#000000"
    readonly property color accentColor: "#5A8A98"
    readonly property color borderColor: "#C5C5C5"
    readonly property FontLoader montserratBold: FontLoader {
        source: "qrc:/fonts/Montserrat-Bold.ttf"
    }
    readonly property FontLoader montserratRegular: FontLoader {
        source: "qrc:/fonts/Montserrat-Regular.ttf"
    }
    readonly property string regular: montserratRegular.font.family
    readonly property string bold: montserratBold.font.family
}
