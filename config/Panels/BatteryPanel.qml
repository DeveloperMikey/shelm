import QtQuick
import QtQuick.Layouts
import Quickshell.Services.UPower
import qs.Settings
import qs.Modules

ColumnLayout {
    RowLayout {
        Layout.fillWidth: true
        Layout.fillHeight: true
        Repeater {
            model: [
                {
                    profile: PowerProfile.PowerSaver,
                    icon: "energy_savings_leaf"
                },
                {
                    profile: PowerProfile.Balanced,
                    icon: "balance"
                },
                {
                    profile: PowerProfile.Performance,
                    icon: "rocket_launch"
                },
            ]
            delegate: StyledButton {
                id: holder
                required property var modelData
                selected: PowerProfiles.profile === modelData.profile
                Layout.fillWidth: true
                Layout.preferredHeight: 30
                radius: Theme.cornerRadius
                border.width: 1

                Icon {
                    text: holder.modelData.icon
                    font.pixelSize: Theme.font.size.large
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.verticalCenterOffset: 1
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Behavior on color {
                    ColorAnimation {
                        duration: 100
                    }
                }

                mouse.onPressed: PowerProfiles.profile = modelData.profile
            }
        }
    }
}
