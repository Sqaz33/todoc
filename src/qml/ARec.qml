import QtQuick 
import QtQuick.Effects

Item {
    id: item
    property color color
    // anchors.left: parent.left
    width: 100
    height: 100

    property var onClick: function(id) { }

    Rectangle {
        id: rect
        anchors.fill: parent
        color: item.color

        ASwText {
            id: txt
            anchors.centerIn: parent
            duration: 200
            firstText: "txt1"
            secondText: "txt2293749027\n234234\n23424243"
            color: "white"
        }
    }

    NumberAnimation on width { 
        id: anim
        duration: 300
        easing.type: Easing.InOutQuad 
        running: false
        onStopped: {
            if (item.width === 200) {
                txt.swap()
            }
        }
        onStarted: {
            if (item.width === 200) {
                txt.swap()
            }
        }
    }  

    MouseArea {
        anchors.fill: parent
        propagateComposedEvents: true
        onClicked: {
            anim.to = item.width === 100 ? 200 : 100
            anim.start()
            onClick(item)
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

}

