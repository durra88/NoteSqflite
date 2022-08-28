import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../model/note_model.dart';
import '../sqlite_helper/sql_helpper.dart';

class NoteController extends GetxController {
  var noteModel = <Note>[].obs;
  SqlHelper helper = SqlHelper();
  final TextEditingController txtName = TextEditingController();
  final TextEditingController txtNote = TextEditingController();
  final TextEditingController txtDate = TextEditingController();

  @override
  void onInit() {
    getNotes();
    super.onInit();
  }

  Future getNotes() async {
    var notes = await helper.getNotesFromDb();
    print("notes&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&$notes");
    noteModel.value = Note.toListOfModel(notes);
    // print("note model&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&${json.decode(noteModel).toString()}");
    //Note.toListOfModel(notes)  ;
    return noteModel;
  }

  Future<int> deleteNote(Note note) async {
    int id = await helper.deleteNoteFromDb(note);
    return id;
  }

  Future<int> insertNote(Note note) async {
    int id = await helper.insertNoteIntoDb(note);
    return id;
  }

  Future<int> updateNote(Note note) async {
    int id = await helper.updateNoteIntoDb(note);
    return id;
  }
  

 
}
