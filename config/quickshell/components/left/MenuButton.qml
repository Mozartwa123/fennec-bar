import QtQuick
import Quickshell.Io
import "../right/guiElements/anims"

import "."

PanelElement {
    id: menuButton
    width: this.height
    Image {
        anchors.centerIn: parent
        height: menuButton.height
        width: menuButton.width
        id: logo
        source: "./logo2.svg"
        // scale: 1


    }

    ScaleAnim {
        id: logoAnimHovered
        target: logo
        zoom: true
        // to: 1.5
    }

    ScaleAnim {
        id: logoAnimUnHovered
        target: logo
        zoom: false
        // to: 1.0
    }
    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onEntered: {
            logoAnimHovered.start()
        }
        onExited: {
            logoAnimUnHovered.start()
        }
        onClicked: {
            menuProc.running = true
        }
        Process {
            id: menuProc
            command: ["bash", "-c", "rofi -show drun"]
        }
    }
}
