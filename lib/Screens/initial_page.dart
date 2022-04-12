import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:task_one/Screens/information_page.dart';
import 'package:task_one/entities/data.dart';
import 'package:task_one/entities/reusable_card.dart';
import '../entities/get_data.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    getData().then((response) {
      setState(() {
        Iterable placeHolder = json.decode(response.body);
        dataList = placeHolder.map((model) => Data.fromJson(model)).toList();
      });
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
          itemCount: dataList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return InformationPage(index: index);
                }));
              },
              child: ReusableCard(
                cardChild: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      CircleAvatar(
                        backgroundImage:
                            NetworkImage(dataList[index].avatarUrl),
                        radius: 35,
                      ),
                      const SizedBox(
                        width: 30.0,
                      ),
                      Text(
                        dataList[index].login,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
