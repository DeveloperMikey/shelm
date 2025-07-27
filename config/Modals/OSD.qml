pragma ComponentBehavior: Bound
import QtQuick
import Quickshell
import qs.Services
import qs.Settings
import qs.Widgets

Scope {
    id: root
    required property bool hovered
    property bool started: false
    property bool shouldShowOSD: false

    function updateOSD() {
        if (!root.started)
            return;
        root.shouldShowOSD = true;
        timer.restart();
    }

    Connections {
        target: AudioService

        function onSinkVolumeChanged(): void {
            root.updateOSD();
        }

        function onSinkMutedChanged(): void {
            root.updateOSD();
        }
    }

    Component.onCompleted: startupTimer.start()

    Variants {
        model: Quickshell.screens
        PanelWindow {
            id: osd
            required property var modelData
            screen: modelData
            color: "transparent"
            anchors.right: true
            exclusionMode: ExclusionMode.Normal
            aboveWindows: true
            implicitHeight: 175
            implicitWidth: 30
            margins.right: root.shouldShowOSD ? 15 : -implicitWidth

            Behavior on margins.right {
                NumberAnimation {
                    duration: 100
                    easing.type: Easing.Linear
                }
            }

            VerticalSlider {
                value: AudioService.sinkMuted ? 0 : AudioService.sinkVolume
                maxValue: 1
            }

            MouseArea {
                property bool holding: false
                anchors.fill: parent
                hoverEnabled: true
                onEntered: timer.stop()
                onExited: timer.restart()
                onPressed: holding = true
                onReleased: holding = false
                onMouseYChanged: mouse => {
                    if (!holding)
                        return;
                    AudioService.sink.audio.volume = (osd.height - mouse.y) / osd.height;
                }
            }
        }
    }

    Timer {
        id: timer

        interval: 4000
        onTriggered: root.shouldShowOSD = false
    }

    Timer {
        id: startupTimer

        interval: 50
        onTriggered: root.started = true
    }
}
