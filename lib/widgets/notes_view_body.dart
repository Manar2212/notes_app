import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/get_notes_cubit.dart';
import 'package:notes_app/views/search_notes_view.dart';
import 'package:notes_app/widgets/custome_appBar.dart';
import 'package:notes_app/widgets/notes_list_view.dart';
class CustomeNotesViewBody extends StatefulWidget {
  @override
  State<CustomeNotesViewBody> createState() => _CustomeNotesViewBodyState();
}

class _CustomeNotesViewBodyState extends State<CustomeNotesViewBody> {
  @override
  void initState() {
  BlocProvider.of<GetNotesCubit>(context).getAllNotes();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: 50,),
          CustomeAppBar(title: 'Notes',icon: Icons.search,
          onTap: (){
           Navigator.push(context, MaterialPageRoute(builder: (context){
                return  SearchNotesView();
              }));
          },
          ),
          SizedBox(height: 10,),
          Expanded(child: NotesListView()),
          SizedBox(height: 10)
        ],
      ),
    );
  }
}



