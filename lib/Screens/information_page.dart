import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task_one/entities/button_card.dart';
import 'package:task_one/entities/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import '../entities/data.dart';
import '../entities/get_data.dart';
import '../entities/information_card.dart';
import '../entities/popup.dart';

class InformationPage extends StatefulWidget {
  final int index;
  const InformationPage({Key? key, required this.index}) : super(key: key);

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  @override
  void initState() {
    super.initState();
    getFollowers(widget.index);
    getFollowing(widget.index);
    individualDataMap = getIndividualData(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    getFollowers(widget.index).then((response) {
      setState(() {
        Iterable followerPlaceHolder = json.decode(response.body);
        followerList =
            followerPlaceHolder.map((model) => Data.fromJson(model)).toList();
      });
    });

    getFollowing(widget.index).then((response) {
      setState(() {
        Iterable followingPlaceHolder = json.decode(response.body);
        followingList =
            followingPlaceHolder.map((model) => Data.fromJson(model)).toList();
      });
    });

    return Scaffold(
      backgroundColor: const Color(0xFF111328),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BackButton(),
              Column(
                children: [
                  const SizedBox(height: 10),
                  CircleAvatar(
                    backgroundImage:
                        NetworkImage(dataList[widget.index].avatarUrl),
                    radius: 80,
                  ),
                  const SizedBox(height: 20),
                  InformationCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Username:'),
                            const SizedBox(width: 20),
                            Text(
                              dataList[widget.index].login,
                              style: kFieldTextStyle,
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text('GitHub Link:'),
                            const SizedBox(width: 10),
                            IconButton(
                                onPressed: () async {
                                  String url = dataList[widget.index].htmlUrl;
                                  if (await canLaunch(url)) {
                                    await launch(url);
                                  } else {
                                    throw 'Could not launch url';
                                  }
                                },
                                icon: const Icon(
                                  FontAwesomeIcons.github,
                                  size: 50,
                                )),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Name:'),
                            const SizedBox(
                              width: 10,
                            ),
                            FutureBuilder<IndividualData>(
                              future: individualDataMap,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Text(
                                    snapshot.data!.name,
                                    style: kFieldTextStyle,
                                  );
                                } else if (snapshot.hasError) {
                                  return Text('${snapshot.error}');
                                }
                                return const CircularProgressIndicator();
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Location:'),
                            const SizedBox(width: 10),
                            FutureBuilder<IndividualData>(
                              future: individualDataMap,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Text(
                                    snapshot.data!.location,
                                    style: kFieldTextStyle,
                                  );
                                } else if (snapshot.hasError) {
                                  return Text('${snapshot.error}');
                                }
                                return const CircularProgressIndicator();
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        ButtonCard(
                          cardChild: PopUpBox(
                            subtitle: 'Followers',
                            subList: followerList,
                          ),
                        ),
                        ButtonCard(
                          cardChild: PopUpBox(
                            subtitle: 'Following',
                            subList: followingList,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
