import QtQuick
import "./left"

Row {
    id: leftAssets
    spacing: 5
    width: parent.width / 3
    height: parent.height - 7
    property int defaultRadius: 12
    property string defaultFont: "MesloLGSDZ Nerd Font Propo"
    property int rightMargin: 4
    property int assetsTypicalWidth: 40
    property color defaultColor: "#cc610beb"
    property color defaultFontColor: "#ff44aa"
    anchors {
        top: parent.top
        left: parent.left
        leftMargin: 3
        topMargin: 3
        bottomMargin: 3
    }
    MenuButton {
        width: this.height
    }
    Workspaces {

    }
}
