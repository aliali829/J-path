import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled75/theme/j-path-colors.dart';

class DontHaveAnAccountWidget extends StatelessWidget {
  const DontHaveAnAccountWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Don\'t have an account ? ',
            style: TextStyle(
                fontSize: 13,
                color: JPathColors.questionTextColor,
                fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: () => {
              Get.offAllNamed("/SignUp"),
            },
            child: const Text(
              'Sign-up',
              style: TextStyle(
                  fontSize: 15,
                  color: JPathColors.answerTextColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
