#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "CHighlighter.h"
#include "FileReader.h"
#include "FileUtils.h"


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    FileReader fileReader;
    FileUtils fileUtils;
    Searcher searcher;
    
    engine.rootContext()->setContextProperty("fileReader", &fileReader);
    engine.rootContext()->setContextProperty("fileUtils", &fileUtils);
    engine.rootContext()->setContextProperty("searcher", &searcher);

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
                     &app, []() { QCoreApplication::exit(-1); },
                     Qt::QueuedConnection);
    engine.loadFromModule("src", "Main");

    return app.exec();
}
