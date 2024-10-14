import 'package:flutter/material.dart';

class Responseve extends StatelessWidget {
  const Responseve({super.key, required this.standerdWeb, this.notStanderdWeb});
  final Widget standerdWeb;
  final Widget? notStanderdWeb;
  static bool isStanderdWeb(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1024;
  }

  static bool notIsStanderdWeb(BuildContext context) {
    return MediaQuery.of(context).size.width < 1024;
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    if (_size.width >= 1024) {
      return standerdWeb;
    } else {
      return notStanderdWeb!;
    }
  }
}
