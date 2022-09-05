#ifndef SYSTEMCONTROLLER_H
#define SYSTEMCONTROLLER_H

#include <QObject>

//1
//2
//3

class SystemController : public QObject
{
    Q_OBJECT

    //2 to be able to read the hot&cold status, keep track of the temperature
    Q_PROPERTY(DrinkTemperatureType drinkTemperature READ drinkTemperature WRITE setDrinkTemperature NOTIFY drinkTemperatureChanged)

    //12 to keep track of the drink type
    Q_PROPERTY(QString drinkType READ drinkType WRITE setDrinkType NOTIFY drinkTypeChanged)

    //21
    Q_PROPERTY(DrinkSize drinkSize READ drinkSize WRITE setDrinkSize NOTIFY drinkSizeChanged)


public:
    explicit SystemController(QObject *parent = nullptr);

    //1
    enum DrinkTemperatureType{
        NONE,
        HOT,
        COLD
    };
    //macro
    Q_ENUM(DrinkTemperatureType)


    //21
    enum DrinkSize{
        NOSIZE,
        SMALL,
        MEDIUM,
        LARGE
    };

    //21 expose it with macro
    Q_ENUM(DrinkSize)


    //29 invokable so this function can be accessed in qml
    Q_INVOKABLE void startOrder();



public slots://4 add public slots: above getter and setter
    DrinkTemperatureType drinkTemperature() const;
    void setDrinkTemperature(DrinkTemperatureType newDrinkTemperature);

    //12 getter and setter
    const QString &drinkType() const;
    void setDrinkType(const QString &newDrinkType);

    //21
    DrinkSize drinkSize() const;
    void setDrinkSize(DrinkSize newDrinkSize);

    //3 refractored getter and setter
signals:
    //3 refractored signal
    void drinkTemperatureChanged();

    //12 refractored signal
    void drinkTypeChanged();

    //2 add private:, then refractor the property
    void drinkSizeChanged();

private:

    //3 refractored variable of the enum type
    DrinkTemperatureType m_drinkTemperature;

    //12 refractored var
    QString m_drinkType;
    //21
    DrinkSize m_drinkSize;
};

#endif // SYSTEMCONTROLLER_H
