import QtQuick
import QtQuick.Layouts
import qs.Modules
import qs.Settings

BarRectangle {
    id: root

    RowLayout {
        id: row
        anchors.centerIn: parent
        spacing: Theme.contentSpacing
        StyledText {
            text: Time.time
            Layout.topMargin: 2
        }

        Loader {
            active: Theme.widgets.clock.showDayOfWeek | Theme.widgets.clock.showDayOfMonth
            visible: active
            Layout.topMargin: 2
            sourceComponent: StyledText {
                text: "•"
                color: Theme.textSecondary
            }
        }

        Loader {
            active: Theme.widgets.clock.showDayOfWeek
            visible: active
            Layout.topMargin: 2
            sourceComponent: StyledText {
                text: Time.day
            }
        }

        Loader {
            active: Theme.widgets.clock.showDayOfMonth
            visible: active
            Layout.topMargin: 2
            sourceComponent: StyledText {
                id: dayOfMonthText
                text: Time.dayOfMonth
            }
        }
    }
}
