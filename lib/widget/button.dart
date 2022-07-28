import 'package:flutter/material.dart';

class AllButtons extends StatelessWidget {
  AllButtons({
    required this.buttontext,
    this.onPressed,
    //  required this.buttoncolor,
    //required this.buttontextcolor,
  });

  String buttontext;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          //color: Colors.green,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              buttontext,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
