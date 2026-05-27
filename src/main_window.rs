#[cxx_qt::bridge]
pub mod qobject
{
    unsafe extern "C++"
    {
        include!("cxx-qt-lib/qstring.h");
        type QString = cxx_qt_lib::QString;
    }

    extern "RustQt"
    {
        #[qobject]
        #[qml_element]
        #[qproperty(QString, current_project_path)]
        #[qproperty(bool, is_project_modified)]
        #[namespace = "CoyoteLabeler"]
        type MainWindow = super::MainWindowRust;

        #[qinvokable]
        #[cxx_name = "loadProject"]
        fn load_project(self: Pin<&mut Self>, project_path: &QString) -> bool;
    }
}

use core::pin::Pin;
use cxx_qt_lib::QString;

use crate::data;

#[derive(Default)]
pub struct MainWindowRust
{
    current_project_path: QString,
    is_project_modified: bool,
    project_data: data::project::ProjectFile
}

impl qobject::MainWindow
{
    fn load_project(self: Pin<&mut Self>, project_path: &QString) -> bool
    {
        println!("Loading project at path: {project_path}");

        self.set_current_project_path(project_path.clone());
        // TODO: probably using QFile would be better here?
        let trimmed_path = project_path.to_string().trim_start_matches("file://");

        if let Ok(project_data) = serde_json5::from_str::<data::project::ProjectFile>("")
        {
            // TODO: store project_data within MainWindow
            return true;
        }
        else
        {
            println!("Unable to load project data!");
            // TODO: fire out a signal to the main application to throw up a dialog saying we couldn't load the project
            return false;
        }
    }
}

