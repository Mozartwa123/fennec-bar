import QtQuick
import Quickshell
import "./anims"

// HyprexinPopupLook
Rectangle {
    id: hyprexinPopupRec
    property PopupWindow pop
    property int targetWidth
    property int targetHeight
    gradient: main.gradient
    radius: rightAssets.defaultRadius
    Component.onCompleted: {
        console.log("Data: ", this.targetWidth, this.targetHeight)
    }

    property ParallelAnimation animShow: ShowAnim {
        target: hyprexinPopupRec
        targetHeight: hyprexinPopupRec.targetHeight
        targetWidth: hyprexinPopupRec.targetWidth
        disappear: false
    }

    property ParallelAnimation animHide: ShowAnim {
        target: hyprexinPopupRec
        targetHeight: hyprexinPopupRec.targetHeight
        targetWidth: hyprexinPopupRec.targetWidth
        disappear: true
        onFinished: {
            pop.visible = false
            console.log(pop.visible)
        }
    }
}
