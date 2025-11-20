
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
        }

        TextField {
            id: nameField
            placeholderText: "Your name"
            Layout.fillWidth: true
        }

        RowLayout {
            Layout.fillWidth: true
            spacing: 8

            Button {
                text: "Greet"
                onClicked: {
                    if (nameField.text.length > 0)
                        label.text = "Hello, " + nameField.text + "!"
                    else
                        label.text = "Hello!"
                }
            }

            Button {
                text: "Clear"
                onClicked: {
                    nameField.text = ""
                    label.text = "Welcome — enter your name and press Greet"
                }
            }
        }

        Slider {
            id: sizeSlider
            from: 10
            to: 30
            value: 14
            Layout.fillWidth: true
            onValueChanged: label.font.pointSize = value
        }

        CheckBox {
            id: toggleBold
            text: "Bold label"
            onCheckedChanged: label.font.bold = checked
        }

        Button {
            text: "Quit"
            onClicked: Qt.quit()
            Layout.alignment: Qt.AlignRight
        }
    }
}
