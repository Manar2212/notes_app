import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/get_notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/noteItem.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetNotesCubit, GetNotesState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<GetNotesCubit>(context).notes?? [];
        return ListView.separated(
          itemBuilder: ((context, index) {
            return NoteItem(note: notes[index],);
          }),
          itemCount: notes.length,
          separatorBuilder: ((context, index) {
            return SizedBox(height: 10);
          }),
        );
      },
    );
  }
}
