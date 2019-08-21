import 'package:bloc/bloc.dart';
import 'package:geek_hub/model/github_serach.dart';
import 'package:geek_hub/network/github_client.dart';
import 'package:geek_hub/utils/date_util.dart';
import 'index.dart';

class TrendingBloc extends Bloc<TrendingEvent, TrendingState> {
  static final TrendingBloc _homeBlocSingleton = TrendingBloc._internal();

  factory TrendingBloc() {
    return _homeBlocSingleton;
  }

  TrendingBloc._internal();

  @override
  TrendingState get initialState => TrendingUninitialized();

  @override
  Stream<TrendingState> mapEventToState(
    TrendingEvent event,
  ) async* {
    if (event is OnLoadingMoreTrends) {
      GithubClient client = GithubClient();
      String date30DaysEarlier = DateUtil.getEarlierDate(Duration(days: 30));
      String query = "created:>$date30DaysEarlier";
      try {
        if (currentState is TrendingUninitialized) {
          final searchResult = await client.search(query);
          yield TrendingStateLoaded(searchResult.items, 2);
        }
        if (currentState is TrendingStateLoaded) {
          TrendingStateLoaded state=currentState;
          final searchResult = await client.search(query,page: state.nextPage);
          yield  TrendingStateLoaded(state.repositories + searchResult.items,state.nextPage+1);
        }
        print(event);
      } catch (_) {
        yield ErrorTrendingState(_);
      }
    }
  }
}
