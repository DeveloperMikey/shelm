import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import qs.Settings
import qs.Modules

PopupWindow {
    id: root
    property bool open: false
    property int openFor: 0

    color: "transparent"

    anchor.margins.top: Theme.barHeight + 5
    anchor.margins.left: (anchor.item.width - width) / 2
    anchor.adjustment: PopupAdjustment.Slide

    onOpenChanged: {
        if (open) {
            visible = true;
            grab.active = true;
        }
        if (openFor > 0)
            timer.restart();
    }

    implicitWidth: menu.width
    implicitHeight: menu.height

    Rectangle {
        id: menu
        color: Theme.backgroundPrimary
        radius: Theme.cornerRadius
        border.width: 1
        border.color: Theme.seperatorColor
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
                onStopped: root.visible = root.open
            }
        }
    }

    HoverHandler {
        id: hover
        onHoveredChanged: {
            if (hovered) {
                timer.stop();
            } else {
                timer.restart();
            }
        }
    }

    HyprlandFocusGrab {
        id: grab
        windows: [root]
        onActiveChanged: {
            if (!active)
                root.open = false;
        }
    }

    Timer {
        id: timer
        repeat: false
        interval: root.openFor
        onTriggered: root.open = false
    }

    default property alias content: layout.children
}
