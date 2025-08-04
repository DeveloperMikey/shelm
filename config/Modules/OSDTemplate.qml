pragma ComponentBehavior: Bound
import QtQuick
import Quickshell
import Quickshell.Hyprland
import qs.Services
import qs.Settings
import qs.Widgets
import qs.Modules

Scope {
    id: root
    required property var screen
    required property color fillColor
    required property color overflowColor
    required property real value
    required property real maxValue
    required property real maxOverflow
    property bool muted: false
    property bool started: false
    property bool shouldShowOSD: false

    function updateOSD() {
        if (!root.started)
            return;
        root.shouldShowOSD = true;
        timer.restart();
    }

    Component.onCompleted: startupTimer.start()

    PanelWindow {
        id: osd
        screen: root.screen
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
            id: slider
            value: root.value
            maxValue: root.maxValue
            fillColor: root.fillColor
            overflowColor: root.overflowColor
        }

        MouseArea {
            id: mouseArea
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
                root.value = Math.max(Math.min((osd.height - mouse.y) / osd.height, root.maxOverflow), 0);
            }
        }
        StyledText {
            text: Math.round(root.value * 10) / 10
            font.pixelSize: Theme.font.size.large
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            color: root.muted ? "#000" : "#ebdbb2"
        }
    }

    Timer {
        id: timer

        interval: 4000
        onTriggered: root.shouldShowOSD = false
    }

    Timer {
        id: startupTimer

        interval: 1000
        onTriggered: root.started = true
    }
}
