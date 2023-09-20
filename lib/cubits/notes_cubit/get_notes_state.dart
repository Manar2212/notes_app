part of 'get_notes_cubit.dart';

@immutable
sealed class GetNotesState {}

final class GetNotesInitial extends GetNotesState {}
final class GetNotesLoadingState extends GetNotesState{}
final class GetNotesSuccessState extends GetNotesState{}
final class GetNotesFailureState extends GetNotesState{
  String? errMessage;
  GetNotesFailureState({this.errMessage});
}
final class getFilteredNotesSuccessState extends GetNotesState{}
