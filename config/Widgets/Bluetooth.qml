import QtQuick
import Quickshell
import qs.Modules

BarRectangle {
    id: root

    clickable: true
    Icon {
        text: "bluetooth"
    }

    MouseArea {
        id: mouse
        parent: root
        anchors.fill: parent
        onPressed: Quickshell.execDetached("overskride")
    }
}
