import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Widget cardChild;

  const ReusableCard({Key? key, required this.cardChild}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: const EdgeInsets.all(5.0),
      height: 120,
      width: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: const Color(0xFF111328)),
    );
  }
}
