import 'package:bloc/bloc.dart';
import 'index.dart';


class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  @override
  NavigationState get initialState => ActivityNavigationState();

  @override
  Stream<NavigationState> mapEventToState(
    NavigationEvent event,
  ) async* {
    switch (event) {
      case NavigationEvent.ActivityNavigationEvent:
        yield ActivityNavigationState();
        break;
      case NavigationEvent.TrendingNavigationEvent:
        yield TrendingNavigationState();
        break;
    }
  }
}
