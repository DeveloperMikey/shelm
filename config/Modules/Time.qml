pragma Singleton

import Quickshell
import QtQuick
import qs.Settings

Singleton {
    id: root
    readonly property string time: {
        Settings.use12HourClock ? Qt.formatDateTime(clock.date, "h:mm AP") : Qt.formatDateTime(clock.date, "hh:mm");
    }
    readonly property string day: {
        Qt.formatDateTime(clock.date, "ddd");
    }
    readonly property string dayOfMonth: {
        Qt.formatDateTime(clock.date, "dd");
    }

    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }
}
