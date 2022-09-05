import QtQuick 2.15
//6
import Package 1.0

Item {
    Rectangle{
        id:hotRectangle
        height:parent.height
        width:parent.width/2
        color:"#f59d8e"

        anchors{
            top:parent.top
            left:parent.left
        }
        Image{
            id: hotImage
            width:256
            height:256
            anchors.centerIn:parent
            source:"qrc:/UI/Assets/mug-hot.png"
        }

        Text{
            anchors{
                top:hotImage.bottom
                horizontalCenter:parent.horizontalCenter
                topMargin:40
            }
            font.pixelSize:96
            color:"#b34d34"
            text:"Hot"
        }

        //6
        MouseArea{
            anchors.fill:parent
            onClicked:
            {

                systemController.setDrinkTemperature(SystemController.HOT)//the first systemContriller is the id, the second is the class
                stackView.push("DrinkTypePage.qml")
            }
        }
    }

    Rectangle{
        id:coldRectangle
        height:parent.height
        width:parent.width/2
        color:"#8eeef5"
        anchors{
            top:parent.top
            right:parent.right
        }
        Image{
            id:coldImage
            width:256
            height:256
            anchors.centerIn:parent
            source:"qrc:/UI/Assets/snowflake1.png"
        }
        Text{
            anchors{
                top:coldImage.bottom
                horizontalCenter:parent.horizontalCenter
                topMargin:40
            }
            font.pixelSize:96
            color:"#3190b5"
            text:"Cold"
        }

        //6
        MouseArea{
            anchors.fill:parent
            onClicked:
            {

                systemController.setDrinkTemperature(SystemController.COLD)//the first systemContriller is the id, the second is the class
                stackView.push("DrinkTypePage.qml")
            }
        }

    }
}
