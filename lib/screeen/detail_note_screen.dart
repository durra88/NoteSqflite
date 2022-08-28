// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controller/note_controller.dart';
import '../model/note_model.dart';

class NoteDetails extends StatelessWidget {
  final Note note;
  final bool isNew;
  final int index;
  NoteDetails({
    Key? key,
    required this.note,
    required this.isNew,
    required this.index,
  }) : super(key: key);

  var noteController = Get.find<NoteController>();

  @override
  Widget build(BuildContext context) {
    // var x = 0;
    if (isNew == false) {
      noteController.txtName.text = noteController.noteModel[index].name ??= "";
      noteController.txtNote.text =
          noteController.noteModel[index].notes ??= "";
      noteController.txtDate.text = noteController.noteModel[index].date ??= "";
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(isNew ? 'insertNote'.tr : 'updateNote'.tr),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            NoteText('title'.tr, 'title'.tr, noteController.txtName, 20, 1),
            NoteText('description'.tr, 'description'.tr, noteController.txtNote,
                20, 14),
            NoteText('date'.tr, 'date'.tr, noteController.txtDate, 16, 1),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //  x++;
          noteController.noteModel[index].name = noteController.txtName.text;
          noteController.noteModel[index].notes = noteController.txtNote.text;
          noteController.noteModel[index].date = noteController.txtDate.text;
          noteController.noteModel[index].position = 0;
          if (isNew == true) {
            noteController.txtName.clear();
            noteController.txtNote.clear();
            noteController.txtDate.clear();
            noteController.insertNote(note);
          } else {
            noteController.updateNote(note);
          }
          Get.back();
        },
        tooltip: 'save',
        child: const Icon(Icons.save),
      ),
    );
  }
}

class NoteText extends StatelessWidget {
  final String description, lableText;

  final TextEditingController controller;

  final double textSize;
  final int maxline;

  const NoteText(this.description, this.lableText, this.controller,
      this.textSize, this.maxline);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: TextField(
        controller: controller,
        style: TextStyle(fontSize: textSize, fontWeight: FontWeight.w500),
        maxLines: maxline,
        decoration: InputDecoration(
            labelText: lableText,
            labelStyle: const TextStyle(
              fontSize: 16,
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            hintStyle:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            hintText: description),
      ),
    );
  }
}
