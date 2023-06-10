import 'package:flutter/material.dart';

import '../utils/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressed, required this.text});

  final void Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      width: double.maxFinite,
      child: ElevatedButton(
        style: ButtonStyle(
          textStyle: const MaterialStatePropertyAll(
            TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: const MaterialStatePropertyAll(
            AppColors.blue,
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
