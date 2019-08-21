import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'index.dart';

class TrendingScreen extends StatefulWidget {
  const TrendingScreen({
    Key key,
    @required TrendingBloc trendingBloc,
  })  : _trendingBloc = trendingBloc,
        super(key: key);

  final TrendingBloc _trendingBloc;

  @override
  TrendingScreenState createState() {
    return TrendingScreenState(_trendingBloc);
  }
}

class TrendingScreenState extends State<TrendingScreen> {
  final TrendingBloc _trendingBloc;
  TrendingScreenState(this._trendingBloc);

  @override
  void initState() {
    super.initState();
    this._trendingBloc.dispatch(OnLoadingMoreTrends());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendingBloc, TrendingState>(
      bloc: widget._trendingBloc,
      builder: (context, currentState) {
        if (currentState is TrendingUninitialized) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (currentState is ErrorTrendingState) {
          return Center(
            child: Text('failed to fetch posts'),
          );
        }
        if (currentState is TrendingStateLoaded) {
          TrendingStateLoaded state = currentState;
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return index >= state.repositories.length
                  ? Text("loading")
                  : Text(state.repositories[index].fullName);
            },
            itemCount: state.repositories.length,
          );
        }
        return Center(
          child: Text("Trending"),
        );
      },
    );
  }
}
