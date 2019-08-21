import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'index.dart';

@immutable
abstract class ActivityEvent extends Equatable {
  ActivityEvent([List props = const <dynamic>[]]) : super(props);
    Future<ActivityState> applyAsync({ActivityState currentState, ActivityBloc bloc});

}
class LoadActivityEvent extends ActivityEvent {
  @override
  String toString() => 'LoadActivityEvent';
  @override
  Future<ActivityState> applyAsync({ActivityState currentState, ActivityBloc bloc}) async{
   try{

     await Future.delayed(Duration(seconds: 1));
     return InActivityState();

   }catch (_, stackTrace) {
      print('$_ $stackTrace');
      return ErrorActivityState(_?.toString());
    }
  }
}