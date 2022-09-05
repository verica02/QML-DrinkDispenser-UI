import QtQuick 2.15
import Package 1.0

//15
Rectangle{
    id:drinkSelectionBackground
    anchors.fill:parent
    color:{
        if(systemController.drinkTemperature === SystemController.HOT)
            return "#f59d8e"
        else if(systemController.drinkTemperature === SystemController.COLD)
            return "#8eeef5"
    }

    Rectangle{//the background circles
        id:centerButton
        width:281
        height:281
        radius:281/2
        //22
        color:{
            if((systemController.drinkTemperature === SystemController.HOT) && (systemController.drinkSize === SystemController.MEDIUM))
                return "#ed795c"
            else if((systemController.drinkTemperature === SystemController.COLD) && (systemController.drinkSize === SystemController.MEDIUM))
                return "#3190b5"
            else
                return "#c4c4c4"

        }

        anchors.centerIn: parent
        Image{
            anchors.centerIn: parent
            width:110
            height:110

            source:{
                if(systemController.drinkTemperature === SystemController.HOT)
                    return "qrc:/UI/Assets/icons8-coffee-to-go-48.png"
                else if(systemController.drinkTemperature === SystemController.COLD)
                    return "qrc:/UI/Assets/icons8-soda-48.png"
            }

            //16
            Text{
                color:"#000000"
                font.pixelSize:28
                text: "8oz"
                anchors{
                    horizontalCenter:parent.horizontalCenter
                    top:parent.bottom
                    topMargin: 10
                }

            }
        }

        //17
        MouseArea{
            anchors.fill:parent
            onClicked:systemController.setDrinkSize(SystemController.MEDIUM)
        }

    }

    //16
    Rectangle{//the background circles
        id:leftButton
        width:281
        height:281
        radius:281/2
        //22
        color:{
            if((systemController.drinkTemperature === SystemController.HOT) && (systemController.drinkSize === SystemController.SMALL))
                return "#ed795c"
            else if((systemController.drinkTemperature === SystemController.COLD) && (systemController.drinkSize === SystemController.SMALL))
                return "#3190b5"
            else
                return "#c4c4c4"

        }
        anchors{
            right:centerButton.left
            rightMargin:52
            verticalCenter:centerButton.verticalCenter
        }

        Image{
            anchors.centerIn: parent
            width:75
            height:75
            source:{
                if(systemController.drinkTemperature === SystemController.HOT)
                    return "qrc:/UI/Assets/icons8-coffee-to-go-48.png"
                else if(systemController.drinkTemperature === SystemController.COLD)
                    return "qrc:/UI/Assets/icons8-soda-48.png"
            }
            //16
            //if the Text was outside the Image component, it would have been a circle with an image and below the circle a text, in this way the text is  inside the circle below the image
            Text{
                color:"#000000"
                font.pixelSize:28
                text: "6oz"
                anchors{
                    horizontalCenter:parent.horizontalCenter
                    top:parent.bottom
                    topMargin: 10
                }

            }
        }

        //17
        MouseArea{
            anchors.fill:parent
            onClicked:systemController.setDrinkSize(SystemController.SMALL)
        }
    }

    //16
    Rectangle{//the background circles
        id:rightButton
        width:281
        height:281
        radius:281/2
        //22
        color:{
            if((systemController.drinkTemperature === SystemController.HOT) && (systemController.drinkSize === SystemController.LARGE))
                return "#ed795c"
            else if((systemController.drinkTemperature === SystemController.COLD) && (systemController.drinkSize === SystemController.LARGE))
                return "#3190b5"
            else
                return "#c4c4c4"

        }
        anchors{
            left:centerButton.right
            leftMargin:52
            verticalCenter:centerButton.verticalCenter
        }
        Image{
            anchors.centerIn: parent
            width:156
            height:156
            source:{
                if(systemController.drinkTemperature === SystemController.HOT)
                    return "qrc:/UI/Assets/icons8-coffee-to-go-48.png"
                else if(systemController.drinkTemperature === SystemController.COLD)
                    return "qrc:/UI/Assets/icons8-soda-48.png"
            }
            Text{
                color:"#000000"
                font.pixelSize:28

                anchors{
                    horizontalCenter:parent.horizontalCenter
                    top:parent.bottom
                    topMargin: 10
                }
                text:"12oz"
            }
        }

        //17
        MouseArea{
            anchors.fill:parent
            onClicked:systemController.setDrinkSize(SystemController.LARGE)

        }
    }


    //19 backbutton
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

            onClicked:{
                //23
                systemController.setDrinkSize(SystemController.NOSIZE)
                stackView.pop()
            }
        }
    }


    //20
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


    //24 start over button
    Image{
        id:startOverButton
        width:60
        height:60

        anchors{
            //            right:rightButton.right
            //            bottom:parent.bottom
            horizontalCenter:startOverText.horizontalCenter
            bottom:startOverText.top
            bottomMargin: 10
        }

        source:{
            if(systemController.drinkTemperature === SystemController.HOT)
                return "qrc:/UI/Assets/icons8-reset-50.png"
            else if(systemController.drinkTemperature === SystemController.COLD)
                return "qrc:/UI/Assets/icons8-reset-50 (1).png"
        }

        MouseArea{
            anchors.fill:parent

            onClicked:{
                //23
                systemController.setDrinkSize(SystemController.NOSIZE)
                systemController.setDrinkType("NONE")
                systemController.setDrinkTemperature(SystemController.NONE)
                stackView.pop(null)//to the first page
            }
        }
    }


    //20
    Text{
        id:startOverText
        font.pixelSize: 36
        text:"Start Over"
        anchors{
            //            top:startOverButton.bottom
            //            horizontalCenter: backButton.horizontalCenter
            top:backText.top
            right:rightButton.right
            topMargin: 10
        }

        color:{
            if(systemController.drinkTemperature === SystemController.HOT)
                return "#b34d34"
            else if(systemController.drinkTemperature === SystemController.COLD)
                return "#3190b5"
        }
    }


    //25 Start Button
    Rectangle{
        id:startButton
        width:125
        height:125
        radius:125/2
        color:{
            if(systemController.drinkTemperature === SystemController.HOT)
                return "#b34d34"
            else if(systemController.drinkTemperature === SystemController.COLD)
                return "#3190b5"
        }

        anchors{
            horizontalCenter: parent.horizontalCenter
            verticalCenter: backButton.verticalCenter
        }

        Text{
           anchors.centerIn: parent
           font.pixelSize: 36
           color:drinkSelectionBackground.color
           text:"Start"
        }

        MouseArea{
            anchors.fill:parent
            onClicked:stackView.push("DispensingScreen.qml")
        }
    }

}

