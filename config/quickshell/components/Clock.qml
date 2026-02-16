import QtQuick
import Quickshell.Io
import Quickshell

Rectangle {
  id: clockContainer
  property int padding: 5;
  anchors.centerIn: parent
  height: parent.height - 7
  width: (dat.implicitWidth > clock.implicitWidth ? dat.implicitWidth : clock.implicitWidth) + padding * 5;
  color: "#cc610beb";
  radius: parent.radius;

  Process {
    id: dateProc
    command: ["date", "+%a %b %d\n%H:%M:%S %Y"]
    running: true
    stdout: StdioCollector {
      onStreamFinished: {
        var parts = this.text.split("\n");
        dat.text = "\uf073 " + parts[0];
        clock.text = "\uf017  " + parts[1];
      }
    }
  }

  Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: dateProc.running = true
      }

  Text {
    id: dat
    anchors.top: parent.top
    anchors.topMargin: 1
    anchors.bottomMargin: 0
    anchors.horizontalCenter: parent.horizontalCenter
    color: "#aacc00cc";
    font.family: "MesloLGSDZ Nerd Font Propo"
    font.styleName: "Bold";
    font.pointSize: parent.height / 3.61;
  }

  Text {
    id: clock
    anchors.top: dat.bottom
    color: "#eeaaaadd";
    anchors.horizontalCenter: parent.horizontalCenter
    font.family: "MesloLGS Nerd Font"
    font.styleName: "Bold Italic"
    font.pointSize: parent.height / 4;
  }
}
