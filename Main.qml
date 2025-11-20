
import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    id: appWindow
    flags: Qt.Window | Qt.CustomizeWindowHint | Qt.WindowTitleHint
    width: 400
    height: 320
    visible: true
    title: qsTr("Basic UI")

    // Simple color theme properties
    property color bgColor: "#1e1e2e"
    property color panelColor: "#252535"
    property color primaryColor: "#4fc3f7"
    property color textColor: "#ffffff"
    property color mutedTextColor: "#cfcfe0"
    // apply window background
    color: bgColor

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 12
        spacing: 8

        Text {
            id: label
            text: "Welcome — enter your name and press Greet"
            font.pointSize: 14
            horizontalAlignment: Text.AlignHCenter
            Layout.alignment: Qt.AlignHCenter
            wrapMode: Text.WordWrap
            color: textColor
        }

        TextField {
            id: nameField
            placeholderText: "Your name"
            Layout.fillWidth: true
            background: Rectangle {
                color: panelColor
                radius: 6
                border.color: Qt.lighter(panelColor, 1.2)
            }
            color: textColor
            placeholderTextColor: mutedTextColor
        }

        RowLayout {
            Layout.fillWidth: true
            spacing: 8

            Button {
                id: greetBtn
                text: "Greet"
                onClicked: {
                    if (nameField.text.length > 0)
                        label.text = "Hello, " + nameField.text + "!"
                    else
                        label.text = "Hello!"
                }
                background: Rectangle {
                    color: primaryColor
                    radius: 6
                }
                minimumWidth: 80
                contentItem: Text { text: greetBtn.text; anchors.centerIn: parent; color: textColor }
            }

            Button {
                id: clearBtn
                text: "Clear"
                onClicked: {
                    nameField.text = ""
                    label.text = "Welcome — enter your name and press Greet"
                }
                background: Rectangle {
                    color: Qt.darker(panelColor, 1.05)
                    radius: 6
                }
                minimumWidth: 80
                contentItem: Text { text: clearBtn.text; anchors.centerIn: parent; color: textColor }
            }
        }

        Slider {
            id: sizeSlider
            from: 10
            to: 30
            value: 14
            Layout.fillWidth: true
            onValueChanged: label.font.pointSize = value
            background: Rectangle { height: 6; radius: 3; color: Qt.darker(panelColor, 1.05) }
            handle: Rectangle { width: 14; height: 14; radius: 7; color: primaryColor }
        }

        CheckBox {
            id: toggleBold
            text: "Bold label"
            onCheckedChanged: label.font.bold = checked
            contentItem: Text { text: control.text; color: textColor }
        }

        Button {
            id: quitBtn
            text: "Quit"
            onClicked: Qt.quit()
            Layout.alignment: Qt.AlignRight
            minimumWidth: 80
            background: Rectangle {
                color: Qt.darker(panelColor, 1.05)
                radius: 6
            }
            contentItem: Text { text: quitBtn.text; anchors.centerIn: parent; color: textColor }
        }
    }
}
