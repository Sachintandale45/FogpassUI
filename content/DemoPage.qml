import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    id: demoRoot
    anchors.fill: parent

    property string userName: ""

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 16
        spacing: 12

        Text {
            text: userName.length > 0 ? "Hello, " + userName + "!" : "Hello!"
            font.pointSize: 18
            color: appWindow.textColor
            horizontalAlignment: Text.AlignHCenter
            Layout.alignment: Qt.AlignHCenter
        }

        Rectangle {
            Layout.fillWidth: true
            color: appWindow.panelColor
            radius: 8
            height: 120

            Column {
                anchors.fill: parent
                anchors.margins: 12
                spacing: 8

                Text { text: "Location: Pune"; color: appWindow.textColor; font.pointSize: 14 }
                Text { text: "Distance: 1200 meter"; color: appWindow.textColor; font.pointSize: 14 }

                RowLayout {
                    Layout.fillWidth: true
                    spacing: 8
                    Text { text: "Battery:"; color: appWindow.textColor }
                    ProgressBar { value: 0.78; from: 0; to: 1; Layout.preferredWidth: 200; background: Rectangle { color: Qt.darker(appWindow.panelColor,1.1) }; contentItem: null }
                    Text { text: "78%"; color: appWindow.textColor }
                }
            }
        }

        RowLayout {
            Layout.fillWidth: true
            spacing: 8

            Button {
                text: "Back"
                Layout.minimumWidth: 80
                background: Rectangle { color: Qt.darker(appWindow.panelColor, 1.05); radius: 6 }
                contentItem: Text { text: control.text; anchors.centerIn: parent; color: appWindow.textColor }
                onClicked: appWindow.stack.pop()
            }

            Button {
                text: "Refresh"
                Layout.minimumWidth: 80
                background: Rectangle { color: appWindow.primaryColor; radius: 6 }
                contentItem: Text { text: control.text; anchors.centerIn: parent; color: appWindow.textColor }
                onClicked: {
                    // demo: toggle battery value for visual feedback
                    // In a real app you'd read sensor data here
                    // This toggles between 78% and 45%
                    if (progress.value > 0.7) progress.value = 0.45; else progress.value = 0.78
                }
            }
        }
    }

    // local progress control referenced above
    ProgressBar { id: progress; visible: false }
}
