import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'get_notes_state.dart';

class GetNotesCubit extends Cubit<GetNotesState> {
  GetNotesCubit() : super(GetNotesInitial());

List<NoteModel> notes = [];
  getAllNotes()async{
    try{
      var notesBox = Hive.box<NoteModel>(NotesBox);
      notes = notesBox.values.toList();
      emit(GetNotesSuccessState());
    }catch(e){
      emit(GetNotesFailureState(errMessage: e.toString()));
    }
  }

  List<NoteModel> filteredNotes = [];
  getFilteredNotes({required String input}){
    filteredNotes = notes.where((element) => element.title.toLowerCase().startsWith(input.toLowerCase())).toList();
    emit(getFilteredNotesSuccessState());
  }
}
