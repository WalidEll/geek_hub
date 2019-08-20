import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'index.dart';

@immutable
abstract class EventsEvent extends Equatable {
  EventsEvent([List props = const <dynamic>[]]) : super(props);
    Future<EventsState> applyAsync({EventsState currentState, EventsBloc bloc});

}
class LoadEventsEvent extends EventsEvent {
  @override
  String toString() => 'LoadEventsEvent';
  @override
  Future<EventsState> applyAsync({EventsState currentState, EventsBloc bloc}) async{
   try{

     await Future.delayed(Duration(seconds: 1));
     return InEventsState();

   }catch (_, stackTrace) {
      print('$_ $stackTrace');
      return ErrorEventsState(_?.toString());
    }
  }
}