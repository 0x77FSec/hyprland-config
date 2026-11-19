
import QtQuick
import Quickshell
import Quickshell.Services.Pipewire

PanelWindow {
    id: root

    anchors {
        left: true
        top: true
        bottom: true
    }

    implicitWidth: 50
    implicitHeight: 250

    exclusionMode: ExclusionMode.Ignore
    mask: Region {}
    color: "transparent"

    property var sink: Pipewire.defaultAudioSink

    readonly property bool ready: sink !== null && sink.ready
    readonly property bool muted: ready && sink.audio.muted
    readonly property real volume: ready ? sink.audio.volume : 0

    readonly property real hiddenScale: 0.8

    property real preVolume: -1
    property bool bounceUp: false

   PwObjectTracker {
    objects: [root.sink]
}

    onVolumeChanged: {
        if (preVolume === -1) {
            preVolume = volume
            return
        }

        if (preVolume === volume)
            return

        volumeBar.state = "visible"

        bounceUp = preVolume < volume
        preVolume = volume

        bounce.restart()
        hiddenBar.restart()
    }

    Timer {
        id: hiddenBar

        interval: 1000
        running: false
        repeat: false

        onTriggered: {
            volumeBar.state = "hidden"
        }
    }

    Rectangle {
        id: volumeBar

        anchors {
            left: parent.left
            verticalCenter: parent.verticalCenter
        }

        implicitHeight: 200
        implicitWidth: 8

        color: "#55FFFFFF"
        radius: width / 2

        state: "hidden"

        states: [
            State {
                name: "hidden"

                PropertyChanges {
                    target: volumeBar
                    scale: root.hiddenScale
                    anchors.leftMargin: -10
                }
            },

            State {
                name: "visible"

                PropertyChanges {
                    target: volumeBar
                    scale: 1
                    anchors.leftMargin: 20
                }
            }
        ]

        transitions: [
            Transition {
                NumberAnimation {
                    properties: "scale,leftMargin"
                    duration: 200
                    easing.type: Easing.OutCubic
                }
            }
        ]

        Rectangle {
            anchors {
                bottom: parent.bottom
                left: parent.left
                right: parent.right
            }

            height: root.volume * parent.height

            radius: width / 2

            color: root.muted ? "#FFFF5555" : "#BBFFFFFF"

            Behavior on height {
                NumberAnimation {
                    duration: 200
                    easing.type: Easing.OutBack
                }
            }
        }

        SequentialAnimation {
            id: bounce

            running: false

            NumberAnimation {
                target: volumeBar
                property: "anchors.verticalCenterOffset"

                to: root.bounceUp ? -5 : 5

                duration: 100
                easing.type: Easing.OutCubic
            }

            NumberAnimation {
                target: volumeBar
                property: "anchors.verticalCenterOffset"

                to: 0

                duration: 150
                easing.type: Easing.OutBounce
            }
        }
    }
}
