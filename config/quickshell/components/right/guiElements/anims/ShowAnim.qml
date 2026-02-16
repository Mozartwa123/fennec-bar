import QtQuick
// showAnim.qml
ParallelAnimation {
    property Rectangle target
    property int targetHeight
    property int targetWidth
    property bool disappear
    // property var easingType: this.disappear ? Easing.InBack : Easing.OutBack

    Component.onCompleted: {
        hA.target = target
        hA.from = this.disappear ? this.targetHeight : 0
        hA.to = this.disappear ? 0 : this.targetHeight
        hA.easing.type = this.disappear ?  Easing.InBack : Easing.OutBack
        wA.target = target
        wA.from = this.disappear ? this.targetWidth : 0
        wA.to = this.disappear ? 0 : this.targetWidth
        wA.easing.type = this.disappear ?  Easing.InBack : Easing.OutBack
    }

    PropertyAnimation {
        id: hA
        property: "height"
        duration: 400
    }
    PropertyAnimation {
        id: wA
        property: "width"
        duration: 400
    }
}
