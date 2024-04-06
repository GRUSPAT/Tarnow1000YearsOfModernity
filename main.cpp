#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QVariant>
#include <QGeoRoute>
#include <QtQml>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterSingletonType(QUrl("qrc:///components/Style.qml"), "App",1,0,"Style");

    QQmlApplicationEngine engine;

    qputenv("QML_XHR_ALLOW_FILE_READ", QString("1").toUtf8());

    const QUrl url(u"qrc:/Tarnow1000YearsOfModernity/Main.qml"_qs);
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
