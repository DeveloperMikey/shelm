import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.Widgets
import qs.Settings

Scope {
    Variants {
        model: Quickshell.screens

        PanelWindow {
            id: bar
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

            Rectangle {
                id: seperator
                implicitHeight: 2
                color: Theme.backgroundSecondary
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.right: parent.right
            }
        }
    }
}
