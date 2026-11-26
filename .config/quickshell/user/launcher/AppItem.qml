import QtQuick
import Quickshell

Item {
    id: appItem

    required property var modelData

    width: parent.width
    height: 48

    Rectangle {
        anchors.fill: parent

        radius: 7

        color: mouseArea.containsMouse
            ? "#202A25"
            : "transparent"

        Row {
            anchors.fill: parent

            anchors.leftMargin: 12
            spacing: 50

            Image {
                width: 35
                height: 35

                anchors.verticalCenter: parent.verticalCenter

                source: Quickshell.iconPath(
                    modelData.icon,
                    "application-x-executable"
                )

                fillMode: Image.PreserveAspectFit

                smooth: true
            }

            Text {
                anchors.verticalCenter: parent.verticalCenter

                text: modelData.name

                color: "#FFFFFF"

                font.pixelSize: 20
                font.family: "JetBrainsMono Nerd Font"
            }
        }

        MouseArea {
            id: mouseArea

            anchors.fill: parent

            hoverEnabled: true

            onClicked: {
                      modelData.execute()
                      Qt.quit()
                      }
        }
    }
}
