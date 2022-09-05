import QtQuick 2.15
import Package 1.0

Rectangle{

    //28 instead of hardware
    Timer{
        id:finishedTimer
        interval:1500
        running:false

        onTriggered: {
            systemController.setDrinkSize(SystemController.NOSIZE)
            systemController.setDrinkType("NONE")
            systemController.setDrinkTemperature(SystemController.NONE)
           //30
            stackView.pop(null)//will bring the stackview to the initial state
        }
    }

    Component.onCompleted: finishedTimer.start()

    id:dispensingBackground
    anchors.fill:parent
    color:{
        if(systemController.drinkTemperature === SystemController.HOT)
            return "#f59d8e"
        else if(systemController.drinkTemperature === SystemController.COLD)
            return "#8eeef5"
    }

    Image{
        id:finishImage
        width:256
        height:256
        anchors.centerIn: parent
        source:{
            if(systemController.drinkTemperature === SystemController.HOT)
                return "qrc:/UI/Assets/icons8-ok-64.png"
            else if(systemController.drinkTemperature === SystemController.COLD)
                return "qrc:/UI/Assets/icons8-ok-64 (1).png"
        }
    }


    Text{
        anchors{
            horizontalCenter: parent.horizontalCenter
            top:finishImage.bottom
            topMargin:20
        }

        font.pixelSize:96
        color:{
            if(systemController.drinkTemperature === SystemController.HOT)
                return "#ed795c"
            else if(systemController.drinkTemperature === SystemController.COLD)
                return "#3190b5"
        }

        text:"Enjoy!"
    }
}
