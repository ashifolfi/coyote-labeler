use cxx_qt_build::{CxxQtBuilder, QmlModule};

fn main() {
    CxxQtBuilder::new_qml_module(QmlModule::new("dog.eden.coyote_labeler")
        .qml_files([
            "res/layouts/MainWindow.qml",
            "res/layouts/MainPages/HomeTab.qml",
            "res/layouts/MainPages/ProjectTab.qml"
        ])
    )
    // Link Qt's Network library
    // - Qt Core is always linked
    // - Qt Gui is linked by enabling the qt_gui Cargo feature of cxx-qt-lib.
    // - Qt Qml is linked by enabling the qt_qml Cargo feature of cxx-qt-lib.
    // - Qt Qml requires linking Qt Network on macOS
    .qt_module("Network")
    .files(["src/main_window.rs"])
    .build();
}
