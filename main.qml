import QtQuick 
import QtQuick.Controls

Window {
    width: 400
    height: 200
    visible: true
    title: "QML + C++ Example"

    Rectangle {

        width: parent.width
        height: parent.height

        gradient: Gradient {
            GradientStop { position: 0.0; color: "yellow" }
            GradientStop { position: 1.0; color: "green" }
        }
    }

    Column {
        anchors.centerIn: parent
        spacing: 10

        TextField {
            id: input
            width: 200
            placeholderText: "Enter your name"
        }

        Button {
            text: "Say Hello"
            onClicked: message.text = backend.greet(input.text)
        }

        Text {
            id: message
            text: ""
            font.pixelSize: 16
        }
    }


}
