import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    id: root
    anchors.fill: parent

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 16
        spacing: 12

        Text {
            id: welcomeText
            text: "Welcome — enter your name and press Enter"
            font.pointSize: 18
            color: appWindow.textColor
            horizontalAlignment: Text.AlignHCenter
            Layout.alignment: Qt.AlignHCenter
            wrapMode: Text.WordWrap
        }

        TextField {
            id: nameField
            placeholderText: "Your name"
            Layout.fillWidth: true
            background: Rectangle { color: appWindow.panelColor; radius: 6 }
            color: appWindow.textColor
            placeholderTextColor: appWindow.mutedTextColor
            onAccepted: {
                // push DemoPage and pass the entered name
                appWindow.stack.push("content/DemoPage.qml", { userName: text })
            }
        }

        RowLayout {
            Layout.fillWidth: true
            spacing: 8

            Button {
                text: "Enter"
                Layout.minimumWidth: 100
                background: Rectangle { color: appWindow.primaryColor; radius: 6 }
                contentItem: Text { text: control.text; anchors.centerIn: parent; color: appWindow.textColor }
                onClicked: appWindow.stack.push("content/DemoPage.qml", { userName: nameField.text })
            }

            Button {
                text: "Quit"
                Layout.alignment: Qt.AlignRight
                Layout.minimumWidth: 80
                background: Rectangle { color: Qt.darker(appWindow.panelColor, 1.05); radius: 6 }
                contentItem: Text { text: control.text; anchors.centerIn: parent; color: appWindow.textColor }
                onClicked: Qt.quit()
            }
        }
    }
}
