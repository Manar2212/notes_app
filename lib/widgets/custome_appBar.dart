import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custome_icon.dart';


class CustomeAppBar extends StatelessWidget {
   CustomeAppBar({super.key,required this.title,required this.icon,this.onTap});
  final  String title;
  final IconData icon;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text('$title',style: TextStyle(fontSize:27),)),
        CustomeIcon(icon: icon,onTap: onTap),
      ],
    );
  }
}

