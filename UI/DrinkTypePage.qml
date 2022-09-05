import QtQuick 2.15
import Package 1.0

//7
Rectangle{
    id:mainBackground
    anchors.fill:parent
    color:{
        if(systemController.drinkTemperature === SystemController.HOT)
            return "#f59d8e"
        else if(systemController.drinkTemperature === SystemController.COLD)
            return "#8eeef5"
    }

    //8
    Rectangle{//the background circles
        id:centerButton
        width:281
        height:281
        radius:281/2
        color:"#c4c4c4"
        anchors.centerIn: parent
        Image{
            anchors.centerIn: parent
            width:156
            height:156

            source:{
                if(systemController.drinkTemperature === SystemController.HOT)
                    return "qrc:/UI/Assets/icons8-mint-48.png"
                else if(systemController.drinkTemperature === SystemController.COLD)
                    return "qrc:/UI/Assets/icons8-bottle-of-water-48.png"
            }

            //9
            Text{
                color:"#000000"
                font.pixelSize:28
                text:{
                    if(systemController.drinkTemperature === SystemController.HOT)
                        return "Tea"
                    else if(systemController.drinkTemperature === SystemController.COLD)
                        return "Soda"
                }
                anchors{
                    horizontalCenter:parent.horizontalCenter
                    top:parent.bottom
                    topMargin: 10
                }

            }
        }

        //14
        MouseArea{
            anchors.fill:parent

            //to change the background color
            onPressed:{
                if(systemController.drinkTemperature === SystemController.HOT)
                    parent.color = "#b34d34"
                else if(systemController.drinkTemperature === SystemController.COLD)
                    parent.color = "#3190b5"
            }

            onReleased:{
                parent.color = "#c4c4c4"
            }

            //15 to change the QString
            onClicked:{
                if(systemController.drinkTemperature === SystemController.HOT)
                    systemController.setDrinkType("Tea")
                else if(systemController.drinkTemperature === SystemController.COLD)
                    systemController.setDrinkType("Soda")

                stackView.push("DrinkSizeSelectionPage.qml")
            }
        }

    }
    //8
    Rectangle{//the background circles
        id:leftButton
        width:281
        height:281
        radius:281/2
        color:"#c4c4c4"
        anchors{
            right:centerButton.left
            rightMargin:52
            verticalCenter:centerButton.verticalCenter
        }

        Image{
            anchors.centerIn: parent
            width:156
            height:156
            source:{
                if(systemController.drinkTemperature === SystemController.HOT)
                    return "qrc:/UI/Assets/icons8-coffee-beans-48.png"
                else if(systemController.drinkTemperature === SystemController.COLD)
                    return "qrc:/UI/Assets/icons8-cola-48.png"
            }

            //9
            //if the Text was outside the Image component, it would have been a circle with an image and below the circle a text, in this way the text is  inside the circle below the image
            Text{
                color:"#000000"
                font.pixelSize:28
                text:{
                    if(systemController.drinkTemperature === SystemController.HOT)
                        return "Coffee"
                    else if(systemController.drinkTemperature === SystemController.COLD)
                        return "Cola"
                }
                anchors{
                    horizontalCenter:parent.horizontalCenter
                    top:parent.bottom
                    topMargin: 10
                }

            }
        }

        //14
        MouseArea{
            anchors.fill:parent

            //to change the background color
            onPressed:{
                if(systemController.drinkTemperature === SystemController.HOT)
                    parent.color = "#b34d34"
                else if(systemController.drinkTemperature === SystemController.COLD)
                    parent.color = "#3190b5"
            }

            onReleased:{
                parent.color = "#c4c4c4"
            }

            //15 to change the QString
            onClicked:{
                if(systemController.drinkTemperature === SystemController.HOT)
                    systemController.setDrinkType("Coffee")
                else if(systemController.drinkTemperature === SystemController.COLD)
                    systemController.setDrinkType("Cola")

                stackView.push("DrinkSizeSelectionPage.qml")
            }
        }
    }
    //8
    Rectangle{//the background circles
        id:rightButton
        width:281
        height:281
        radius:281/2
        color:"#c4c4c4"
        anchors{
            left:centerButton.right
            leftMargin:52
            verticalCenter:centerButton.verticalCenter
        }
        Image{
            anchors.centerIn: parent
            width:156
            height:156
            source:"qrc:/UI/Assets/icons8-thirst-48.png"
            Text{
                color:"#000000"
                font.pixelSize:28

                anchors{
                    horizontalCenter:parent.horizontalCenter
                    top:parent.bottom
                    topMargin: 10
                }

                text:{
                    if(systemController.drinkTemperature === SystemController.HOT)
                        return "Hot Water"
                    else if(systemController.drinkTemperature === SystemController.COLD)
                        return "Cold Water"

                }


            }
        }

        //14
        MouseArea{
            anchors.fill:parent

            //to change the background color
            onPressed:{
                if(systemController.drinkTemperature === SystemController.HOT)
                    parent.color = "#b34d34"
                else if(systemController.drinkTemperature === SystemController.COLD)
                    parent.color = "#3190b5"
            }

            onReleased:{
                parent.color = "#c4c4c4"
            }

            //15 to change the QString
            onClicked:{
                if(systemController.drinkTemperature === SystemController.HOT)
                    systemController.setDrinkType("Hot Water")
                else if(systemController.drinkTemperature === SystemController.COLD)
                    systemController.setDrinkType("Cold Water")


            }
        }
    }


    //10 backbutton
    Image{
        id:backButton
        width:60
        height:60

        anchors{
            left:leftButton.left
            bottom:parent.bottom
            bottomMargin: 100
        }

        source:{
            if(systemController.drinkTemperature === SystemController.HOT)
                return "qrc:/UI/Assets/icons8-back-to-48 (1).png"
            else if(systemController.drinkTemperature === SystemController.COLD)
                return "qrc:/UI/Assets/icons8-back-to-48.png"
        }

        MouseArea{
            anchors.fill:parent

            onClicked: {
                //22
                systemController.setDrinkType("NONE")
                stackView.pop()
            }
        }
    }


    //11
    Text{
        id:backText
        font.pixelSize: 36
        text:"Back"
        anchors{
            top:backButton.bottom
            horizontalCenter: backButton.horizontalCenter
            topMargin: 10
        }

        color:{
            if(systemController.drinkTemperature === SystemController.HOT)
                return "#b34d34"
            else if(systemController.drinkTemperature === SystemController.COLD)
                return "#3190b5"
        }
    }


}
