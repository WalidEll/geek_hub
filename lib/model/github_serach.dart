import 'package:geek_hub/model/github_repository.dart';

class SearchResult {
  final List<Repository> items;

  const SearchResult({this.items});

  static SearchResult fromJson(Map<String, dynamic> json) {
    final items = (json['items'] as List<dynamic>)
        .map((dynamic item) =>
            Repository.fromJson(item as Map<String, dynamic>))
        .toList();
    return SearchResult(items: items);
  }
}

