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

                Icon {
                    text: holder.modelData.icon
                    font.pixelSize: Theme.font.size.large
                    Layout.alignment: Qt.AlignCenter
                    Layout.topMargin: 2
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
