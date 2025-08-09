import QtQuick

QtObject {
    property int minimumHeight: 24
    property Battery battery: Battery {}
    property Clock clock: Clock {}

    component Battery: QtObject {
        property int minimumSize: 45
    }

    component Clock: QtObject {
        property bool showDayOfWeek: true
        property bool showDayOfMonth: true
    }
}
