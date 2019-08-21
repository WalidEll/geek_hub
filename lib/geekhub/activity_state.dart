import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ActivityState extends Equatable {
  ActivityState([List props = const <dynamic>[]]) : super(props);
  ActivityState getStateCopy();
}

class UnActivityState extends ActivityState {
  @override
  String toString() => 'UnActivityState';
  @override
  ActivityState getStateCopy() {
    return UnActivityState();
  }
}

class InActivityState extends ActivityState {
  @override
  String toString() => 'InActivityState';
  @override
  ActivityState getStateCopy() {
    return InActivityState();
  }
}

class ErrorActivityState extends ActivityState {
  final String errorMessage;

  ErrorActivityState(this.errorMessage);

  @override
  String toString() => 'ErrorActivityState';
  @override
  ActivityState getStateCopy() {
    return ErrorActivityState(this.errorMessage);
  }
}
