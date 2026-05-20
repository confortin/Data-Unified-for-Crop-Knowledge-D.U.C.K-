#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    // Conexão para fechar o app caso o QML falhe ao carregar
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
                     &app, []() { QCoreApplication::exit(-1); },
                     Qt::QueuedConnection);

#ifdef QT_DEBUG
    // Caminho corrigido apontando para a subpasta correta do projeto
    const QUrl url(QStringLiteral("file:///home/confortin/Área de trabalho/D.U.C.K/D.U.C.K/Main.qml"));
#else
    // Em modo de produção, usa o recurso embutido compilado no executável
    const QUrl url(QStringLiteral("qrc:/qt/qml/farmer_Duck/Main.qml"));
#endif

    engine.load(url);

    return QGuiApplication::exec();
}