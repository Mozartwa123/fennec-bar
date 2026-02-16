import Quickshell
import Quickshell.Io // for Process
import QtQuick
import QtQuick.Layouts
import "batteryUtils.js" as BatteryUtils

Rectangle {

    width: batText.implicitWidth + 10
    height: rightAssets.height
    id: batteryContainer
    property var coordinates: this.mapToGlobal(x, y)

    radius: rightAssets.defaultRadius;
    color: "#cc610beb";
    Process {
        id: batProc
        command: ["bash", "-c",
          "LC_ALL=C upower -i $(upower -e | grep BAT) | grep -E 'state|percentage' | awk '{print $2}' | sed '/^$/d' | sort | tr -d '% '"
        ]
        running: true
        stdout: StdioCollector {
          onStreamFinished: {
            let [percentage, state] = this.text.trim().split('\n');
            console.log(percentage);
            percentage = Number(percentage)
            state = state.trim()
            var batVec = BatteryUtils.batteryState(percentage, state);
            batteryContainer.color = batVec.batteryBgColor
            batText.color = batVec.batteryFontColor
            batText.text = batVec.batteryIcon + ` ${percentage}%`
          }
        }
    }

    Text {
        id: batText
        anchors.centerIn: parent
        font.family: rightAssets.defaultFont
    }

    Timer {
          interval: 1000
          running: true
          repeat: true
          onTriggered: batProc.running = true
        }
}
