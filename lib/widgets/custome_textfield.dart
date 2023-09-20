import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomeTextField extends StatelessWidget {
   CustomeTextField({super.key,this.hint,this.maxLines = 1, this.onSaved,this.onChanged,this.controller});
String? hint;
final int maxLines;
final void Function(String?)? onSaved;
void Function(String)? onChanged;
TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: PrimaryColor,
      maxLines: maxLines,
      onSaved: onSaved,
      onChanged: onChanged,
      controller:controller,
      validator: (value){
        if(value?.isEmpty ?? true){
          return 'field is required';
        }else{
          return null;
        }
      },
      decoration: InputDecoration(
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(color: PrimaryColor),
        hintText: hint,
        hintStyle: TextStyle(color: PrimaryColor)
      ),
    );
  }
}


OutlineInputBorder buildBorder({Color? color}){
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(
      color: color ??Colors.white,
       width: 1,
    ),
  );
}