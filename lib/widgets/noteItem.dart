import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/get_notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';
import 'package:notes_app/widgets/show_toast.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key,required this.note});
final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Dismissible(
          key: Key('note ${note.title}'),
          background:  backgroundToast(),
          onDismissed: (DismissDirection direction) {
                  if (direction == DismissDirection.startToEnd) {
                    note.delete();
                    BlocProvider.of<GetNotesCubit>(context).getAllNotes();
                    ShowToast.showToastMessage(message: 'Note deleted successfully');
                  } 
          },
          child: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return  EditNoteView(note: note);
              }));
            },
            child: Container(
              padding: EdgeInsets.only(top: 20,bottom: 20,left: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                color: Color(note.color),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Text('${note.title}',style: TextStyle(fontSize: 24,color: Colors.black),),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Text('${note.subtitle}',style: TextStyle(fontSize: 17,color: Colors.black.withOpacity(0.4)),),
                    ),
                    // trailing: IconButton(
                    //   onPressed: (){
                    //     note.delete();
                    //     BlocProvider.of<GetNotesCubit>(context).getAllNotes();
                    //   },
                    //   icon:Icon(FontAwesomeIcons.trash,color: Colors.black,size: 20,) ,
                    // ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 29),
                    child: Text('${note.date}',style: TextStyle(fontSize: 15,color: Colors.black.withOpacity(0.4)),),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Widget backgroundToast (){
  return Container(
  color: Colors.red,
  child: const Padding(
  padding:  EdgeInsets.all(15),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: <Widget>[
        Icon(Icons.delete, color: Colors.white),
        Text('Move to trash', style: TextStyle(color: Colors.white)),
      ],
    ),
  ),
);
}