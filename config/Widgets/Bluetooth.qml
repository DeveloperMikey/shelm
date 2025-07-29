import QtQuick
import Quickshell
import qs.Modules

BarRectangle {
    Component.onCompleted: console.log(width)
    MouseArea {
        id: mouse
        anchors.fill: parent
        onPressed: console.log("s")
    }
    Icon {
        anchors.centerIn: parent
        text: "bluetooth"
    }
}
