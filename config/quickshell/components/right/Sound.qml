import QtQuick
import Quickshell.Io
import Quickshell
import QtQuick.Controls
import "soundUtils.js" as SoundUtils
import "./guiElements"
import "./guiElements/anims"

Rectangle {
    id: sound
    property bool muted
    property int soundValue
    radius: rightAssets.defaultRadius
    width: soundText.implicitWidth + 10
    height: rightAssets.height
    color: rightAssets.defaultColor
    Component.onCompleted: {
        let p = sound.mapToGlobal(x, y)
        popSound.anchor.rect.x = p.x
        popSound.anchor.rect.y = p.y
        console.log("Sound coordinates:", p.x, p.y)
        console.log("Sound coordinates:", p.x, p.y)
    }
    property var coordinates: this.mapToGlobal(x, y)
    Process {
        id: soundProc
        command:  ["bash",  "-c", "$HOME/.config/quickshell/scripts/getVolume.sh"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: {
                // console.log(soundProc.workingDirectory)
                let soundFormat = SoundUtils.parseSound(this.text)
                // console.log(soundFormat.soundText)
                soundText.text = soundFormat.soundText
                sound.muted = soundFormat.muted
                sound.soundValue = soundFormat.level
                // console.log(sound.muted)
            }
        }
    }

    Text {
      id: soundText
      anchors.centerIn: parent
      color: rightAssets.defaultFontColor;
      font.family: rightAssets.defaultFont
    }

    ScaleAnim {
        target: soundText
        id: soundHover
        to: 1.2
    }

    ScaleAnim {
        target: soundText
        id: soundUnHover
        to: 1.0
    }

    Timer {
          interval: 100
          running: true
          repeat: true
          onTriggered: soundProc.running = true
        }

    MouseArea {
        property bool toggleClicked: false
        anchors.fill: parent
        hoverEnabled: true
        onEntered: {
            soundText.font.bold = true
            soundHover.start()
        }

        onClicked: {
            let p = sound.mapToGlobal(x, y)
            soundText.font.bold = true
            // console.log("Mouse: ", p.x, p.y) // prawdłowe współrzędne
            popSound.anchor.rect.x = p.x + sound.width / 2 - popRec.defaultWidth / 2
            popSound.anchor.rect.y = p.y + sound.height + 7
            this.toggleClicked = this.toggleClicked === true ? false : true
            //popRec.height = this.toggleClicked === true ? 1 : 0
            if(this.toggleClicked){
                popSound.visible = this.toggleClicked
                popRec.height = 0
                handleMute.toggleSwitch = sound.muted
                slider.value = sound.soundValue
                popRec.animShow.start()
            } else {
                popRec.animHide.start()
            }

            console.log(popRec.height, this.toggleClicked)
        }

        onExited: {
            soundText.font.bold = false
            soundUnHover.start()
        }
    }

    PopupWindow {
        id: popSound
        anchor.window: panelWindow
        width: 230
        implicitHeight: 170
        visible: false
        color: "transparent"

        Rectangle {
            id: popRec
            width: parent.width
            gradient: main.gradient
            radius: rightAssets.defaultRadius

            height: parent.implicitHeight
            // implicitHeight: parent.implicitHeight
            // property int defaultHeight: parent.implicitHeight - 20
            property int defaultWidth: parent.width - 20
            property var animShow:
                ParallelAnimation {
                    PropertyAnimation {
                        target: popRec
                        property: "height"
                        duration: 400
                        easing.type: Easing.OutBack
                        from: 0
                        to: popSound.implicitHeight - 20
                    }
                    PropertyAnimation {
                        target: popRec
                        property: "width"
                        duration: 400
                        easing.type: Easing.OutBack
                        from: 0
                        to: popRec.defaultWidth
                    }
            }

            property var animHide: ParallelAnimation {
                running: false
                PropertyAnimation {
                    target: popRec
                    property: "height"
                    duration: 400
                    easing.type: Easing.InBack
                    from: popSound.implicitHeight - 20
                    to: 0
                }
                PropertyAnimation {
                    target: popRec
                    property: "width"
                    duration: 400
                    easing.type: Easing.InBack
                    from:  popRec.defaultWidth
                    to: 0
                }
                onFinished: {
                    popSound.visible = false
                }
            }

            Process {
                id: setVolumeProc
            }

            Column {
                id: volumeColumn
                spacing: 40
                anchors.fill: parent
                anchors.margins: 20
                anchors.horizontalCenter: parent.horizontalCenter

                Column {
                    spacing: 5
                    id: volumeChangeColumn
                    anchors.horizontalCenter: parent.horizontalCenter
                    Text {
                        font.family: rightAssets.defaultFont
                        text: "volume (głośność)"
                        color: "#ff22aa"
                        font.bold: true
                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    Slider {
                        id: slider
                        from: 0
                        value: 25
                        to: 100
                        anchors.horizontalCenter: volumeColumn.horizontalCenter
                        width: popRec.width - volumeColumn.anchors.margins * 2
                        background: Rectangle  {
                            id: soundSlideHeight
                            implicitHeight: 6
                            radius: rightAssets.defaultRadius
                            height: 15
                            // property color precolor: Qt.lighter(rightAssets.defaultColor, 2.0)
                            color: Qt.lighter(Qt.rgba(rightAssets.defaultColor.r,
                                           rightAssets.defaultColor.g,
                                           rightAssets.defaultColor.b,
                                           0.4
                                           ), 1.2)
                        }
                        handle: Handle {
                                   x: slider.leftPadding
                                      + slider.visualPosition * (slider.availableWidth - width)
                                   y: soundSlideHeight.y + soundSlideHeight.height / 2 - height / 2
                        }


                        onValueChanged: {
                            console.log(Math.round(slider.value))
                            setVolumeProc.command = ["bash", "-c", `pactl set-sink-volume @DEFAULT_SINK@ ${Math.round(slider.value)}%`]
                            setVolumeProc.running = true
                        }

                    }
                }

                Column {
                    id: muteColumn
                     anchors.horizontalCenter: parent.horizontalCenter
                     spacing: 8
                     Text {
                         font.family: rightAssets.defaultFont
                         text: "mute (wyciszenie)"
                         color: "#ff22aa"
                         font.bold: true
                         anchors.horizontalCenter: parent.horizontalCenter
                     }

                    Rectangle {
                        id: mute
                        anchors.topMargin: 15
                        width: rightAssets.assetsTypicalWidth
                        height: soundSlideHeight.height
                        color:  soundSlideHeight.color
                        anchors.horizontalCenter: parent.horizontalCenter
                        radius: rightAssets.defaultRadius
                        Handle {
                            id: handleMute
                            anchors.verticalCenter: parent.verticalCenter
                            property bool toggleSwitch: sound.muted
                            property int targetX: handleMute.parent.width - handleMute.width
                            x: this.toggleSwitch ? targetX : 0

                            property var showAnim: ParallelAnimation {
                                PropertyAnimation {
                                    target: handleMute
                                    property: "x"
                                    from: 0
                                    to: handleMute.parent.width - handleMute.width
                                    duration: 400
                                    easing.type: Easing.InOutQuad
                                }
                            }

                            property var hideAnim: ParallelAnimation {
                                PropertyAnimation {
                                    target: handleMute
                                    property: "x"
                                    from: handleMute.parent.width - handleMute.width
                                    to: 0
                                    duration: 400
                                    easing.type: Easing.InOutQuad
                                }
                            }


                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    handleMute.toggleSwitch = !handleMute.toggleSwitch
                                    if(handleMute.toggleSwitch ){
                                        handleMute.showAnim.start()
                                    } else {
                                        handleMute.hideAnim.start()
                                    }
                                    toggleMute.running = true
                                }
                            }

                            Process {
                                id: toggleMute
                                command: ["bash", "-c", "pactl set-sink-mute @DEFAULT_SINK@ toggle"]
                            }
                        }
                    }
                }

            }
        }
    }


}
