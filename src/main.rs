use cxx_qt::casting::Upcast;
use cxx_qt_lib::{QGuiApplication, QQmlApplicationEngine, QQmlEngine, QQuickStyle, QUrl, QString};
use std::pin::Pin;

pub mod main_window;
mod data;

fn main()
{
    let mut app = QGuiApplication::new();
    let mut engine = QQmlApplicationEngine::new();

    let style_name: QString = QString::from("Fusion");
    QQuickStyle::set_style(&style_name);

    if let Some(engine) = engine.as_mut()
    {
        engine.load(&QUrl::from("qrc:/qt/qml/dog/eden/coyote_labeler/res/layouts/MainWindow.qml"));
    }

    if let Some(engine) = engine.as_mut()
    {
        let engine: Pin<&mut QQmlEngine> = engine.upcast_pin();
        engine.on_quit(|_|
        {
            println!("Closing application!");
        })
        .release();
    }

    if let Some(app) = app.as_mut()
    {
        app.exec();
    }
}
