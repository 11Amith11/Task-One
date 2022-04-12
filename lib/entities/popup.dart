import 'package:flutter/material.dart';
import 'package:task_one/entities/constants.dart';
import 'package:task_one/entities/reusable_card.dart';
import 'data.dart';
import 'list_card.dart';

class PopUpBox extends StatelessWidget {
  final String subtitle;
  final List<Data> subList;
  const PopUpBox({
    Key? key,
    required this.subtitle,
    required this.subList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: const Color(0xFF2B2F6D),
                title: Text(
                  subtitle,
                  style: kFieldTextStyle,
                ),
                content: Container(
                  decoration: const BoxDecoration(color: Color(0xFF2B2F6D)),
                  height: 400,
                  width: 200,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: subList.length,
                    itemBuilder: (context, value) {
                      return ListCard(
                        cardChild: Row(
                          children: [
                            const SizedBox(width: 10),
                            CircleAvatar(
                              backgroundImage:
                                  NetworkImage(subList[value].avatarUrl),
                            ),
                            const SizedBox(width: 20),
                            Text(subList[value].login),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              );
            });
      },
      child: ReusableCard(
        cardChild: Center(
          child: Text(
            subtitle,
            style: const TextStyle(fontSize: 25),
          ),
        ),
      ),
    );
  }
}
