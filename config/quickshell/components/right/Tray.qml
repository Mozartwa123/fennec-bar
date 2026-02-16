import QtQuick
import Quickshell.Services.SystemTray
import Quickshell
import QtQuick.Effects
import "./guiElements/anims"
import "./guiElements"

Rectangle {

    id: trayBar
    visible: SystemTray.items.values.length
    implicitHeight: rightAssets.height
    radius: rightAssets.defaultRadius
    color: rightAssets.defaultColor
    width: trayList.contentWidth + 10

    // visible: tray.children.length > 1
    ListView {

        HyprexinPopup {
            id: trayPopup
            width: 10
            height: 10
        }

        anchors.horizontalCenter: parent.horizontalCenter
        height: trayBar.height
        id: trayList
        model: SystemTray.items
        orientation: ListView.Horizontal
        implicitWidth: contentWidth
        spacing: 5
        clip: true

        delegate: Item {
            height: rightAssets.height - 5
            width: this.height
            anchors.verticalCenter: parent.verticalCenter

            Rectangle {
                id: trayItem
                property string defaultColour: Qt.lighter(
                                                   rightAssets.defaultColor,
                                                   1.2)

                //anchors.rightMargin:
                radius: rightAssets.defaultRadius
                // anchors.verticalCenter: parent.verticalCenter
                // anchors.horizontalCenter: parent.horizontalCenter
                // anchors.verticalCenter: parent.verticalCenter
                color: Qt.lighter(rightAssets.defaultColor, 1.2)
                anchors.fill: parent

                Image {
                    id: trayIcon
                    source: modelData.icon
                    anchors.fill: parent
                    smooth: true
                }


                ScaleAnim {
                    target: trayIcon
                    zoom: true
                    id: trayIconHovered
                }

                ScaleAnim {
                    target: trayIcon
                    zoom: false
                    id: trayIconUnHovered
                }


                MouseArea {
                    acceptedButtons: Qt.LeftButton | Qt.RightButton | Qt.MiddleButton
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: event => {
                                   event.accepted = true
                                   console.log(event.button === Qt.RightButton)
                                   console.log(event.button === Qt.MiddleButton)

                                   switch (event.button) {
                                       case Qt.RightButton:
                                       if (modelData.hasMenu) {
                                           //var pos = trayItem.mapToItem(panelWindow, trayItem.width / 2, trayItem.height)
                                           let pos = trayItem.mapToGlobal(x, y)
                                           trayPopup.visible = true
                                           trayPopup.anchor.rect.x = pos.x
                                           trayPopup.anchor.rect.y = pos.y
                                           console.log("Tray: ", pos.x, pos.y)
                                           modelData.display(
                                               trayPopup, Math.round(
                                                   pos.x + trayItem.width),
                                               Math.round(
                                                   pos.y + trayItem.height))
                                       }
                                       break;
                                       case Qt.MiddleButton:
                                            modelData.secondaryActivate();
                                            break;
                                       case Qt.LeftButton:
                                            modelData.activate();
                                            break;
                                       default:
                                           break;

                                   }
                               }
                    onEntered: {
                        let c = parent.color
                        trayItem.color = Qt.rgba(c.r, c.g, c.b, c.a / 4)
                        trayIconHovered.start()
                        //powerText.font.bold = true
                    }

                    onExited: {
                        trayItem.color = trayItem.defaultColour
                        trayIconUnHovered.start()
                    }
                }
            }
        }
    }
}
