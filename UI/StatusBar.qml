import QtQuick 2.15

Rectangle{
    id:statusBar
    color:"#000000"
    radius: 5//5%

    width:726
    height:51
    Rectangle{
        id:notificationBadge
        height:40
        width:40
        radius:20
        color:"#ffffff"
        anchors{
            verticalCenter: parent.verticalCenter
            left:parent.left
            leftMargin: 10
        }

        Text{
            anchors.centerIn: parent
            font.pixelSize: 24
            color:"#000000"
            text:"3"
        }
    }

    Text{
        id:timeText
        anchors.centerIn: parent
        color:"#ffffff"
        font.pixelSize: 36
        text:"12:22 PM"
    }

    Image{
        id:wifiSymbol
        anchors{
           verticalCenter: parent.verticalCenter
           right:parent.right
           rightMargin:10
        }
        width:40
        height:40
        source:"qrc:/UI/Assets/icons8-wi-fi-48.png"
    }
}
