import 'package:flutter/material.dart';
import 'package:untitled75/theme/j-path-colors.dart';

class SmallButton extends StatelessWidget {
  final String innerText;
  final void Function()? onPressed;
  const SmallButton({super.key, required this.innerText, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff233743),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          innerText,
          style:
              const TextStyle(color: JPathColors.textButtonColor, fontSize: 20),
        ),
      ),
    );
  }
}
