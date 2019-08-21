import 'package:equatable/equatable.dart';
import 'package:geek_hub/model/github_repository.dart';
import 'package:meta/meta.dart';

@immutable
abstract class TrendingState extends Equatable {
  TrendingState([List props = const <dynamic>[]]) : super(props);
}

class TrendingUninitialized extends TrendingState {
  @override
  String toString() => 'TrendingUninitialized';
}

class TrendingStateLoading extends TrendingState {
  @override
  String toString() => 'InTrendingState';
}

class TrendingStateLoaded extends TrendingState {
  final List<Repository> repositories;
  final int nextPage;
  TrendingStateLoaded(this.repositories,this.nextPage)
      : super([repositories,nextPage]);
  TrendingStateLoaded copyWith({
    List<Repository> repositories,
    bool hasReachedMax,
  }) {
    return TrendingStateLoaded(
      repositories ?? this.repositories,
      nextPage ?? this.nextPage,
    );
  }

  @override
  String toString() => 'TrendingStateSuccess { items: ${repositories.length} }';
}

class EmptyTrendingState extends TrendingState {
  @override
  String toString() => 'EmptyTrendingState';
}

class ErrorTrendingState extends TrendingState {
  final String errorMessage;

  ErrorTrendingState(this.errorMessage);

  @override
  String toString() => 'ErrorTrendingState';
}
