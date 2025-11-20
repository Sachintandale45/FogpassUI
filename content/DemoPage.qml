import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    id: demoRoot
    anchors.fill: parent

    // window passed in from Main.qml or WelcomePage
    property var parentWindow: null
    property string userName: ""

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 16
        spacing: 12

        Text {
            text: userName.length > 0 ? "Hello, " + userName + "!" : "Hello!"
            font.pointSize: 18
            color: parentWindow ? parentWindow.textColor : "#000000"
            horizontalAlignment: Text.AlignHCenter
            Layout.alignment: Qt.AlignHCenter
        }

        Rectangle {
            Layout.fillWidth: true
            color: parentWindow ? parentWindow.panelColor : "#ffffff"
            radius: 8
            height: 120

            Column {
                anchors.fill: parent
                anchors.margins: 12
                spacing: 8

                Text {
                    text: "Location: Pune"
                    color: parentWindow ? parentWindow.textColor : "#000000"
                    font.pointSize: 14
                }
                Text {
                    text: "Distance: 1200 meter"
                    color: parentWindow ? parentWindow.textColor : "#000000"
                    font.pointSize: 14
                }

                RowLayout {
                    Layout.fillWidth: true
                    spacing: 8
                    Text {
                        text: "Battery:"
                        color: parentWindow ? parentWindow.textColor : "#000000"
                    }
                    ProgressBar {
                        id: batteryBar
                        value: 0.78
                        from: 0
                        to: 1
                        Layout.preferredWidth: 200
                        background: Rectangle {
                            color: parentWindow ? Qt.darker(parentWindow.panelColor, 1.1) : "#ccc"
                        }
                    }
                    Text {
                        id: batteryText
                        text: Math.round(batteryBar.value*100) + "%"
                        color: parentWindow ? parentWindow.textColor : "#000000"
                    }
                }
            }
        }

        RowLayout {
            Layout.fillWidth: true
            spacing: 8

            Button {
                id: backBtn
                text: "Back"
                Layout.minimumWidth: 80
                background: Rectangle {
                    color: parentWindow ? Qt.darker(parentWindow.panelColor, 1.05) : "#ddd"
                    radius: 6
                }
                contentItem: Text {
                    text: backBtn.text
                    anchors.centerIn: parent
                    color: parentWindow ? parentWindow.textColor : "#000000"
                }
                onClicked: { if (parentWindow) parentWindow.stack.pop() }
            }

            Button {
                id: refreshBtn
                text: "Refresh"
                Layout.minimumWidth: 80
                background: Rectangle {
                    color: parentWindow ? parentWindow.primaryColor : "#4fc3f7"
                    radius: 6
                }
                contentItem: Text {
                    text: refreshBtn.text
                    anchors.centerIn: parent
                    color: parentWindow ? parentWindow.textColor : "#000000"
                }
                onClicked: {
                    if (batteryBar.value > 0.7)
                        batteryBar.value = 0.45
                    else
                        batteryBar.value = 0.78
                    batteryText.text = Math.round(batteryBar.value*100) + "%"
                }
            }
        }
    }

    // local progress control referenced above
    ProgressBar {
        id: progress
        visible: false
    }
}
