import QtQuick
import Quickshell
import qs.Modules

BarButton {
    id: root
    required property var bar

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
