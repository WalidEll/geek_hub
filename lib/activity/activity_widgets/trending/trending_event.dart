import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'index.dart';

@immutable
abstract class TrendingEvent extends Equatable {
  TrendingEvent([List props = const <dynamic>[]]) : super(props);
}

class OnLoadingMoreTrends extends TrendingEvent {
  @override
  String toString() => 'TextChanged';
}

class OnRefreshingTrends extends TrendingEvent {
  OnRefreshingTrends() : super([]);
  @override
  String toString() => 'TextChanged';
}
