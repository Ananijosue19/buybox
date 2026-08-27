import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

Widget onBordingBtn(String text, PageController pageController, BuildContext context) {
  return SizedBox(
    width: 150.0,
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(blueColor),
        shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      onPressed: () {
        if (text == 'Next') {
          pageController.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.linear,
          );
        } else if (text == 'Get Started') {
          Navigator.pushReplacementNamed(context, '/signIn');
        }
      },
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
    ),
  );
}
