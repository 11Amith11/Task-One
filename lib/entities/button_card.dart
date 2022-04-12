import 'package:flutter/material.dart';

class ButtonCard extends StatelessWidget {
  final Widget cardChild;

  const ButtonCard({Key? key, required this.cardChild}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      height: 80,
      width: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: const Color(0xFF1C1E40)),
    );
  }
}
