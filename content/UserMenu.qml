import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    id: root
    property var parentWindow
    property int batteryLevel: 84
    width: parent ? parent.width : 800
    height: parent ? parent.height : 600

    Rectangle { anchors.fill: parent; color: "#ffffff" }

    Rectangle {
        id: header
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: 56
        color: "transparent"

        Text { text: "User Menu"; anchors.verticalCenter: parent.verticalCenter; anchors.left: parent.left; anchors.leftMargin: 16; font.pointSize: 20 }
        Text { id: batteryText; text: "Battery: " + batteryLevel + "%"; anchors.verticalCenter: parent.verticalCenter; anchors.right: parent.right; anchors.rightMargin: 16 }
    }

    ColumnLayout {
        anchors.top: header.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 24
        spacing: 12

        RowLayout { Layout.fillWidth: true; spacing: 8
            Text { text: "pune"; font.pointSize: 18 }
            Item { Layout.fillWidth: true }
            Text { text: "1200 meter"; font.pointSize: 18 }
        }

        RowLayout { Layout.fillWidth: true; spacing: 8
            Text { text: "bridge"; font.pointSize: 18 }
            Item { Layout.fillWidth: true }
            Text { text: "1800 meter"; font.pointSize: 18 }
        }

        RowLayout { Layout.fillWidth: true; spacing: 8
            Text { text: "nashik"; font.pointSize: 18 }
            Item { Layout.fillWidth: true }
            Text { text: "2500 meter"; font.pointSize: 18 }
        }

        Item { Layout.fillHeight: true }

        RowLayout { Layout.alignment: Qt.AlignHCenter; spacing: 12
            Button { text: "Back"; onClicked: if (parentWindow && parentWindow.stack) parentWindow.stack.pop() }
        }
    }
}
