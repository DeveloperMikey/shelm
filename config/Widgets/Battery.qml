pragma ComponentBehavior: Bound
import Quickshell.Widgets
import Quickshell.Services.UPower
import QtQuick
import QtQuick.Layouts
import qs.Settings
import qs.Services
import qs.Modules
import qs.Modals

Loader {
    id: root
    required property var bar
    active: BatteryService.batteryAvailable

    sourceComponent: ClippingRectangle {
        id: battery
        anchors.centerIn: parent
        radius: Theme.cornerRadius
        implicitHeight: row.height + 4
        implicitWidth: Math.max(row.width + 10, Theme.widgets.battery.minimumSize)

        Behavior on color {
            ColorAnimation {
                duration: 90
            }
        }

        color: {
            if (BatteryService.batteryLevel <= 30) {
                if (mouse.pressed)
                    return Theme.colors.redMidlight.pressed;
                if (mouse.containsMouse)
                    return Theme.colors.redMidlight.hover;
                return Theme.colors.redMidlight.normal;
            } else {
                if (mouse.pressed)
                    return Theme.colors.midlightButton.pressed;
                if (mouse.containsMouse)
                    return Theme.colors.midlightButton.hover;
                return Theme.colors.midlightButton.normal;
            }
        }

        Rectangle {
            implicitWidth: (parent.width * BatteryService.batteryLevel / 100)
            implicitHeight: parent.height
            color: {
                if (BatteryService.batteryLevel <= 30) {
                    if (mouse.pressed)
                        return Theme.colors.redLight.pressed;
                    if (mouse.containsMouse)
                        return Theme.colors.redLight.hover;
                    return Theme.colors.redLight.normal;
                } else {
                    if (mouse.pressed)
                        return Theme.colors.button.pressed;
                    if (mouse.containsMouse)
                        return Theme.colors.button.hover;
                    return Theme.colors.button.normal;
                }
            }

            Behavior on color {
                ColorAnimation {
                    duration: 90
                }
            }
        }

        RowLayout {
            id: row
            anchors.centerIn: parent
            spacing: 1
            Icon {
                text: "south"
                Layout.topMargin: 1
                visible: UPower.onBattery
            }
            Icon {
                text: "power"
                Layout.topMargin: 1
                visible: !BatteryService.isCharging && !UPower.onBattery
            }
            Icon {
                text: "electric_bolt"
                Layout.topMargin: 1
                visible: BatteryService.isCharging
            }
            StyledText {
                text: BatteryService.batteryLevel + "%"
            }
        }

        BatteryHover {
            open: mouse.containsMouse && (BatteryService.isCharging || UPower.onBattery)
            anchor.item: battery
        }

        BatteryMenu {
            id: menu
            open: false
            anchor.item: battery
        }

        MouseArea {
            id: mouse
            anchors.fill: parent
            hoverEnabled: true
            onPressed: menu.open = !menu.open
        }
    }
}
