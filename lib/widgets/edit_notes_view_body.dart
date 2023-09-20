import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/get_notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custome_appBar.dart';
import 'package:notes_app/widgets/custome_textfield.dart';
import 'package:notes_app/widgets/edit_note_colors_listview.dart';
import 'package:notes_app/widgets/show_toast.dart';


class CustomeEditNotesViewBody extends StatelessWidget {
 CustomeEditNotesViewBody({super.key,required this.note});
 NoteModel note;
final titleController = TextEditingController();
final subtitleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    titleController.text = note.title;
    subtitleController.text = note.subtitle;
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 50,),
            CustomeAppBar(title: 'Edit Note', 
            icon: Icons.check,onTap: () {
              note.title = titleController.text;
              note.subtitle = subtitleController.text;
              note.save();
              BlocProvider.of<GetNotesCubit>(context).getAllNotes();
              Navigator.pop(context);
              ShowToast.showToastMessage(message: 'Note Updated Successfully');
            },),
            SizedBox(height: 16),
            CustomeTextField(
            controller:titleController,
            ),
            SizedBox(height: 16),
            CustomeTextField(maxLines: 5,
            controller: subtitleController,
            ),
            SizedBox(height: 16),
            EditViewColorsListView(note: note),
          ],
        ),
      );
  }
}

