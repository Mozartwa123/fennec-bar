import "."
import QtQuick
import Quickshell.Hyprland
import "../right/guiElements/anims"

PanelElement {
    implicitWidth: workSpacesListing.implicitWidth + 5
    Component.onCompleted: {
        console.log("current workspace ", Hyprland.focusedWorkspace?.name);
        console.log("current monitor ", Hyprland.focusedMonitor?.name);
        for(let workspace of Hyprland.workspaces.values){
            console.log(workspace.name);
        }
    }
    ListView  {
        id: workSpacesListing
        model: Hyprland.workspaces
        // clip: true
        anchors.horizontalCenter: parent.horizontalCenter
        height: leftAssets.height
        orientation: ListView.Horizontal
        implicitWidth: contentWidth
        spacing: 5
        delegate: Item {
            id : workSpaceItem
            property bool isActive : modelData.name === Hyprland.focusedWorkspace?.name
            anchors.verticalCenter: parent.verticalCenter
            height: 24
            width: this.height
            scale: isActive ? 0.85 : 1.0

            Rectangle {
                id: workSpaceRec
                // border.width: modelData.name === Hyprland.focusedWorkspace?.name? 1 : 0
                // border.color: Qt.darker(leftAssets.defaultColor, 2.0)
                anchors.fill: parent
                radius: 12
                property color defaultColor : workSpaceItem.isActive ?
                Qt.darker(leftAssets.defaultColor, 1.4) :
                Qt.lighter(leftAssets.defaultColor, 1.2)
                color:  workSpaceItem.isActive ?
                           Qt.darker(leftAssets.defaultColor, 1.4) :
                           Qt.lighter(leftAssets.defaultColor, 1.2)
                Component.onCompleted: {
                    console.log("workspace ", modelData.name);
                }
                Text {
                    color: "#ffe6ff66"
                    font.family: leftAssets.defaultFont
                    anchors.centerIn: parent
                    text: modelData.name
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: {
                        if(workSpaceItem.isActive){
                            return;
                        }
                        Hyprland.dispatch(`workspace ${modelData.name}`)
                    }

                    onEntered: {
                        if(workSpaceItem.isActive){
                            return;
                        }
                        hoverWorkSpace.start()
                    }
                    onExited: {
                        if(workSpaceItem.isActive){
                            return;
                        }
                        unHoverWorkSpace.start()
                    }
                }

                ParallelAnimation {
                    id: hoverWorkSpace
                    ScaleAnim {
                        to: 1.3
                        target: workSpaceItem
                        zoom: true
                    }

                    ColorAnimation {
                        target: workSpaceRec
                        property: "color"
                        to: Qt.lighter(workSpaceRec.color)
                        duration: 200
                    }
                }

                ParallelAnimation {
                    id: unHoverWorkSpace
                    ScaleAnim {
                        target: workSpaceItem
                        zoom: false
                    }

                    ColorAnimation {
                        target: workSpaceRec
                        property: "color"
                        to: workSpaceRec.defaultColor
                        duration: 200
                    }
                }
            }
        }
    }
}
