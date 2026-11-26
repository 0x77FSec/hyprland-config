import QtQuick
import Quickshell
import QtQuick.Controls

FloatingWindow {
    id: launcher

    title: "User Launcher"

    implicitWidth: 500
    implicitHeight: 600
    
    Shortcut {
    sequence: "Escape"
    onActivated: Qt.quit()
    }

    

    color: "transparent"

    AppModel {
        id: appModel

        searchText: searchInput.text
    }

    Rectangle {
        anchors.fill: parent

        color: "#111111"
        radius: 12

        border.width: 1
        border.color: "#303030"

        Column {
            anchors.fill: parent

            anchors.margins: 20

            spacing: 15

            // Search bar

            Rectangle {
                width: parent.width
                height: 45

                radius: 8

                color: "#1A1A1A"

                border.width: 1
                border.color: "#303030"

                TextInput {
                    id: searchInput

                    anchors.fill: parent

                    anchors.leftMargin: 15
                    anchors.rightMargin: 15

                    verticalAlignment: TextInput.AlignVCenter

                    color: "#FFFFFF"

                    font.pixelSize: 14
                    font.family: "JetBrainsMono Nerd Font"

                    focus: true

                    Text {
                        anchors.fill: parent

                        text: "Search applications..."

                        color: '#23d8cf'

                        verticalAlignment: Text.AlignVCenter

                        visible: searchInput.text.length === 0

                        font.pixelSize: 14
                        font.family: "JetBrainsMono Nerd Font"
                    }
                }
            }

            // Section heading

            Text {
                text: "APPLICATIONS"

                color: "#00FF99"

                font.pixelSize: 11
                font.bold: true
                font.letterSpacing: 1.5
            }

            // Application list

            ListView {
                id: appList

                width: parent.width

                height: parent.height - 90

                clip: true

                spacing: 4

                model: appModel

                delegate: AppItem {
                    width: appList.width
                }

                ScrollBar.vertical: ScrollBar {
                }
            }
        }
    }
}
