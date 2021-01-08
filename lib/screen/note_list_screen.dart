import 'package:flutter/cupertino.dart';
import 'package:notes_taking_app/models/note.dart';
import 'package:notes_taking_app/utils/constants.dart';
import 'database_helper.dart';

class NoteProvider with ChangeNotifier{

  List _items = [];
  List get items {
    return [..._items];
  }
  Future addOrUpdateNote(int id, String title, String content,
      String imagePath, EditMode editMode) async {
    final note = Note(id, title, content, imagePath);
    if (EditMode.ADD == editMode) {
      _items.insert(0, note);
    } else {
      _items[_items.indexWhere((note) => note.id == id)] = note;
    }
    notifyListeners();
    DatabaseHelper.insert(
      {
        'id': note.id,
        'title': note.title,
        'content': note.content,
        'imagePath': note.imagePath,
      },
    );
  }


}