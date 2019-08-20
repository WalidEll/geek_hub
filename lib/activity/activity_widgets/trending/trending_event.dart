import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'index.dart';

@immutable
abstract class TrendingEvent extends Equatable {
  TrendingEvent([List props = const <dynamic>[]]) : super(props);
    Future<TrendingState> applyAsync({TrendingState currentState, TrendingBloc bloc});

}
class LoadTrendingEvent extends TrendingEvent {
  @override
  String toString() => 'LoadTrendingEvent';
  @override
  Future<TrendingState> applyAsync({TrendingState currentState, TrendingBloc bloc}) async{
   try{

     await Future.delayed(Duration(seconds: 1));
     return InTrendingState();

   }catch (_, stackTrace) {
      print('$_ $stackTrace');
      return ErrorTrendingState(_?.toString());
    }
  }
}