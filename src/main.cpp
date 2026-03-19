#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QObject>

class Backend : public QObject {
    Q_OBJECT
public:
    Q_INVOKABLE QString greet(const QString &name) {
        return "Hello, " 
                + (name.size() ? name : "Unknown") 
                + " from C++!";
    }
};

int main(int argc, char *argv[]) {   
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    Backend backend;
    engine.rootContext()->setContextProperty("backend", &backend);

    using namespace Qt::StringLiterals;
    const QUrl url(u"qrc:/qml/main.qml"_s);
    
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    engine.load(url);
    return app.exec();
}

#include "main.moc"
