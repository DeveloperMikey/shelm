import QtQuick
import QtQuick.Layouts
import qs.Modules
import qs.Panels

Popup {
    id: root
    openFor: 5000
    grabFocus: true

    BatteryPanel {
        Layout.margins: 5
        Layout.preferredWidth: 150
    }
}
