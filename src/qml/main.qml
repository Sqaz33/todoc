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

        // Flickable {
        //     id: flick
        //     width: col.width
        //     height: parent.height
        //     clip: true

        //     anchors.horizontalCenter: parent.horizontalCenter

        //     contentWidth: col.width    
        //     contentHeight: col.height  

            Column {
                id: col
                anchors.left: parent.left
                spacing: 1
                width: 200

                property int count: 2

                height: (count * 100 + spacing * count)

                Repeater {
                    model: col.count
                    delegate: ARec { 
                        color: "#824ca7"; 
                        dragItem: dragArea.setDragTarget
                        stickItem: dragArea.releaseDragTarget
                    }
                }
            }
        // }

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


