import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/get_notes_cubit.dart';
import 'package:notes_app/widgets/custome_textfield.dart';
import 'package:notes_app/widgets/search_notes_list_view.dart';

class SearchNoteViewBody extends StatefulWidget {
  const SearchNoteViewBody({super.key});

  @override
  State<SearchNoteViewBody> createState() => _SearchNoteViewBodyState();
}

class _SearchNoteViewBodyState extends State<SearchNoteViewBody> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 50,),
          CustomeTextField(
            hint: 'Search',
            onChanged: (value){
              BlocProvider.of<GetNotesCubit>(context).getFilteredNotes(input: value);
            },
          ),
          const SizedBox(height: 10,),
          Expanded(child: SearchNotesListView()),
          const SizedBox(height: 10,),
        ],
      ),
    );
  }
}



