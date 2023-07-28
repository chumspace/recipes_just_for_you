import 'package:flutter/material.dart';
import 'package:recipes_just_for_you/loginpage.dart';
import '../palatte.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String text;

  const MyButton({super.key, required this.onTap, required this.text,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 250,
        decoration: BoxDecoration(
          color: Colors.greenAccent,
          borderRadius: BorderRadius.circular(32),
        ),
        child:  Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              text,
              style: kBodyText
              ),
          ),
          ),
        ),
      );
  }
}
