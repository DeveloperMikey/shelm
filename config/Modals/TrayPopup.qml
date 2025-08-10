pragma ComponentBehavior: Bound
import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.Modules
import qs.Settings

Popup {
    id: root
    required property QsMenuHandle menu
    openFor: 5000
    grabFocus: true
    rect.color: Theme.colors.light

    property QsMenuOpener opener: QsMenuOpener {
        id: opener
        menu: root.menu
    }

    ColumnLayout {
        spacing: 0
        Layout.margins: 1
        Layout.fillWidth: true
        Layout.fillHeight: true
        Repeater {
            id: repeater
            model: opener.children
            delegate: ColumnLayout {
                id: data
                required property QsMenuEntry modelData
                required property int index

                spacing: 0

                property int buttonIndex: {
                    var count = 0;
                    for (var i = 0; i < index; i++) {
                        if (!opener.children.values[i].isSeparator)
                            count++;
                    }
                    return count;
                }

                property int buttonCount: opener.children.values.filter(val => !val.isSeparator).length

                Loader {
                    Layout.fillWidth: true
                    active: !data.modelData.isSeparator
                    sourceComponent: StyledButton {
                        Layout.fillWidth: true
                        topLeftRadius: data.buttonIndex === 0 ? Theme.cornerRadius : 0
                        topRightRadius: data.buttonIndex === 0 ? Theme.cornerRadius : 0
                        bottomLeftRadius: data.buttonIndex === data.buttonCount - 1 ? Theme.cornerRadius : 0
                        bottomRightRadius: data.buttonIndex === data.buttonCount - 1 ? Theme.cornerRadius : 0
                        alternate: data.buttonIndex % 2 === 0

                        mouse.onClicked: data.modelData.triggered()

                        Loader {
                            active: data.modelData.icon !== ""
                            sourceComponent: Image {
                                source: data.modelData.icon
                            }
                        }

                        Loader {
                            id: checkLoader
                            property int type: data.modelData.buttonType
                            property int checked: data.modelData.checkState !== 0
                            active: type !== QsMenuButtonType.None
                            sourceComponent: StyledRectangle {
                                implicitHeight: 10
                                implicitWidth: 10
                                radius: checkLoader.type === QsMenuButtonType.CheckBox ? 2 : 100
                                border.width: 1
                                border.color: Theme.colors.text

                                StyledRectangle {
                                    visible: checkLoader.checked
                                    implicitHeight: 4
                                    implicitWidth: 4
                                    radius: checkLoader.type === QsMenuButtonType.CheckBox ? 2 : 100
                                    border.width: 0
                                    color: Theme.colors.text
                                    anchors.centerIn: parent
                                }
                            }
                        }

                        StyledText {
                            Layout.margins: 2
                            Layout.rightMargin: 6
                            Layout.leftMargin: 6
                            text: data.modelData.text
                        }
                    }
                }

                Loader {
                    Layout.fillWidth: true
                    active: data.modelData.isSeparator && data.index !== repeater.count - 1
                    sourceComponent: StyledRectangle {
                        Layout.fillWidth: true
                        implicitHeight: 1
                        color: Theme.colors.accent
                    }
                }
            }
        }
    }
}
