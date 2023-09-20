import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/edit_notes_view_body.dart';


class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key,required this.note});
final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  CustomeEditNotesViewBody(note: note),
    );
  }
}