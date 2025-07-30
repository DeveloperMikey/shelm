import QtQuick
import Quickshell
import qs.Modules

BarRectangle {
    Component.onCompleted: console.log(width)
    MouseArea {
        id: mouse
        anchors.fill: parent
        onPressed: Quickshell.execDetached("nm-connection-editor")
    }
    Icon {
        anchors.centerIn: parent
        text: "wifi"
    }
}
