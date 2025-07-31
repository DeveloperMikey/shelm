import QtQuick
import QtQuick.Layouts
import qs.Settings

Rectangle {
    id: root
    property bool clickable: false
    property bool padding: true
    color: clickable && hover.hovered ? Theme.widgets.hoverColor : Theme.widgets.backgroundColor
    implicitHeight: Math.max(Theme.widgets.minimumHeight, layout.height + (padding ? 4 : 0))
    implicitWidth: layout.width + (padding ? 10 : 0)
    radius: Theme.cornerRadius
    visible: layout.visible

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
