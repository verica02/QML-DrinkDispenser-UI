#include "systemcontroller.h"
#include <QDebug>
//3
//4

//default constructor
SystemController::SystemController(QObject *parent)
    : QObject(parent), m_drinkTemperature(NONE),m_drinkType("NONE"), m_drinkSize(NOSIZE)//4 the enum variable from private//13 the Qstring variable//22 the enum for size
{

}

//29
void SystemController::startOrder()
{

qDebug() << "Drink temp: " << (m_drinkTemperature == HOT ? "Hot" : "Cold");
qDebug() << "Drink type: " << m_drinkType;

QString debugOutputDrinkSize;

switch(m_drinkSize)
{
case SMALL:
    debugOutputDrinkSize = "Small";
    break;
 case MEDIUM:
    debugOutputDrinkSize = "Medium";
    break;
 case LARGE:
    debugOutputDrinkSize = "Large";
    break;
 case NOSIZE:
    debugOutputDrinkSize = "No Size";
    break;

}

qDebug() << "Drink size: " << debugOutputDrinkSize;

}

//3 refractored getter
SystemController::DrinkTemperatureType SystemController::drinkTemperature() const
{
    return m_drinkTemperature;
}

//3 refractored setter
void SystemController::setDrinkTemperature(DrinkTemperatureType newDrinkTemperature)
{
    if (m_drinkTemperature == newDrinkTemperature)
        return;
    m_drinkTemperature = newDrinkTemperature;
    emit drinkTemperatureChanged();
}

//12 refractored getter
const QString &SystemController::drinkType() const
{
    return m_drinkType;
}

//12 refractored setter
void SystemController::setDrinkType(const QString &newDrinkType)
{
    if (m_drinkType == newDrinkType)
        return;
    m_drinkType = newDrinkType;
    emit drinkTypeChanged();
}

//21 refractor getter
SystemController::DrinkSize SystemController::drinkSize() const
{
    return m_drinkSize;
}

//21 refractor setter
void SystemController::setDrinkSize(DrinkSize newDrinkSize)
{
    if (m_drinkSize == newDrinkSize)
        return;
    m_drinkSize = newDrinkSize;
    emit drinkSizeChanged();
}
