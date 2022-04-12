import 'dart:convert';
import 'data.dart';
import 'package:http/http.dart' as http;

List<Data> dataList = [];
List<Data> followerList = [];
List<Data> followingList = [];
late Future<IndividualData> individualDataMap;

Future getData() async {
  final response = await http.get(Uri.parse("https://api.github.com/users"));
  if (response.statusCode == 200) {
    return response;
  } else {
    throw Exception('Failed to load the data');
  }
}

Future getFollowers(int index) async {
  final response = await http.get(Uri.parse(dataList[index].followersUrl));
  if (response.statusCode == 200) {
    return response;
  } else {
    throw Exception('Failed to load the data');
  }
}

Future getFollowing(int index) async {
  final response = await http.get(Uri.parse(dataList[index]
      .followingUrl
      .substring(0, dataList[index].followingUrl.length - 13)));
  if (response.statusCode == 200) {
    return response;
  } else {
    throw Exception('Failed to load the data');
  }
}

Future<IndividualData> getIndividualData(int index) async {
  final response = await http.get(Uri.parse(dataList[index].url));
  if (response.statusCode == 200) {
    return IndividualData.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load the data');
  }
}
