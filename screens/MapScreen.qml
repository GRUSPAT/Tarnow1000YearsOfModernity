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
import QtLocation
import QtPositioning
import QtQuick.Effects

Item {
    id: mapWindowItem
    width: rootWindow.width
    height: rootWindow.height
    property var modelData
    property color backgroundColor: "#F2F3F3"
    property color primaryColor: "#FCFCFC"
    property color textColor: "#000000"
    property color accentColor: "#5A8A98"
    property color borderColor: "#C5C5C5"
    FontLoader {
        id: font1
        source: "qrc:/fonts/Montserrat-Bold.ttf"
    }

    Popup {
        id: routeWindowPopup
        width: rootWindow.width
        height: routeList.contentHeight + rootWindow.height * 0.07 + 30
        parent: mapWindowItem
        x: 0
        y: 0
        enter: Transition {
            ParallelAnimation {
                NumberAnimation {
                    properties: "height"
                    from: 0
                    to: routeWindowPopup.height
                    duration: 300
                    easing.type: Easing.InOutQuad
                }
                NumberAnimation {
                    target: routeWindowPopup
                    properties: "opacity"
                    from: 0
                    to: 1
                    duration: 500
                    easing.type: Easing.InOutQuad
                }
            }
        }
        exit: Transition {
            NumberAnimation {
                target: routeWindowPopup
                properties: "opacity"
                from: 1
                to: 0
                duration: 200
                easing.type: Easing.InOutQuad
            }
        }

        contentItem: Rectangle {
            id: routeWindowRectangle
            width: routeWindowPopup.width
            height: routeList.contentHeight + rootWindow.height * 0.07 + 30
            color: 'transparent'
            radius: 20
            z:1
            Column{
                id: routePopupColumn
                width: parent.width
                height: parent.height
                topPadding: 18
                leftPadding: 10
                rightPadding: 10
                Row{
                    id: rowRouteLabel
                    width: parent.width - 20
                    height: rootWindow.height * 0.07
                    spacing: 22
                    Rectangle{
                        width: parent.width * 0.5 - 10
                        height: parent.height - 15
                        anchors.bottom: parent.bottom
                        color: 'transparent'
                        Text {
                            id:routePopupLabel
                            font.family: font1.font.family
                            text: rootWindow.selectedLanguage === "pl" ? "TRASA" : "ROUTE"
                            font.pixelSize: 32
                        }
                    }
                    Rectangle{
                        width: parent.width * 0.5 - 10
                        height: parent.height - 20
                        anchors.bottom: parent.bottom
                        color: 'transparent'
                        RoundButton{
                            id: hideRouteButton
                            width: parent.width
                            height: 28
                            radius: 6
                            contentItem: Rectangle{
                                anchors.centerIn: parent
                                width: parent.width
                                height: parent.height
                                color: 'transparent'
                                Text {
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    text: rootWindow.selectedLanguage === "pl" ? "UKRYJ TWOJĄ TRASĘ" : "HIDE YOUR ROUTE"
                                    font.pixelSize: 12
                                    font.family: font1.name
                                    color: accentColor
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                    elide: Text.ElideRight
                                }
                            }
                            background: Rectangle {
                                anchors.fill: parent
                                implicitWidth: parent.width
                                implicitHeight: parent.height
                                color: hideRouteButton.pressed ? accentColor : primaryColor
                                radius: 6
                                opacity: hideRouteButton.pressed ? 0.5 : 1.0
                                border.color: accentColor
                                border.width: 2
                            }
                            onClicked: {
                                routeWindowPopup.visible = false
                            }
                        }
                    }
                }
                ScrollView {
                    id: routeScroll
                    width: parent.width - 20
                    height: routeList.contentHeight
                    ScrollBar.vertical.policy: ScrollBar.AlwaysOff
                    ListView {
                        id: routeList
                        width: parent.width
                        height: 40
                        model: rootWindow.userRoute
                        spacing: 5

                        property bool footerVisible: false

                        delegate: Rectangle {
                            width: parent.width
                            height: 40
                            color: 'transparent'
                            FontLoader { id: font3; source: "qrc:/fonts/Montserrat-Bold.ttf" }
                            Row{
                                width: parent.width
                                height: parent.height
                                Text {
                                    leftPadding: -2
                                    width: parent.width * 0.08
                                    height: 40
                                    color: "black"
                                    horizontalAlignment: Text.AlignLeft
                                    verticalAlignment: Text.AlignVCenter
                                    font.pixelSize: 26
                                    font.family: font3.name
                                    text: index + 1
                                }
                                Text {
                                    width: parent.width * 0.84
                                    height: 40
                                    color: "black"
                                    horizontalAlignment: Text.AlignLeft
                                    verticalAlignment: Text.AlignVCenter
                                    font.pixelSize: 14
                                    font.family: font3.name
                                    wrapMode: Text.WordWrap
                                    text: `${modelData.name}`
                                }
                                Rectangle {
                                    anchors.verticalCenter: parent.verticalCenter
                                    width: parent.width * 0.08
                                    height: 40
                                    color: 'transparent'
                                    RoundButton{
                                        id: deleteButton
                                        width: 36
                                        height: 36
                                        anchors.verticalCenter: parent.verticalCenter
                                        contentItem: IconImage {
                                            anchors.centerIn: parent
                                            width: 34
                                            height: 34
                                            source: "qrc:/icons/CloseIcon.svg"
                                        }
                                        background: Rectangle {
                                            color: accentColor
                                            radius: 5
                                            opacity: deleteButton.pressed ? 0.5 : 1.0
                                        }
                                        onClicked: {
                                            rootWindow.userRoute.splice(index,1)
                                            routeList.model = rootWindow.userRoute
                                        }
                                    }
                                }
                            }
                            Rectangle {
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.bottom: parent.bottom
                                width: parent.width - 58
                                height: 1
                                color: "black"
                            }
                        }
                        footer: Rectangle {
                            id: footerRectangle
                            width: parent.width
                            height: 40
                            color: primaryColor
                            FontLoader {
                                id: font4
                                source: "qrc:/fonts/Montserrat-Bold.ttf"
                            }
                            RoundButton{
                                anchors.centerIn: parent
                                id: navigateRouteButton
                                width: footerRectangle.width * 0.6
                                height: 28
                                radius: 6
                                visible: routeList.footerVisible
                                contentItem: Rectangle{
                                    anchors.centerIn: parent
                                    width: navigateRouteButton.width
                                    height: navigateRouteButton.height
                                    color: 'transparent'
                                    Text {
                                        anchors.verticalCenter: parent.verticalCenter
                                        anchors.horizontalCenter: parent.horizontalCenter
                                        text: rootWindow.selectedLanguage === "pl" ? "Nawiguj po trasie" : "Navigate to route"
                                        font.pixelSize: 12
                                        font.family: font4.name
                                        color: primaryColor
                                        horizontalAlignment: Text.AlignHCenter
                                        verticalAlignment: Text.AlignVCenter
                                    }
                                }
                                background: Rectangle {
                                    anchors.fill: parent
                                    implicitWidth: parent.width
                                    implicitHeight: parent.height
                                    color: accentColor
                                    radius: 6
                                    opacity: navigateRouteButton.pressed ? 0.5 : 1.0
                                }
                                onClicked: {
                                    var modelData = rootWindow.userRoute
                                    var tempWaypoints = []
                                    var resultDestination
                                    var resultWaypoints = ""
                                    var count = modelData.length
                                    if(count > 1){
                                        for (var i = 0; i < count - 1; ++i) {
                                            var tempCoordinate = modelData[i].coordinate.trim().split(",")
                                            tempWaypoints.push(`${tempCoordinate[0]}%2C${tempCoordinate[1]}`)
                                        }
                                        var count2 = tempWaypoints.length
                                        resultWaypoints += `${tempWaypoints[0]}`
                                        for (var j = 0; j < count2 - 1; ++j) {
                                            resultWaypoints +=  `%7C${tempWaypoints[j + 1]}`
                                        }
                                        resultDestination = modelData[count - 1].coordinate.trim().split(",")
                                        Qt.openUrlExternally(`https://www.google.com/maps/dir/?api=1&destination=${resultDestination[0] + "%2C" +resultDestination[1]}&waypoints=${resultWaypoints}&travelmode=walking`)
                                    } else {
                                        resultDestination = modelData[0].coordinate.trim().split(",")
                                        Qt.openUrlExternally(`https://www.google.com/maps/dir/?api=1&destination=${resultDestination[0] + "%2C" +resultDestination[1]}&travelmode=walking`)
                                    }
                                }
                            }
                            Text {
                                visible: !routeList.footerVisible
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                text: rootWindow.selectedLanguage === "pl" ? "Pusta" : "Empty"
                                font.pixelSize: 12
                                font.family: font4.name
                                color: accentColor
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }
                        }

                        onCountChanged: {
                            if(rootWindow.userRoute.length > 0){
                                circleRouteRow.visible = true
                                routeList.footerVisible = true
                                routeList.height = contentHeight
                                routeScroll.height = contentHeight
                                routeWindowRectangle.height = contentHeight + rootWindow.height * 0.07 + 20
                                routeWindowPopup.height = contentHeight + rootWindow.height * 0.07 + 40
                            } else {
                                circleRouteRow.visible = false
                                routeList.footerVisible = false
                                routeWindowRectangle.height =  rootWindow.height * 0.07 + 70
                                routeWindowPopup.height = rootWindow.height * 0.07 + 70
                            }
                            circleRouteLength.text = count
                        }
                    }
                }
            }
        }
        background: Rectangle {
            id: routeWindowBackgroundRectangle
            anchors.fill: parent
            implicitWidth: parent.width
            implicitHeight: parent.height
            color: primaryColor
            radius: 20
        }
    }

    Column {
        width: rootWindow.width
        height: rootWindow.height
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
                    width: topBar.width * 0.6 - 20
                    height: topBar.height - 45
                    color: primaryColor
                    z:1
                    Text {
                        id:topBarLabel
                        anchors.leftMargin: 20
                        anchors.topMargin: 45
                        font.family: font.font.family
                        text: rootWindow.selectedLanguage === "pl" ? "MAPA" : "MAP"
                        font.pixelSize: 32
                    }
                }
                Rectangle{
                    anchors.bottom: parent.bottom
                    width: topBar.width * 0.40 - 20
                    height: topBar.height - 50
                    color: primaryColor
                    z:1
                    RoundButton{
                        id: yourRouteButton
                        width: parent.width
                        height: 28
                        anchors.rightMargin: 20
                        anchors.topMargin: 45
                        leftPadding: 5
                        radius: 6
                        contentItem: Row{
                            width: parent.width
                            height: parent.height
                            spacing: 6
                            leftPadding: 1
                            IconImage {
                                anchors.verticalCenter: parent.verticalCenter
                                width: 16
                                height: 16
                                source: "qrc:/icons/UserRouteIcon.svg"
                            }
                            Text {
                                anchors.verticalCenter: parent.verticalCenter
                                text: rootWindow.selectedLanguage === "pl" ? "TWOJA TRASA" : "YOUR ROUTE"
                                font.pixelSize: 13
                                font.family: font.name
                                color: accentColor
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                elide: Text.ElideRight
                            }
                        }
                        background: Rectangle {
                            anchors.fill: parent
                            implicitWidth: parent.width
                            implicitHeight: parent.height
                            color: yourRouteButton.pressed ? accentColor : primaryColor
                            radius: 6
                            opacity: yourRouteButton.pressed ? 0.5 : 1.0
                            border.color: accentColor
                            border.width: 2
                        }
                        onClicked: {
                            routeWindowPopup.visible = true
                        }
                    }
                    Row{
                        id: circleRouteRow
                        width: parent.width
                        height: parent.height
                        anchors.fill: parent
                        z:1
                        padding: -11
                        visible: false
                        Rectangle {
                            width: 20
                            height: 20
                            radius: 10
                            color: accentColor
                            Text {
                                id: circleRouteLength
                                anchors.centerIn: parent
                                width: parent.width
                                height: parent.height
                                text: rootWindow.userRoute.length
                                font.pixelSize: 10
                                font.family: font.name
                                color: primaryColor
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }
                        }
                    }
                }

                Component.onCompleted: {
                    homeButton.icon.color = textColor
                    objectsButton.icon.color = textColor
                    mapButton.icon.color = accentColor
                    routesButton.icon.color = textColor
                    settingsButton.icon.color = textColor
                }

            }
        }
        Map {
            id: map
            width: parent.width
            height: parent.height * 0.785
            anchors.horizontalCenter: parent.horizontalCenter
            activeMapType: map.supportedMapTypes[0]
            z:0

            minimumZoomLevel: 13
            maximumZoomLevel: 15.5

            center: rootWindow.lastMapCenter
            zoomLevel: rootWindow.lastMapZoom
            plugin: Plugin {
                name: "osm"
                PluginParameter {
                    name: 'osm.mapping.offline.directory'
                    value: ':/offline_tiles/'
                }
                PluginParameter{
                    name: "osm.mapping.providersrepository.disabled"
                    value: "true"
                }
            }

            MapItemGroup {
                id: itemGroup
                Repeater{
                    model: rootWindow.selectedLanguage === "pl" ? rootWindow.jsonContext.context_pl : rootWindow.jsonContext.context_en

                    MapQuickItem {
                        FontLoader {
                            id: font2
                            source: "qrc:/fonts/Montserrat-Bold.ttf"
                        }
                        id: marker
                        property var tempCoordinate: modelData.coordinate.trim().split(",")
                        property int tempId: modelData.id + 1
                        coordinate: QtPositioning.coordinate(tempCoordinate[0], tempCoordinate[1])
                        anchorPoint.x: image.width/2
                        anchorPoint.y: image.height

                        sourceItem: RoundButton {
                            id: markerButton
                            width: markerPopup.visible ? 23 : 18
                            height: markerPopup.visible ? 28 : 23

                            Popup {
                                id: markerPopup
                                width: rootWindow.width - 30
                                height: 330
                                parent: markerButton
                                x: parent.x - parseInt(width / 2) + 9
                                y: parent.y - 340
                                visible: {
                                    if(mapWindowItem.modelData) {
                                        if(mapWindowItem.modelData.id == index) {
                                            return true
                                        } else {
                                            return false
                                        }
                                    } else {
                                        return false
                                    }
                                }
                                contentItem: Rectangle {
                                    id: markerMenuRectangle
                                    width: markerPopup.width
                                    height: markerPopup.height
                                    color: primaryColor
                                    radius: 20
                                    z:1
                                    Column{
                                        id: markerMenuColumn
                                        width: parent.width
                                        height: parent.height
                                        topPadding: 3
                                        leftPadding: 3
                                        rightPadding: 3
                                        Rectangle{
                                            width: parent.width - 6
                                            height: parent.height * 0.5
                                            radius: 12
                                            color: primaryColor
                                            Image {
                                                id: objectImage
                                                width: parent.width
                                                height: parent.height
                                                source: `qrc:/images/objects/${modelData.id + 1}/miniature.png`
                                            }
                                            Row{
                                                topPadding: 8
                                                leftPadding: 11
                                                anchors.fill: parent
                                                z:1
                                                Rectangle{
                                                    width: 63
                                                    height: 17
                                                    radius: 3
                                                    color: accentColor
                                                    Text{
                                                        anchors.centerIn: parent
                                                        text: `${modelData.location}`
                                                        font.family: font2.font.family
                                                        font.pixelSize: 8
                                                        color: primaryColor

                                                    }
                                                }
                                            }
                                        }
                                        Row{
                                            topPadding: 6
                                            width: parent.width - 6
                                            Text{
                                                width: parent.width - 6
                                                height: 38
                                                wrapMode: Text.WordWrap
                                                font.pixelSize: 15
                                                font.family: font2.name
                                                text: `${modelData.id + 1}. ${modelData.name}`
                                            }
                                        }
                                        Rectangle{
                                            width: parent.width - 6
                                            height: 26
                                            color: primaryColor
                                            Row{
                                                anchors.top: parent.top
                                                width: parent.width
                                                height: parent.height
                                                spacing: 8
                                                IconImage {
                                                    width: 20
                                                    height: 20
                                                    source: "qrc:/icons/AddressIcon.svg"
                                                }
                                                Text {
                                                    topPadding: 3
                                                    text: `${modelData.address}`
                                                    font.family: font2.name
                                                    font.pixelSize: 11
                                                }
                                            }
                                        }
                                        Row{
                                            width: parent.width - 6
                                            height: 78
                                            spacing: 6
                                            Rectangle{
                                                width: parent.width * 0.36
                                                height: parent.height
                                                color: 'transparent'
                                                radius: 6
                                                RoundButton{
                                                    id: moreButton2
                                                    width: parent.width
                                                    height: parent.height
                                                    radius: 6
                                                    //anchors.left: parent.left
                                                    contentItem: Text {
                                                        text: rootWindow.selectedLanguage === "pl" ? "Więcej" : "More"
                                                        font.pixelSize: 14
                                                        font.family: font2.name
                                                        color: primaryColor
                                                        horizontalAlignment: Text.AlignHCenter
                                                        verticalAlignment: Text.AlignVCenter
                                                        elide: Text.ElideRight
                                                    }

                                                    background: Rectangle {
                                                        anchors.fill: parent
                                                        implicitWidth: parent.width
                                                        implicitHeight: parent.height
                                                        color: accentColor
                                                        radius: 6
                                                        opacity: moreButton2.pressed ? 0.5 : 1.0
                                                    }
                                                    onClicked: {
                                                        markerPopup.visible = false
                                                        mainNavBar.visible = false
                                                        slideAnimation.enabled = true
                                                        stackView.push("qrc:/screens/LocationDetailsScreen.qml", {modelData})
                                                    }
                                                }
                                            }
                                            Column{
                                                width: parent.width * 0.62
                                                height: 78
                                                spacing: 4
                                                Rectangle{
                                                    width: parent.width
                                                    height: 37
                                                    color: 'transparent'
                                                    radius: 6
                                                    RoundButton{
                                                        id: addToRouteButton2
                                                        width: parent.width
                                                        height: 37
                                                        radius: 6
                                                        contentItem: Row{
                                                            width: parent.width
                                                            height: parent.height
                                                            spacing: 6
                                                            IconImage {
                                                                //anchors.margins: 4
                                                                anchors.verticalCenter: parent.verticalCenter
                                                                width: 20
                                                                height: 20
                                                                source: "qrc:/icons/AddToRouteIcon.svg"
                                                            }
                                                            Text {
                                                                anchors.verticalCenter: parent.verticalCenter
                                                                text: rootWindow.selectedLanguage === "pl" ? "Dodaj do twojej trasy" : "Add to your route"
                                                                font.pixelSize: 14
                                                                font.family: font2.name
                                                                color: primaryColor
                                                                horizontalAlignment: Text.AlignHCenter
                                                                verticalAlignment: Text.AlignVCenter
                                                                elide: Text.ElideRight
                                                            }
                                                        }
                                                        background: Rectangle {
                                                            anchors.fill: parent
                                                            implicitWidth: parent.width
                                                            implicitHeight: parent.height
                                                            color: accentColor
                                                            radius: 6
                                                            opacity: addToRouteButton2.pressed ? 0.5 : 1.0
                                                        }
                                                        onClicked: {
                                                            markerPopup.visible = false
                                                            rootWindow.userRoute.push(modelData)
                                                            routeList.model = rootWindow.userRoute
                                                        }
                                                    }
                                                }
                                                Rectangle{
                                                    width: parent.width
                                                    height: 37
                                                    radius: 6
                                                    RoundButton{
                                                        id: navigateButton
                                                        width: parent.width
                                                        height: 37
                                                        radius: 6
                                                        contentItem: Row{
                                                            width: parent.width
                                                            height: parent.height
                                                            spacing: 8
                                                            IconImage {
                                                                //anchors.margins: 4
                                                                anchors.verticalCenter: parent.verticalCenter
                                                                width: 20
                                                                height: 20
                                                                source: "qrc:/icons/NavigateIcon.svg"
                                                            }
                                                            Text {
                                                                anchors.verticalCenter: parent.verticalCenter
                                                                text: rootWindow.selectedLanguage === "pl" ? "Nawiguj do punktu" : "Navigate to point"
                                                                font.pixelSize: 14
                                                                font.family: font2.name
                                                                color: accentColor
                                                                horizontalAlignment: Text.AlignHCenter
                                                                verticalAlignment: Text.AlignVCenter
                                                                elide: Text.ElideRight
                                                            }
                                                        }
                                                        background: Rectangle {
                                                            anchors.fill: parent
                                                            implicitWidth: parent.width
                                                            implicitHeight: parent.height
                                                            color: navigateButton.pressed ? accentColor : primaryColor
                                                            radius: 6
                                                            opacity: navigateButton.pressed ? 0.5 : 1.0
                                                            border.color: accentColor
                                                            border.width: 2
                                                        }
                                                        onClicked: {
                                                            Qt.openUrlExternally(`https://www.google.com/maps/dir/?api=1&destination=${tempCoordinate[0]+"%2C"+tempCoordinate[1]}&travelmode=walking`)
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                background: Rectangle {
                                    id: markerMenuBackgroundRectangle
                                    width: markerPopup.width
                                    height: markerPopup.height
                                    color: primaryColor
                                    radius: 20
                                    border.color: borderColor
                                    border.width: 1
                                    z:1
                                }
                                onClosed: markerButton.forceActiveFocus()
                                focus: true
                            }
                            contentItem: Text {
                                width: parent.width
                                height: parent.height - 10
                                anchors.top: parent.top
                                anchors.topMargin: 10
                                anchors.horizontalCenter: parent.horizontalCenter
                                text: tempId
                                color: primaryColor
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                font.family: font2.font.family
                                font.pixelSize: markerPopup.visible ? 11 : 9
                            }
                            background: Rectangle {
                                anchors.fill: parent
                                id: markerRectangle
                                width: parent.width
                                height: parent.height
                                color: 'transparent'
                                Image {
                                    id:image
                                    width: parent.width
                                    height: parent.height
                                    anchors.fill: parent
                                    source: "qrc:/icons/MarkerIcon.svg"
                                }
                            }
                            Behavior on width {
                                NumberAnimation {
                                    duration: 300
                                    easing.type: Easing.InOutQuad
                                }
                            }
                            Behavior on height {
                                NumberAnimation {
                                    duration: 300
                                    easing.type: Easing.InOutQuad
                                }
                            }
                            onClicked: {
                                map.zoomLevel = map.maximumZoomLevel
                                map.alignCoordinateToPoint(QtPositioning.coordinate(tempCoordinate[0], tempCoordinate[1]), Qt.point(parseInt(map.width / 2), parseInt(map.height * 0.7)))
                                markerPopup.visible = true
                            }
                        }
                    }
                }
            }

            property geoCoordinate startCentroid
            property geoCoordinate maxTopLeft: QtPositioning.coordinate(50.0429, 20.8852)
            property geoCoordinate maxBottomRight: QtPositioning.coordinate(49.9583, 21.0274)
            property var region: QtPositioning.rectangle(maxTopLeft, maxBottomRight)

            PinchHandler {
                id: pinch
                target: null
                onActiveChanged: if (active) {
                                     map.startCentroid = map.toCoordinate(pinch.centroid.position, false)
                                 }
                onScaleChanged: (delta) => {
                                    if (map.zoomLevel + Math.log2(delta) < map.maximumZoomLevel){
                                        map.zoomLevel += Math.log2(delta)
                                    } else {
                                        map.zoomLevel = map.maximumZoomLevel
                                    }
                                    if (map.zoomLevel + Math.log2(delta) > map.minimumZoomLevel){
                                        map.zoomLevel += Math.log2(delta)
                                    } else {
                                        map.zoomLevel = map.minimumZoomLevel
                                    }
                                    map.alignCoordinateToPoint(map.startCentroid, pinch.centroid.position)
                                }
                onTranslationChanged: (delta) => {
                                          var topLeft = map.toCoordinate(Qt.point(0, 0), false)
                                          var bottomRight = map.toCoordinate(Qt.point(parseInt(map.width), parseInt(map.height)), false)
                                          var isTopLeftEdgeInRegion = map.region.contains(topLeft);
                                          var isBottomRightEdgeInRegion = map.region.contains(bottomRight);

                                          if (!isTopLeftEdgeInRegion){
                                              if(topLeft.longitude < map.maxTopLeft.longitude){
                                                  map.center.longitude += map.maxTopLeft.longitude - topLeft.longitude
                                              }
                                              if (topLeft.latitude > map.maxTopLeft.latitude){
                                                  map.center.latitude += map.maxTopLeft.latitude - topLeft.latitude
                                              }
                                          }
                                          if (!isBottomRightEdgeInRegion){
                                              if(bottomRight.longitude > map.maxBottomRight.longitude){
                                                  map.center.longitude += map.maxBottomRight.longitude - bottomRight.longitude
                                              }
                                              if (bottomRight.latitude < map.maxBottomRight.latitude){
                                                  map.center.latitude += map.maxBottomRight.latitude - bottomRight.latitude
                                              }
                                          }
                                      }
                grabPermissions: PointerHandler.TakeOverForbidden
            }
            DragHandler {
                id: drag
                target: null

                onTranslationChanged: (delta) => {
                                          var topLeft = map.toCoordinate(Qt.point(0, 0), false)
                                          var bottomRight = map.toCoordinate(Qt.point(parseInt(map.width), parseInt(map.height)), false)
                                          var isTopLeftEdgeInRegion = map.region.contains(topLeft);
                                          var isBottomRightEdgeInRegion = map.region.contains(bottomRight);

                                          if (!isTopLeftEdgeInRegion){
                                              if(topLeft.longitude < map.maxTopLeft.longitude){
                                                  map.center.longitude += map.maxTopLeft.longitude - topLeft.longitude
                                              }
                                              if (topLeft.latitude > map.maxTopLeft.latitude){
                                                  map.center.latitude += map.maxTopLeft.latitude - topLeft.latitude
                                              }
                                          }
                                          if (!isBottomRightEdgeInRegion){
                                              if(bottomRight.longitude > map.maxBottomRight.longitude){
                                                  map.center.longitude += map.maxBottomRight.longitude - bottomRight.longitude
                                              }
                                              if (bottomRight.latitude < map.maxBottomRight.latitude){
                                                  map.center.latitude += map.maxBottomRight.latitude - bottomRight.latitude
                                              }
                                          }
                                          map.pan(-delta.x, -delta.y);
                                      }
            }
            onCenterChanged: {
                rootWindow.lastMapCenter = center
            }
            onZoomLevelChanged: {
                rootWindow.lastMapZoom = map.zoomLevel
            }
            Component.onCompleted: {
                if(mapWindowItem.modelData){
                    var tempCoordinate =  mapWindowItem.modelData.coordinate.trim().split(",")
                    map.alignCoordinateToPoint(QtPositioning.coordinate(tempCoordinate[0], tempCoordinate[1]), Qt.point(parseInt(map.width / 2), parseInt(map.height * 0.7)))
                }
            }
        }
    }
}

