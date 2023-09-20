
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_notes_cubit/add_notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/colors_listView.dart';
import 'package:notes_app/widgets/custome_button.dart';
import 'package:notes_app/widgets/custome_textfield.dart';
import 'package:intl/intl.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {

String? title,subtitle;

GlobalKey<FormState> formkey = GlobalKey();
AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      autovalidateMode: autovalidateMode,
      child: Column(
            children: [
              const SizedBox(height: 20),
              CustomeTextField(hint: 'Title',
              onSaved: (value) {
                title = value;
              },
              ),
              const SizedBox(height: 16),
              CustomeTextField(hint: 'Content',maxLines: 5,
              onSaved: (value){
                subtitle = value;
              },
              ),
              const SizedBox(height: 16,),
              ColorsListView(),
              const SizedBox(height: 16,),
              BlocBuilder<AddNotesCubit,AddNotesState>(
                builder:(context,state){
                  return Padding(
                    padding: const EdgeInsets.only(bottom:20),
                    child: CustomeButton(
                    isLoading: state is AddNotesLoadingState ? true : false,
                    onTap: (){
                      if(formkey.currentState!.validate()){
                        formkey.currentState!.save();
                        var noteModel = NoteModel(
                          title:title!,
                          subtitle :subtitle!,
                          date : DateFormat('MMM dd, yyyy').format(DateTime.now()),
                          color:BlocProvider.of<AddNotesCubit>(context).color.value,
                        );
                        BlocProvider.of<AddNotesCubit>(context).addNote(noteModel);
                      }else{
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {
                          
                        });
                      }
                    },
                                  ),
                  );
                } 
              ),
            ],
          ),
    );
  }
}

