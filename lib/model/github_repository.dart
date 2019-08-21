import 'package:geek_hub/model/github_user.dart';

class Repository {
  final String fullName;
  final String htmlUrl;
  final GithubUser owner;

  const Repository({this.fullName, this.htmlUrl, this.owner});

  static Repository fromJson(dynamic json) {
    return Repository(
      fullName: json['full_name'] as String,
      htmlUrl: json['html_url'] as String,
      owner: GithubUser.fromJson(json['owner']),
    );
  }
}