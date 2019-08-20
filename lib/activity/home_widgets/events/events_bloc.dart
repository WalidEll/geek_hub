import 'package:bloc/bloc.dart';
import 'index.dart';
class EventsBloc extends Bloc<EventsEvent, EventsState> {
 static final EventsBloc _homeBlocSingleton = EventsBloc._internal();

  factory EventsBloc() {
    return _homeBlocSingleton;
  }

  EventsBloc._internal();

  @override
  EventsState get initialState => UnEventsState();

  @override
  Stream<EventsState> mapEventToState(
    EventsEvent event,
  ) async* {
    try {
      yield UnEventsState();
      yield await event.applyAsync(currentState: currentState, bloc: this);
    } catch (_, stackTrace) {
      print('$_ $stackTrace');
      yield currentState;
    }
  }
  }