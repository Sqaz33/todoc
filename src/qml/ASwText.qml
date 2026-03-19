import QtQuick 

Text {
    id: txt
    property int duration
    property string firstText;
    property string secondText;
    text: firstText

    function swap() {
        hideAnim.start()
    }

    NumberAnimation on opacity {
        id: showAnim
        duration: txt.duration / 2
        easing.type: Easing.InOutQuad 
        running: false
        from: 0
        to: 1
    }

    NumberAnimation on opacity {
        id: hideAnim
        duration: txt.duration / 2
        easing.type: Easing.InOutQuad 
        running: false
        from: 1
        to: 0
        onStopped: { 
            text = text === firstText ? secondText : firstText
            showAnim.start()
        }
    }
}