pragma Singleton

import Quickshell
import QtQuick
import qs.Settings

Singleton {
    id: root
    readonly property string time: {
        Settings.use12HourClock ? Qt.formatDateTime(clock.date, "h:mm AP") : Qt.formatDateTime(clock.date, "hh:mm");
    }

    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }
}
