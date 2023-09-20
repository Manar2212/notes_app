part of 'add_notes_cubit.dart';

@immutable
sealed class AddNotesState {}

class AddNotesInitial extends AddNotesState {}
class AddNotesLoadingState extends AddNotesState {}
class AddNotesSuccessState extends AddNotesState {}
class AddNotesFailureState extends AddNotesState {
  final String errMessage;
  AddNotesFailureState(this.errMessage);
}


