import 'package:flutter/material.dart';

class InformationCard extends StatelessWidget {
  final Widget cardChild;

  const InformationCard({Key? key, required this.cardChild}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: const EdgeInsets.all(5.0),
      height: 500,
      width: 350,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: const Color(0xFF1C1E40)),
    );
  }
}
