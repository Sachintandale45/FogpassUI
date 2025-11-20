import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    id: root
    anchors.fill: parent

    // window passed in from Main.qml when pushed/loaded
    property var parentWindow: null

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 16
        spacing: 12

        Text {
            id: welcomeText
            text: "Welcome — enter your name and press Enter"
            font.pointSize: 18
            color: parentWindow ? parentWindow.textColor : "#000000"
            horizontalAlignment: Text.AlignHCenter
            Layout.alignment: Qt.AlignHCenter
            wrapMode: Text.WordWrap
        }

        TextField {
            id: nameField
            placeholderText: "Your name"
            Layout.fillWidth: true
            background: Rectangle { color: parentWindow ? parentWindow.panelColor : "#ffffff"; radius: 6 }
            color: parentWindow ? parentWindow.textColor : "#000000"
            placeholderTextColor: parentWindow ? parentWindow.mutedTextColor : "#888888"
            onAccepted: {
                // push DemoPage and pass the entered name and the parent window
                if (parentWindow) parentWindow.stack.push(Qt.resolvedUrl("DemoPage.qml"), { userName: text, parentWindow: parentWindow })
            }
        }

        RowLayout {
            Layout.fillWidth: true
            spacing: 8

                Button {
                id: enterBtn
                text: "Enter"
                Layout.minimumWidth: 100
                background: Rectangle { color: parentWindow ? parentWindow.primaryColor : "#4fc3f7"; radius: 6 }
                contentItem: Text { text: enterBtn.text; anchors.centerIn: parent; color: parentWindow ? parentWindow.textColor : "#000000" }
                onClicked: { if (parentWindow) parentWindow.stack.push(Qt.resolvedUrl("DemoPage.qml"), { userName: nameField.text, parentWindow: parentWindow }) }
            }

            Button {
                id: quitBtn
                text: "Quit"
                Layout.alignment: Qt.AlignRight
                Layout.minimumWidth: 80
                background: Rectangle { color: parentWindow ? Qt.darker(parentWindow.panelColor, 1.05) : "#ddd"; radius: 6 }
                contentItem: Text { text: quitBtn.text; anchors.centerIn: parent; color: parentWindow ? parentWindow.textColor : "#000000" }
                onClicked: Qt.quit()
            }
        }
    }
}
