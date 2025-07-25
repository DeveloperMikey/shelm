import Quickshell
import QtQuick
import qs.Widgets
import qs.Settings

Scope {
    Variants {
        model: Quickshell.screens

        PanelWindow {
            required property var modelData
            screen: modelData
            color: Theme.backgroundPrimary

            implicitHeight: 30

            anchors {
                top: true
                left: true
                right: true
            }

            Clock {
                anchors.centerIn: parent
            }
        }
    }
}
