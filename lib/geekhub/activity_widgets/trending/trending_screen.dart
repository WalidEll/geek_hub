import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geek_hub/model/github_repository.dart';

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
          return ListView.separated(
            itemCount: state.repositories.length,
            separatorBuilder: (BuildContext context, int index) => Divider(color: Colors.grey,),
            itemBuilder: (BuildContext context, int index) {
              return index >= state.repositories.length
                  ? Text("loading")
                  : RepositoryCard(repository: state.repositories[index]);
            },
          );
        }
        return Center(
          child: Text("Trending"),
        );
      },
    );
  }
}

class RepositoryCard extends StatelessWidget {
  final Repository repository;

  const RepositoryCard({Key key, this.repository}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Column(
        children: <Widget>[
          ListTile(
            leading: CachedNetworkImage(
              imageUrl: repository.owner.avatarUrl,
              imageBuilder: (context, imageProvider) => CircleAvatar(
                backgroundImage: imageProvider,
                backgroundColor: Colors.white,
              ),
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            title: Text(repository.fullName),
            subtitle: (Row(
              children: <Widget>[
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        repository.description,
                      ),
                    ],
                  ),
                ),
              ],
            )),
          ),
        ],
    );
  }
}
