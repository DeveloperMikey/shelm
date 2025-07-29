pragma Singleton
import QtQuick
import Quickshell

Singleton {
    id: root
    reloadableId: "BrightnessService"

    Variants {
        model: Quickshell.screens
        Monitor {}
    }

    component Monitor: QtObject {
        id: monitor

        required property ShellScreen modelData
        property int brightness
    }
}
