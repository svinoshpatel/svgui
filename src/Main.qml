import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Dialogs

ApplicationWindow {
    property string currentFileName: "[scratch]"
    property string lastSavedText: ""
    
    visible: true
    width: 640
    height: 480
    title: qsTr("svgui")

    header: ToolBar {
        RowLayout {
            spacing: 1
            ToolButton {
                text: qsTr("Open")
                onClicked: fileDialog.open()
            }
            ToolButton {
                text: qsTr("Save")
                onClicked: {
                    fileReader.writeFile(fileDialog.selectedFile, textEdit.text)
                    lastSavedText = textEdit.text
                    footerName.text = currentFileName
                }
            }
            ToolButton {
                text: qsTr("Save as")
                onClicked: saveAsDialog.open()
            }
            ToolButton {
                text: qsTr("About")
                onClicked: aboutMessage.open()
            }
        }
    }
    ScrollView {
        anchors.fill: parent
        ScrollBar.horizontal.policy: ScrollBar.AsNeeded

        TextEdit {
            id: textEdit
            anchors.fill: parent
            font.pointSize: 12;
            wrapMode: TextEdit.Wrap
            focus: true
            Component.onCompleted: {
                cHighlighter.setDocument(textEdit.textDocument)
            }
            onTextChanged: {
                if (textEdit.text !== lastSavedText) {
                    footerName.text = currentFileName + " [+]"
                } else {
                    footerName.text = currentFileName
                }
            }
        }
    }

    footer: ToolBar {
        RowLayout {
            spacing: 10

            Text {
                id: footerName
                text: currentFileName
            }

            Item {
                Layout.preferredWidth: textField.implicitWidth + button.implicitWidth + 1
                Layout.preferredHeight: Math.max(textField.implicitHeight, button.implicitHeight)

                Row {
                    spacing: 1

                    TextField {
                        id: searchInput
                    }

                    Button {
                        id: searchButton
                        text: ""
                        font.family: "JetBrainsMonoNerdFont"
                    }
                }
            }
        }
    }

    MessageDialog {
        id: aboutMessage
        title: "About SVGUI"
        text: "SVGUI is a simple text editor"
        buttons: aboutMessage.Close
    }

    FileDialog {
        id: fileDialog
        onAccepted: {
            var content = fileReader.readFile(selectedFile)
            textEdit.text = content
            lastSavedText = content
            currentFileName = fileUtils.getFileName(fileDialog.selectedFile)
            footerName.text = currentFileName            
        }
    }

    FileDialog {
        id: saveAsDialog
        fileMode: FileDialog.SaveFile
        onAccepted: {
            fileReader.writeFile(saveAsDialog.selectedFile, textEdit.text)
            currentFileName = fileUtils.getFileName(saveAsDialog.selectedFile)
            lastSavedText = textEdit.text
            footerName.text = currentFileName
        }
    }
}


