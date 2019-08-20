import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'index.dart';

class TrendingScreen extends StatefulWidget {
  const TrendingScreen({
    Key key,
    @required TrendingBloc trendingBloc,
  })  : _homeBloc = trendingBloc,
        super(key: key);

  final TrendingBloc _homeBloc;

  @override
  TrendingScreenState createState() {
    return TrendingScreenState(_homeBloc);
  }
}

class TrendingScreenState extends State<TrendingScreen> {
  final TrendingBloc _homeBloc;
  TrendingScreenState(this._homeBloc);

  @override
  void initState() {
    super.initState();
    this._homeBloc.dispatch(LoadTrendingEvent());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendingBloc, TrendingState>(
      bloc: widget._homeBloc,
      builder: (context, currentState) {
        if (currentState is UnTrendingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Center(child: Text("Trending"),);
      },
    );
  }
}
