import Quickshell
import QtQuick
import qs.Widgets

Scope {
    Variants {
        model: Quickshell.screens

        PanelWindow {
            required property var modelData
            screen: modelData

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
