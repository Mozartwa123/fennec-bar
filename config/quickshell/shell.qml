//@ pragma UseQApplication

import Quickshell
import Quickshell.Io
import QtQuick
import Quickshell.Services.SystemTray
import "components"

Variants {
  model: Quickshell.screens;
  delegate: Component{
    PanelWindow {
        id: panelWindow
        color: "transparent";
        anchors {
            top: true
            left: true
            right: true
            bottom: false
          }
      implicitHeight: 42
      Rectangle {

        id: main
        radius: 10;
        anchors {
          top: parent.top;
          bottom: parent.bottom;
          right: parent.right;
          left: parent.left;
          topMargin: 5;
          leftMargin: 10;
          rightMargin: 10;
          bottomMargin: 0;
        }
      LeftAssets {}
      Clock {}
      RightAssets {}
        // color: "#44610beb";
        gradient: Gradient {
                orientation: Gradient.Horizontal
                GradientStop { position: 0.0; color: "#333e00f3" }
                GradientStop { position: 1.0; color: "#22c364fa" }
            }
      }
    }
  }
}
