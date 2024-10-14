import 'package:flutter/material.dart';

class Goals extends StatelessWidget {
  const Goals({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            "Goal",
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ),
        buildGoals(text: "Add Tourist offers"),
        buildGoals(text: "Add Air Flights"),
        buildGoals(text: "Add Tourist Places"),
        buildGoals(text: "Following Reservations"),
      ],
    );
  }

  Padding buildGoals({required String text}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          const Icon(Icons.check, color: Colors.green),
          const SizedBox(width: 10),
          Text(text),
        ],
      ),
    );
  }
}
