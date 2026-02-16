import QtQuick
import QtQuick.Controls
import Quickshell.Io
import Quickshell
import "./guiElements"
import "./guiElements/anims"

Rectangle {
    id: powerButton
    property string defaultColour: rightAssets.defaultColor
    color: this.defaultColour
    radius: rightAssets.defaultRadius;
    height: rightAssets.height
    width: rightAssets.height
    Text {
        id: powerText
        font.family: rightAssets.defaultFont
        font.styleName: "Regular"
        font.bold : false
        color: "#ff00cc"
        anchors.centerIn: parent
        text : '\uf011'
    }

    ScaleAnim {
        target: powerText
        id: powerHover
        zoom: true
    }

    ScaleAnim {
        target: powerText
        id: powerUnHover
        zoom: false
    }

    MouseArea {
        anchors.fill: parent
        property bool toggleClicked: false
        hoverEnabled: true
        onClicked: {
            this.toggleClicked = !this.toggleClicked
            if(toggleClicked){
                closeMenu.animShow.start()
                closePopup.visible = this.toggleClicked
            } else {
                closeMenu.animHide.start()
            }

            console.log( closeMenu.animShow.start)
            console.log("clicked")
            let p = this.mapToGlobal(x, y)
            closePopup.anchor.rect.x = p.x
            closePopup.anchor.rect.y = p.y + powerButton.height + 7

            // Quickshell.execDetached(["bash", "-c", "$HOME/.config/rofi/exit_menu.sh"])
        }
        onEntered: {
            let c = parent.color
            parent.color = Qt.rgba(c.r, c.g, c.b, c.a / 4)
            powerButton.color = Qt.lighter(powerButton.color, 1.25)
            powerText.font.bold = true
            powerHover.start()

        }

        onExited: {
            let c = parent.color
            powerButton.color = powerButton.defaultColour
            powerText.font.bold = false
            powerUnHover.start()
        }
    }

    HyprexinPopup {
        id: closePopup
        implicitWidth: 150
        implicitHeight: 250
        HyprexinPopupLook {
            id: closeMenu
            targetHeight: closePopup.implicitHeight - 20
            targetWidth: closePopup.implicitWidth - 20
            pop: closePopup
            Column {
                id: powerCol
                anchors.fill: parent
                anchors.margins: 10
                spacing: 5
                PowerOption {
                    command: ["bash", "-c", "poweroff"]
                    text: "\uf011 Wyłącz"
                }
                PowerOption {
                    command: ["bash", "-c", "systemctl suspend"]
                    text: "\udb82\udd04 Uśpij"
                }
                PowerOption {
                    // "bash", "-c", "hyprctl dispatch exit"
                    command: ["bash", "-c", "hyprctl dispatch exit"]
                    text: "\udb80\udf43 Wyloguj"
                }
                PowerOption {
                    command: ["bash", "-c", "reboot"]
                    text: "\udb81\udf09 Restart"
                }
            }
        }
    }
}
