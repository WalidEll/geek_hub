import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class EventsState extends Equatable {
  EventsState([List props = const <dynamic>[]]) : super(props);
  EventsState getStateCopy();
}

class UnEventsState extends EventsState {
  @override
  String toString() => 'UnEventsState';
  @override
  EventsState getStateCopy() {
    return UnEventsState();
  }
}

class InEventsState extends EventsState {
  @override
  String toString() => 'InEventsState';
  @override
  EventsState getStateCopy() {
    return InEventsState();
  }
}

class ErrorEventsState extends EventsState {
  final String errorMessage;

  ErrorEventsState(this.errorMessage);

  @override
  String toString() => 'ErrorEventsState';
  @override
  EventsState getStateCopy() {
    return ErrorEventsState(this.errorMessage);
  }
}
