import QtQuick
import QtQuick.Layouts
import qs.Settings

Rectangle {
    id: root
    property bool clickable: false
    property bool padding: true
    color: Theme.widgets.backgroundColor
    implicitHeight: Math.max(Theme.widgets.minimumHeight, layout.height + (padding ? 5 : 0))
    implicitWidth: layout.width + (padding ? 12 : 8)
    radius: Theme.cornerRadius
    visible: layout.visible

    border.width: 1
    border.color: clickable && hover.hovered ? Theme.widgets.hoverBorderColor : Theme.widgets.borderColor

    RowLayout {
        id: layout
        spacing: 0
        anchors.centerIn: parent
    }

    HoverHandler {
        id: hover
    }

    Behavior on color {
        ColorAnimation {
            duration: 100
        }
    }

    Behavior on implicitWidth {
        NumberAnimation {
            duration: 100
        }
    }

    default property alias content: layout.children
}
