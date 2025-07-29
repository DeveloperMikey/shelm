import QtQuick
import Quickshell
import qs.Modules

BarRectangle {
    Component.onCompleted: console.log(width)
    MouseArea {
        id: mouse
        anchors.fill: parent
        onPressed: Quickshell.execDetached("overskride")
    }
    Icon {
        anchors.centerIn: parent
        text: "bluetooth"
    }
}
