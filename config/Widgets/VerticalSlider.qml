import QtQuick
import qs.Settings

Rectangle {
    id: root
    required property real value
    required property real maxValue

    color: Theme.widgets.backgroundColor
    anchors.fill: parent
    radius: Theme.cornerRadius

    Rectangle {
        color: "#d5c4a1"
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        radius: Theme.cornerRadius
        implicitHeight: Math.min(parent.height * (root.value / root.maxValue), parent.height)

        Behavior on implicitHeight {
            NumberAnimation {
                duration: 30
            }
        }

        Rectangle {
            color: "#cc241d"
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            radius: Theme.cornerRadius
            implicitHeight: parent.height * ((root.value / root.maxValue) - 1)
        }
    }
}
