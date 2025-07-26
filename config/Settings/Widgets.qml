pragma Singleton
import Quickshell
import QtQuick

Singleton {
    component Battery: QtObject {
        property int minimumSize: 45
        property string backgroundColor: "#3c3836"
        property string criticalColor: "#cc241d"
    }

    component Widgets: QtObject {
        property Battery battery: Battery {}
    }
}
