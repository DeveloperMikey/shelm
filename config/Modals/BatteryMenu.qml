import QtQuick
import QtQuick.Layouts
import qs.Modules
import qs.Panels

Popup {
    id: root
    grabFocus: true
    openFor: 5000
    BatteryPanel {
        Layout.margins: 5
        Layout.preferredWidth: 150
    }
}
