import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'index.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({
    Key key,
    @required EventsBloc eventsBloc,
  })  : _homeBloc = eventsBloc,
        super(key: key);

  final EventsBloc _homeBloc;

  @override
  EventsScreenState createState() {
    return EventsScreenState(_homeBloc);
  }
}

class EventsScreenState extends State<EventsScreen> {
  final EventsBloc _homeBloc;
  EventsScreenState(this._homeBloc);

  @override
  void initState() {
    super.initState();
    this._homeBloc.dispatch(LoadEventsEvent());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventsBloc, EventsState>(
      bloc: widget._homeBloc,
      builder: (context, currentState) {
        if (currentState is UnEventsState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Center(child: Text("Events"),);
      },
    );
  }
}
