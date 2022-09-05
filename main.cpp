#include <QGuiApplication>
#include <QQmlApplicationEngine>

//26
#include <QQuickStyle>

//5
#include "Controllers/systemcontroller.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);


    //5 export class as package to be used in qml as component
    qmlRegisterType< SystemController >("Package", 1, 0, "SystemController");//<> is the class, "" does not have to be the same name

    //26 for DispensingScreen.qml
    QQuickStyle:: setStyle("Material");


    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/UI/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
