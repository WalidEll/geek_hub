import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class NavigationState extends Equatable {
  NavigationState([List props = const <dynamic>[]]) : super(props);
}

class ActivityNavigationState extends NavigationState {
  @override
  String toString() => 'ActivityNavigationState';

}

class TrendingNavigationState extends NavigationState {
  @override
  String toString() => 'TrendingNavigationState';

}
