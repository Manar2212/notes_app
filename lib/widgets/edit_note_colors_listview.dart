import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/colors_listView.dart';
class EditViewColorsListView extends StatefulWidget {
  const EditViewColorsListView({super.key,required this.note});
  final NoteModel note;
  @override
  State<EditViewColorsListView> createState() => _EditViewColorsListViewState();
}

class _EditViewColorsListViewState extends State<EditViewColorsListView> {
 late int  currentIndex ;
 @override
  void initState() {
    currentIndex = colors.indexOf(Color(widget.note.color));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38*2,
      child: ListView.separated(
        separatorBuilder: (context,index){
          return SizedBox(width: 10,);
        },
        itemBuilder: (context,index){
          return GestureDetector(
            onTap:(){
             currentIndex = index;
             widget.note.color = colors[index].value;
              setState(() {});
            },
            child: ColorItem(isSelected: currentIndex == index,color: colors[index],));
        },
        itemCount: 12,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}