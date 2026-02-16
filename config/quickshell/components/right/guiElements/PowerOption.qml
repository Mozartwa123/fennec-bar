import QtQuick
import Quickshell.Io

Rectangle {
    id: powOptRec
    property var command
    property var text
    property color baseColor: Qt.darker(Qt.rgba(
                                            rightAssets.defaultColor.r,
                                            rightAssets.defaultColor.g,
                                            rightAssets.defaultColor.b,
                                            0.2), 2.0)
    width: powerCol.width - 10
    radius: rightAssets.defaultRadius
    anchors.horizontalCenter: parent.horizontalCenter
    height: 30
    color: baseColor
    Text {
        id: powOptTxt
        font.bold: false
        color: rightAssets.defaultFontColor
        text: powOptRec.text
        font.family: rightAssets.defaultFont
        anchors.centerIn: parent
        visible: parent.visible
    }


    ColorAnimation on color {
        id: onPreA
        to: Qt.lighter(baseColor, 2.5)
        duration: 200
    }


    ColorAnimation on color {
        id: onExA
        to: baseColor
        duration: 200
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onEntered: {
            powOptTxt.font.bold = !powOptTxt.font.bold
            onPreA.start()
        }
        onClicked: {
            powerProc.running = true
        }

        onExited: {
            powOptTxt.font.bold = !powOptTxt.font.bold
            onExA.start()
        }
    }
    Process {
        id: powerProc
        command: powOptRec.command
    }
}
