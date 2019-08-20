import 'package:bloc/bloc.dart';
import 'index.dart';
class TrendingBloc extends Bloc<TrendingEvent, TrendingState> {
 static final TrendingBloc _homeBlocSingleton = TrendingBloc._internal();

  factory TrendingBloc() {
    return _homeBlocSingleton;
  }

  TrendingBloc._internal();

  @override
  TrendingState get initialState => UnTrendingState();

  @override
  Stream<TrendingState> mapEventToState(
    TrendingEvent event,
  ) async* {
    try {
      yield UnTrendingState();
      yield await event.applyAsync(currentState: currentState, bloc: this);
    } catch (_, stackTrace) {
      print('$_ $stackTrace');
      yield currentState;
    }
  }
  }