import QtQuick 
import QtQuick.Effects
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: item
    property color color
    width: 100
    height: 100

    Rectangle {
        id: rect
        anchors.fill: parent
        color: item.color   

        RowLayout {
            id: row
            anchors.fill: parent
            spacing: 10

            Rectangle {
                id: buttons
                width: 20
                height: 100
                color: rect.color
                ColumnLayout {
                    anchors.fill: parent
                    Button {
                        text: "↑" 
                        onClicked: console.log("click")
                    }
                    Button {
                        text: "↓" 
                        onClicked: console.log("click")
                    }
                }
            }

            Rectangle {
                height: item.height 
                width: item.width - buttons.width - row.spacing
                // color: rect.color

                ASwText {
                    id: txt
                    duration: 400
                    anchors.horizontalCenter: parent.horizontalCenter
                    Layout.fillWidth: true
                    y: 10
                    firstText: "txt1"
                    secondText: "riba ribariba ri riba ribaaa rib riba riba ribariba ri riba ribaaa rib riba riba ribariba ri riba ribaaa rib riba"
                    // color: "white"
                    color: "black"
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: {
                        anim.to = item.width === 100 ? 200 : 100
                        anim.start()
                    }
                }
            }
        }
    }

    NumberAnimation on width { 
        id: anim
        duration: 100
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
}

