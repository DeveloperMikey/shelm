import QtQuick
import QtQuick.Layouts
import qs.Settings
import qs.Services
import qs.Modules

Rectangle {
    color: Theme.widgets.battery.backgroundColor
    anchors.centerIn: parent
    radius: Theme.cornerRadius
    implicitHeight: row.height + 4
    implicitWidth: Math.max(row.width + 10, Theme.widgets.battery.minimumSize)

    Rectangle {
        implicitHeight: parent.height
        implicitWidth: parent.width * BatteryService.batteryLevel / 100
        radius: Theme.cornerRadius
        color: {
            BatteryService.batteryLevel <= 30 ? Theme.widgets.battery.criticalColor : Theme.widgets.backgroundColor;
        }
    }

    RowLayout {
        id: row
        anchors.centerIn: parent
        spacing: 1
        StyledText {
            text: "electric_bolt"
            Layout.topMargin: 1
            font.family: Theme.font.family.material
            visible: BatteryService.isCharging
        }
        StyledText {
            text: BatteryService.batteryLevel + "%"
            Layout.topMargin: 2
        }
    }
}
