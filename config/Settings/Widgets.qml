pragma Singleton
import Quickshell
import QtQuick

Singleton {
    component Battery: QtObject {
        property int minimumSize: 45
        property string backgroundColor: "#3c3836"
        property string criticalColor: "#cc241d"
    }

    component Clock: QtObject {
        property bool showDayOfWeek: true
        property bool showDayOfMonth: true
    }

    component Widgets: QtObject {
        property color backgroundColor: "#504945"
        property string borderColor: "#282828"
        property string hoverBorderColor: "#d65d0e"
        property int minimumHeight: 24
        property Battery battery: Battery {}
        property Clock clock: Clock {}
    }
}
