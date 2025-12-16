import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    id: root
    property var parentWindow
    width: parent ? parent.width : 800
    height: parent ? parent.height : 600

    Rectangle {
        anchors.fill: parent
        color: "#ffffff"
    }

    Text {
        id: welcomeText
        text: "Welcome"
        anchors.centerIn: parent
        font.pointSize: 36
        font.bold: true
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    Timer {
        id: autoTimer
        interval: 4000
        repeat: false
        running: true
        onTriggered: {
            if (parentWindow && parentWindow.stack) {
                parentWindow.stack.push(Qt.resolvedUrl("qrc:/qt/qml/trial1/content/SplashPage.qml"), { parentWindow: parentWindow })
            }
        }
    }
}
