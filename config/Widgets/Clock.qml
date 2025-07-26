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
        Text {
            text: Time.time
            color: Theme.textPrimary
            Layout.topMargin: 2
        }

        Loader {
            active: Theme.showDayOnBar | Theme.showDayOfMonthOnBar
            visible: active
            Layout.topMargin: 2
            sourceComponent: Text {
                text: "•"
                color: Theme.textSecondary
            }
        }

        Loader {
            active: Theme.showDayOnBar
            visible: active
            Layout.topMargin: 2
            sourceComponent: Text {
                text: Time.day
                color: Theme.textPrimary
            }
        }

        Loader {
            active: Theme.showDayOfMonthOnBar
            visible: active
            Layout.topMargin: 2
            sourceComponent: Text {
                id: dayOfMonthText
                text: Time.dayOfMonth
                color: Theme.textPrimary
            }
        }
    }
}
