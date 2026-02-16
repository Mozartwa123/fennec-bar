import QtQuick

NumberAnimation {
    property bool zoom
    property: "scale"
    to: zoom ? 1.5 : 1.0
    duration: 200
    easing.type: Easing.InOutQuad
}
