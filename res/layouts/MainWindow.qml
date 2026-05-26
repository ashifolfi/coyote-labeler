import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Window 2.21

ApplicationWindow {
    id: root
    width: 1280
    height: 800
    title: qsTr("Coyote Labeler")
    visible: true
    color: palette.window

    menuBar: MenuBar
    {
        Menu
        {
            title: qsTr("&File")
            Action { text: qsTr("New Project") }
            Action { text: qsTr("Open Project") }
            Action { text: qsTr("Save Project") }
            Action { text: qsTr("Close Project") }
            MenuSeparator { }
            Action { text: qsTr("&Quit") }
        }
        Menu
        {
            title: qsTr("&Help")
            Action { text: qsTr("View Documentation") }
            Action { text: qsTr("About Coyote Labeler") }
        }
    }

    SplitView
    {
        anchors.fill: parent

        ScrollView
        {
            id: fileView
            height: parent.height

            ScrollBar.horizontal.policy: ScrollBar.AlwaysOn

            Column {
                Label {
                    text: "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"
                    font.pixelSize: 200
                }
            }
        }

        ScrollView
        {
            id: fileList
            height: parent.height
            SplitView.minimumWidth: 200

            ScrollBar.vertical.policy: ScrollBar.AlwaysOn

            Column
            {
                width: fileList.width
                Button
                {
                    width: fileList.width
                    text: "File List Test Button"
                }
            }
        }
    }
}
