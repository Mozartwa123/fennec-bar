import QtQuick

Rectangle {
    height: soundSlideHeight.height + 7
    width: height
    radius: width / 2
    color: Qt.lighter(Qt.rgba(soundSlideHeight.color.r,
                              soundSlideHeight.color.g,
                              soundSlideHeight.color.b, 0.9), 1.3)
}
