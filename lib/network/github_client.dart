import 'dart:async';
import 'dart:convert';

import 'package:geek_hub/model/index.dart';
import 'package:http/http.dart' as http;

class GithubClient {
  final String baseUrl;
  final http.Client httpClient;

  GithubClient({
    http.Client httpClient,
    this.baseUrl = "https://api.github.com/search/repositories",
  }) : this.httpClient = httpClient ?? http.Client();

  Future<SearchResult> search(String query,{String sort="",String order=""}) async {
    final response = await httpClient.get(Uri.parse("$baseUrl?q=$query&sort=$sort&order=$order"));
    final results = json.decode(response.body);

    if (response.statusCode == 200) {
      return SearchResult.fromJson(results);
    } else {
      throw SearchResultError.fromJson(results);
    }
  }
}