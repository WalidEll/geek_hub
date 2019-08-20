import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'index.dart';

@immutable
abstract class HomeEvent extends Equatable {
  HomeEvent([List props = const <dynamic>[]]) : super(props);
    Future<HomeState> applyAsync({HomeState currentState, HomeBloc bloc});

}
class LoadHomeEvent extends HomeEvent {
  @override
  String toString() => 'LoadHomeEvent';
  @override
  Future<HomeState> applyAsync({HomeState currentState, HomeBloc bloc}) async{
   try{

     await Future.delayed(Duration(seconds: 1));
     return InHomeState();

   }catch (_, stackTrace) {
      print('$_ $stackTrace');
      return ErrorHomeState(_?.toString());
    }
  }
}