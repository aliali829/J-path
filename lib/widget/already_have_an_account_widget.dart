import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled75/theme/j-path-colors.dart';

class AlreadyHaveAnAccountWidget extends StatelessWidget {
  const AlreadyHaveAnAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Already have an account ? ',
            style: TextStyle(
                fontSize: 13,
                color: JPathColors.questionTextColor,
                fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: () => Get.offAllNamed("/SignIn"),
            child: const Text(
              'Log-in',
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
