import QtQuick
import qs.Modules

BarRectangle {
    Component.onCompleted: console.log(parent)
    Icon {
        text: "wifi"
        anchors.centerIn: parent
    }
}
