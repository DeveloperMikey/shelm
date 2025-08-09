import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import qs.Settings
import qs.Modules

PopupWindow {
    id: root
    property bool open: false
    property bool grabFocus: false
    property int openFor: 0

    color: "transparent"

    anchor.margins.top: Theme.barHeight + 5
    anchor.margins.left: (anchor.item.width - width) / 2
    anchor.adjustment: PopupAdjustment.Slide

    onOpenChanged: {
        if (open) {
            visible = true;
            if (openFor > 0)
                timer.restart();
        }
    }

    implicitWidth: menu.width
    implicitHeight: menu.height

    Rectangle {
        id: menu
        color: Theme.colors.base
        radius: Theme.cornerRadius
        border.width: 1
        border.color: palette.active.accent
        implicitHeight: Math.max(layout.height, 1)
        implicitWidth: Math.max(layout.width, 1)

        y: root.open ? 0 : -height

        RowLayout {
            id: layout
            spacing: 0
        }

        Behavior on y {
            NumberAnimation {
                duration: 150
                easing.type: Easing.OutCubic
                onRunningChanged: if (!running)
                    root.visible = root.open
            }
        }
    }

    HoverHandler {
        id: hover
        onHoveredChanged: {
            if (hovered) {
                timer.stop();
            } else if (root.openFor > 0) {
                timer.restart();
            }
        }
    }

    HyprlandFocusGrab {
        id: grab
        active: root.open && root.grabFocus
        windows: [root]
        onCleared: root.open = false
    }

    Timer {
        id: timer
        repeat: false
        interval: root.openFor
        onTriggered: root.open = false
    }

    default property alias content: layout.children
}
