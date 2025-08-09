import QtQuick
import qs.Modules
import qs.Settings

StyledRectangle {
    property alias mouse: mouse
    property bool selected: false

    color: {
        if (selected)
            return Theme.colors.selected;
        if (mouse.pressed)
            return Theme.colors.pressed;
        if (mouse.containsMouse)
            return Theme.colors.hover;
        return Theme.colors.light;
    }

    MouseArea {
        id: mouse
        anchors.fill: parent
        hoverEnabled: true
    }
}
