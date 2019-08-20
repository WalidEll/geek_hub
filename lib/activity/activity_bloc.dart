import 'package:bloc/bloc.dart';
import 'index.dart';
class ActivityBloc extends Bloc<ActivityEvent, ActivityState> {
 static final ActivityBloc _homeBlocSingleton = ActivityBloc._internal();

  factory ActivityBloc() {
    return _homeBlocSingleton;
  }

  ActivityBloc._internal();

  @override
  ActivityState get initialState => UnActivityState();

  @override
  Stream<ActivityState> mapEventToState(
    ActivityEvent event,
  ) async* {
    try {
      yield UnActivityState();
      yield await event.applyAsync(currentState: currentState, bloc: this);
    } catch (_, stackTrace) {
      print('$_ $stackTrace');
      yield currentState;
    }
  }
  }