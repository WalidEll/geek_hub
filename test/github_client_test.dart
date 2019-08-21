import 'package:flutter_test/flutter_test.dart';
import 'package:geek_hub/model/index.dart';
import 'package:geek_hub/network/github_client.dart';
import 'package:geek_hub/utils/date_util.dart';

void main() {
  test('Test Github Client expect 30 repo', () async {
    GithubClient client = GithubClient();
    String date30DaysEarlier = DateUtil.getEarlierDate(Duration(days: 30));
    String query = "created:>$date30DaysEarlier";
    SearchResult searchResult = await client.search(query);
    expect(searchResult.items.length, 10);
  });
   test('Test Github Client load two pages and expect 60 repo', () async {
    GithubClient client = GithubClient();
    String date30DaysEarlier = DateUtil.getEarlierDate(Duration(days: 30));
    String query = "created:>$date30DaysEarlier";
    int page=0;
    List<Repository> repositories=[];
    SearchResult searchResult = await client.search(query,page: page++);
    repositories.addAll(searchResult.items);
    searchResult = await client.search(query,page: page++);
    repositories.addAll(searchResult.items);
    expect(repositories.length, 20);
  });
}
