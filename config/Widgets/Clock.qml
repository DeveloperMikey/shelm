import QtQuick
import QtQuick.Layouts
import qs.Modules
import qs.Settings

BarRectangle {
    id: root
    required property var bar

    RowLayout {
        id: row
        spacing: Theme.contentSpacing
        StyledText {
            text: Time.time
        }

        Loader {
            active: Theme.widgets.clock.showDayOfWeek | Theme.widgets.clock.showDayOfMonth
            visible: active
            sourceComponent: StyledText {
                text: "•"
                color: Theme.textSecondary
            }
        }

        Loader {
            active: Theme.widgets.clock.showDayOfWeek
            visible: active
            sourceComponent: StyledText {
                text: Time.day
            }
        }

        Loader {
            active: Theme.widgets.clock.showDayOfMonth
            visible: active
            sourceComponent: StyledText {
                id: dayOfMonthText
                text: Time.dayOfMonth
            }
        }
    }
}
