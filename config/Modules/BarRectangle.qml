import QtQuick
import QtQuick.Layouts
import qs.Settings

Rectangle {
    id: root
    color: Theme.widgets.backgroundColor
    implicitHeight: layout.height + 4
    implicitWidth: layout.width + 10
    radius: Theme.cornerRadius
    visible: layout.visible

    RowLayout {
        id: layout
        spacing: 0
        anchors.centerIn: parent
    }

    default property alias content: layout.children
}
