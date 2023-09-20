import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomeButton extends StatelessWidget {
   CustomeButton({super.key,this.onTap,  this.isLoading = false });
  final void Function()? onTap;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 55,
        decoration: BoxDecoration(
        color: PrimaryColor,
        borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: isLoading ? const SizedBox(width: 27,height: 27,child: const CircularProgressIndicator(color: Colors.black,)) :
          const Text('Add',style: TextStyle(fontSize: 20,color: Colors.black),)),
      ),
    );
  }
}