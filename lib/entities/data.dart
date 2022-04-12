class Data {
  String login;
  int id;
  String avatarUrl;
  String htmlUrl;
  String followersUrl;
  String followingUrl;
  String url;

  Data(
    this.login,
    this.id,
    this.avatarUrl,
    this.htmlUrl,
    this.followersUrl,
    this.followingUrl,
    this.url,
  );

  Data.fromJson(Map<String, dynamic> json)
      : login = json['login'],
        id = json['id'],
        avatarUrl = json['avatar_url'],
        htmlUrl = json['html_url'],
        followersUrl = json['followers_url'],
        followingUrl = json['following_url'],
        url = json['url'];
}

class IndividualData {
  String name;
  String blogUrl;
  String location;

  IndividualData(this.name, this.blogUrl, this.location);

  IndividualData.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        blogUrl = json['blog'],
        location = json['location'];
}
