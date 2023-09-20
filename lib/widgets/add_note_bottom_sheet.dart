import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_notes_cubit/add_notes_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/get_notes_cubit.dart';
import 'package:notes_app/widgets/add_note_form.dart';
import 'package:notes_app/widgets/show_toast.dart';


class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNotesCubit(),
      child: BlocConsumer<AddNotesCubit, AddNotesState>(
        listener: (context, state) {
          if(state is AddNotesSuccessState){
            BlocProvider.of<GetNotesCubit>(context).getAllNotes();
            Navigator.pop(context);
            ShowToast.showToastMessage(message: 'Note added successfully');
          }else if(state is AddNotesFailureState){
            ShowToast.showToastMessage(message: '${state.errMessage}');
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNotesLoadingState ? true : false,
            child: Padding(
              padding:  EdgeInsets.only(left: 20,right: 20,
              bottom: MediaQuery.of(context).viewInsets.bottom, 
              ),
              child: const SingleChildScrollView(
                child: AddNoteForm(),
              ),
            ),
          );
        },
      ),
    );
  }
}
