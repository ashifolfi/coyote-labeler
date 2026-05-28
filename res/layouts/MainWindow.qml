import QtQuick
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Dialogs
import QtQuick.Layouts

import dog.eden.coyote_labeler 1.0
import "MainPages"

ApplicationWindow {
    id: root
    width: 1280
    height: 800
    title: qsTr("Coyote Labeler")
    visible: true
    color: palette.window

    property MainWindow mainWindow: MainWindow
    {

    }

    property alias projectOpenDialog: projectOpenDialog

    MessageDialog
    {
        id: projectOpenFailMessage
        buttons: MessageDialog.Ok
        text: qsTr("Failed to load project file. Data might be corrupt.")
    }

    MessageDialog
    {
        id: unsavedChangesMessage
        buttons: MessageDialog.Save | MessageDialog.Discard | MessageDialog.Cancel
        text: qsTr("This project has been modified.\nDo you want to save your changes?")

        onButtonClicked: function(button, role)
        {
            switch(button)
            {
                case MessageDialog.Save:
                    // TODO: save the document here
                case MessageDialog.Discard:
                    Qt.quit()
                    break;
                case MessageDialog.Cancel:
                    break;
            }
        }
    }

    FileDialog
    {
        id: projectOpenDialog
        onAccepted:
        {
            if (mainWindow.loadProject(selectedFile))
            {
                // TODO: Change ui state and enter label editing mode stuff
            }
            else
            {
                projectOpenFailMessage.open()
            }
        }
        nameFilters: ["Project files (*.clp)"]
    }

    menuBar: MenuBar
    {
        Menu
        {
            title: qsTr("&File")
            Action { text: qsTr("New Project") }
            Action
            {
                text: qsTr("Open Project")
                onTriggered:
                {
                    projectOpenDialog.open()
                }
            }
            Action { text: qsTr("Save Project") }
            Action { text: qsTr("Close Project") }
            MenuSeparator { }
            Action
            {
                text: qsTr("&Quit")
                onTriggered: unsavedChangesMessage.open()
            }
        }
        Menu
        {
            title: qsTr("&Help")
            Action { text: qsTr("View Documentation") }
            Action { text: qsTr("About Coyote Labeler") }
        }
    }

    ColumnLayout
    {
        anchors.fill: parent

        TabBar
        {
            id: projectTabs
            Layout.preferredWidth: parent.width

            TabButton
            {
                height: 30
                text: qsTr("Home")
            }

            TabButton
            {
                height: 30
                text: qsTr("Test Project")
            }
        }

        StackLayout
        {
            Layout.preferredWidth: parent.width
            Layout.fillHeight: true
            currentIndex: projectTabs.currentIndex

            HomeTab { }
            ProjectTab { }
        }
    }
}
