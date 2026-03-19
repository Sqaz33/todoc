import QtQuick 
import QtQuick.Effects

Item {
    id: item
    property color color
    width: 100
    height: 100

    Rectangle {
        id: rect
        anchors.fill: parent
        color: item.color

        ASwText {
            id: txt
            anchors.centerIn: parent
            duration: 300
            firstText: "txt1"
            secondText: "txt2293749027\n234234\n23424243sdfsdfsdfsdfsdfsdfsdfsdfsfsdfsdf"
            color: "white"
        }
    }

    NumberAnimation on width { 
        id: anim
        duration: 300
        easing.type: Easing.InOutQuad 
        running: false
        onStarted: {
            txt.swap()
        }
    }  

    MultiEffect {
        anchors.fill: rect
        source: rect
        shadowEnabled: true
        shadowColor: "#80000000"
        shadowBlur: 1.0
        shadowHorizontalOffset: 10
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true

        onPressed: drag.target = item
        onReleased: drag.target = null

        onClicked: {
            anim.to = item.width === 100 ? 200 : 100
            anim.start()
        }
    }
}

