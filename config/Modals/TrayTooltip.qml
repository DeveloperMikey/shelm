pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Layouts
import qs.Modules

Popup {
    id: root
    required property string title
    required property string description

    ColumnLayout {
        StyledText {
            id: text
            Layout.margins: 4
            text: root.title
        }
        Loader {
            active: root.description !== ""
            visible: active
            sourceComponent: StyledText {
                Layout.margins: 4
                text: root.description
            }
        }
    }
}
