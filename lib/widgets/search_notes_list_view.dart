import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/get_notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/noteItem.dart';


class SearchNotesListView extends StatelessWidget {
  const SearchNotesListView({super.key});

  @override
  Widget build(BuildContext context) {
     return BlocBuilder<GetNotesCubit, GetNotesState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<GetNotesCubit>(context);
        List<NoteModel> notes = cubit.notes;
        return notes.isEmpty ?  Center(
        child:Text('You don\'t have any notes yet'),
        ) :
        ListView.separated(
          itemBuilder: ((context, index) {
            return NoteItem(note: cubit.filteredNotes.isEmpty ?
            notes[index] : cubit.filteredNotes[index]);
          }),
          itemCount: cubit.filteredNotes.isEmpty ?  cubit.notes.length : cubit.filteredNotes.length,
          separatorBuilder: ((context, index) {
            return const SizedBox(height: 10);
          }),
        );
      },
    );
  }
}