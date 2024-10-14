import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  CustomCheckBox(
      {super.key,
      this.size,
      this.iconSize,
      this.isSelected = false,
      required this.onTap});
  final double? size;
  final double? iconSize;
  late bool isSelected;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            curve: Curves.fastLinearToSlowEaseIn,
            decoration: BoxDecoration(
              color: isSelected ? Colors.yellow : Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              border: isSelected
                  ? null
                  : Border.all(
                      color: Colors.black,
                      width: 1.5,
                    ),
            ),
            width: size,
            height: size,
            child: isSelected
                ? Icon(
                    Icons.check,
                    color: Colors.white,
                    size: iconSize,
                  )
                : null));
  }
}
