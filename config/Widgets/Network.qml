import QtQuick
import Quickshell
import qs.Modules

BarRectangle {
    id: root
    required property var bar

    clickable: true
    Icon {
        text: "wifi"
    }

    MouseArea {
        id: mouse
        parent: root
        anchors.fill: parent
        onPressed: Quickshell.execDetached("nm-connection-editor")
    }
}
