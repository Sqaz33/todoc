import QtQuick
import QtQuick.Effects

Window {
    id: window
    height: 500
    width: 500
    visible: true

    Rectangle {
        id: scene
        anchors.fill: parent
        color: "#A7C67B"
        property bool blur: false

        Flickable {
            id: flick
            anchors.horizontalCenter: parent.horizontalCenter
            width: col.width
            height: parent.height
            clip: true

            contentWidth: col.width    
            contentHeight: col.height  
            
            Rectangle {
                id: col
                color: scene.color
                anchors.left: parent.left

                property int spacing: 1
                property int count: 10

                width: 300
                height: (count * 100 + spacing * count)

                Repeater {
                    model: col.count

                    delegate: ARec {
                        color: "#824ca7"

                        y: index * (height + col.spacing)
                    }
                }
            }
        }

        layer.enabled: true
        layer.effect: MultiEffect {
            id: windowEffect
            blurEnabled: true
            blur: window.active ? 0.0 : 1.0
            
            Behavior on blur {
                NumberAnimation { duration: 100; }
            }
        }

    }    

}


