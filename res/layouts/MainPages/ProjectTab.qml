import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Window 2.21
import QtQuick.Dialogs

import dog.eden.coyote_labeler 1.0

Item
{
    Layout.fillWidth: true
    Layout.fillHeight: true

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
