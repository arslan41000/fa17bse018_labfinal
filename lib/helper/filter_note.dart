bool firstTime = true;
Note selectedNote;
int id;

@override
void didChangeDependencies() {
  super.didChangeDependencies();

  if (firstTime) {
    id = ModalRoute.of(this.context).settings.arguments;

    if (id != null) {
      selectedNote =
          Provider.of<NoteProvider>(this.context, listen: false).getNote(id);

      titleController.text = selectedNote?.title;
      contentController.text = selectedNote?.content;

      if (selectedNote?.imagePath != null) {
        _image = File(selectedNote.imagePath);

      }
    }

    firstTime = false;
  }
}
void saveNote() {
  String title = titleController.text.trim();
  String content = contentController.text.trim();
  String imagePath = _image != null ? _image.path : null;

  if (id != null) {
    Provider.of<NoteProvider>(this.context, listen: false)
        .addOrUpdateNote(id, title, content, imagePath, EditMode.UPDATE);
    Navigator.of(this.context).pop();
  } else {
    int id = DateTime.now().millisecondsSinceEpoch;
    Provider.of<NoteProvider>(this.context, listen: false)
        .addOrUpdateNote(id, title, content, imagePath, EditMode.ADD);
    Navigator.of(this.context)
        .pushReplacementNamed(NoteViewScreen.route, arguments: id);
  }