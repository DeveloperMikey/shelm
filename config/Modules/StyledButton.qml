import QtQuick
import QtQuick.Layouts
import qs.Modules
import qs.Settings

StyledRectangle {
    property alias mouse: mouse
    property bool selected: false
    property RowLayout layout: layout

    property bool alternate: false

    property Theme.ButtonColors colors: alternate ? Theme.colors.midlightButton : Theme.colors.button

    implicitHeight: layout.height
    implicitWidth: layout.width

    border.width: 0

    color: {
        if (selected)
            return colors.selected;
        if (mouse.pressed)
            return colors.pressed;
        if (mouse.containsMouse)
            return colors.hover;
        return colors.normal;
    }

    RowLayout {
        id: layout
        spacing: 0
        anchors.centerIn: parent
    }

    MouseArea {
        id: mouse
        anchors.fill: parent
        hoverEnabled: true
    }

    default property alias content: layout.children
}
