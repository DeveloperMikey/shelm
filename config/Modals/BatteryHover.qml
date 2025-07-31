import QtQuick
import Quickshell
import qs.Settings

PopupWindow {
    id: root

    anchor.rect.y: Theme.barHeight

    Rectangle {
        radius: Theme.cornerRadius
        width: 10
        height: 10
    }
}
