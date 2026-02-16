import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets
import "right"

RowLayout {
    id: rightAssets
    property double defaultRadius: 12
    property string defaultFont: "MesloLGSDZ Nerd Font Propo"
    property int rightMargin: 4
    property int assetsTypicalWidth: 40
    property color defaultColor: "#cc610beb"
    property color defaultFontColor: "#ff44aa"
    width: parent.width / 3
    height: parent.height - 7
    anchors {
        top: parent.top
        right: parent.right
        rightMargin: 3
        topMargin: 3
        bottomMargin: 3
    }

    spacing: 5

    Item { Layout.fillWidth: true }
    Row {
        width: parent.width
        height: parent.height
        spacing: 5
        Tray {}
        Sound {}
        Battery { }
        Power { }
    }
}
