import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class TrendingState extends Equatable {
  TrendingState([List props = const <dynamic>[]]) : super(props);
  TrendingState getStateCopy();
}

class UnTrendingState extends TrendingState {
  @override
  String toString() => 'UnTrendingState';
  @override
  TrendingState getStateCopy() {
    return UnTrendingState();
  }
}

class InTrendingState extends TrendingState {
  @override
  String toString() => 'InTrendingState';
  @override
  TrendingState getStateCopy() {
    return InTrendingState();
  }
}

class ErrorTrendingState extends TrendingState {
  final String errorMessage;

  ErrorTrendingState(this.errorMessage);

  @override
  String toString() => 'ErrorTrendingState';
  @override
  TrendingState getStateCopy() {
    return ErrorTrendingState(this.errorMessage);
  }
}
