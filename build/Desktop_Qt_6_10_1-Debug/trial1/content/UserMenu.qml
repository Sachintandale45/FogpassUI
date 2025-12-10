import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    id: root
    property var parentWindow
    // batteryLevel is provided by the C++ backend as `backend.batteryLevel`
    width: parent ? parent.width : 800
    height: parent ? parent.height : 600

    // Beautiful gradient background with mixed colors
    Rectangle {
        anchors.fill: parent
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#667eea" }  // Purple-blue
            GradientStop { position: 0.5; color: "#764ba2" }  // Purple
            GradientStop { position: 1.0; color: "#f093fb" }  // Pink
        }
    }

    Rectangle {
        id: header
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: 56
        color: "transparent"

        Text { text: "User Menu"; anchors.verticalCenter: parent.verticalCenter; anchors.left: parent.left; anchors.leftMargin: 16; font.pointSize: 20; color: "#ffffff"; font.bold: true }
        Text { id: batteryText; text: "Battery: " + (typeof backend !== 'undefined' ? backend.batteryLevel : "--") + "%"; anchors.verticalCenter: parent.verticalCenter; anchors.right: parent.right; anchors.rightMargin: 16; color: "#ffffff"; font.bold: true }
    }

    ColumnLayout {
        anchors.top: header.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 24
        spacing: 12

        RowLayout { Layout.fillWidth: true; spacing: 8
            Text { text: "pune"; font.pointSize: 18; color: "#ffffff" }
            Item { Layout.fillWidth: true }
            Text { text: "1200 meter"; font.pointSize: 18; color: "#ffffff" }
        }

        RowLayout { Layout.fillWidth: true; spacing: 8
            Text { text: "bridge"; font.pointSize: 18; color: "#ffffff" }
            Item { Layout.fillWidth: true }
            Text { text: "1800 meter"; font.pointSize: 18; color: "#ffffff" }
        }

        RowLayout { Layout.fillWidth: true; spacing: 8
            Text { text: "nashik"; font.pointSize: 18; color: "#ffffff" }
            Item { Layout.fillWidth: true }
            Text { text: "2500 meter"; font.pointSize: 18; color: "#ffffff" }
        }

        Item { Layout.fillHeight: true }

        RowLayout { Layout.alignment: Qt.AlignHCenter; spacing: 12
            Button { 
                text: "Back"; 
                Layout.minimumWidth: 200
                Layout.minimumHeight: 50
                font.pointSize: 16
                font.bold: true
                background: Rectangle {
                    radius: 8
                    color: parent.pressed ? "#ffffff" : "#ffffff"
                    opacity: parent.pressed ? 0.9 : 1.0
                    border.width: 2
                    border.color: "#333333"
                }
                contentItem: Text {
                    text: parent.text
                    font: parent.font
                    color: "#333333"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                onClicked: if (parentWindow && parentWindow.stack) parentWindow.stack.pop() 
            }
        }
    }
}
