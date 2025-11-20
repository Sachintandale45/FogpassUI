
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

    // expose stack to pages
    property alias stack: stackView

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: { item: Qt.resolvedUrl("content/WelcomePage.qml"), properties: { parentWindow: appWindow } }
    }
}
