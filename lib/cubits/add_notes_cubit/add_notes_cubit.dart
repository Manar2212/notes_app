import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';
part 'add_notes_state.dart';

class AddNotesCubit extends Cubit<AddNotesState> {
  AddNotesCubit() : super(AddNotesInitial());

  Color color = Color(0xffE3D7FF);
  addNote(NoteModel note)async{
    note.color = color.value;
    emit(AddNotesLoadingState());
    try{
      var notesBox = Hive.box<NoteModel>(NotesBox);
      await notesBox.add(note);
      emit(AddNotesSuccessState());
    }catch(e){
      emit(AddNotesFailureState(e.toString()));
    }
  }
}
