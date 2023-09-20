import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/add_notes_cubit/add_notes_cubit.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isSelected,required this.color});
final bool isSelected;
final Color color;
  @override
  Widget build(BuildContext context) {
    return  isSelected ? 
    CircleAvatar(
      radius: 38,
      backgroundColor: Colors.white,
      child:CircleAvatar(radius: 33,backgroundColor: color,) ,
    )
    : CircleAvatar(radius: 38,backgroundColor: color,);
  }
}

class ColorsListView extends StatefulWidget {
   ColorsListView({super.key});

  

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentIndex = 0;
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
              BlocProvider.of<AddNotesCubit>(context).color = colors[index];
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