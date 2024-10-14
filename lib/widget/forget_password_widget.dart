import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled75/theme/j-path-colors.dart';

class ForgetPasswordWidget extends StatelessWidget {
  const ForgetPasswordWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.80,
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () => {Get.offAllNamed("/forget")},
        child: const Text(
          'Forget password?',
          style: TextStyle(
            color: JPathColors.questionTextColor,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
