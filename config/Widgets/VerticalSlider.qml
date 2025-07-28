import QtQuick
import qs.Settings

Rectangle {
    id: root
    required property real value
    required property real maxValue
    required property color fillColor
    required property color overflowColor

    color: Theme.widgets.backgroundColor
    anchors.fill: parent
    radius: Theme.cornerRadius

    Rectangle {
        color: root.fillColor
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        radius: Theme.cornerRadius
        implicitHeight: Math.min(parent.height * (root.value / root.maxValue), parent.height)

        Behavior on implicitHeight {
            NumberAnimation {
                duration: 20
            }
        }
    }

    Rectangle {
        color: root.overflowColor
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        radius: Theme.cornerRadius
        implicitHeight: parent.height * ((root.value / root.maxValue) - 1)
        Behavior on implicitHeight {
            NumberAnimation {
                duration: 40
            }
        }
    }
}
