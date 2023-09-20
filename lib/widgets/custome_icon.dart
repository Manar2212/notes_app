import 'package:flutter/material.dart';

class CustomeIcon extends StatelessWidget {
   CustomeIcon({super.key,required this.icon,this.onTap});
final IconData icon;
void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap:onTap,
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white.withOpacity(0.05),
        ),
        child: Icon(icon),
      ),
    );
  }
}