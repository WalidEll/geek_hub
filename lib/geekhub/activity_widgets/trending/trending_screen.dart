import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geek_hub/model/github_repository.dart';
import 'package:geek_hub/utils/geek_hub.dart';

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
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    this._trendingBloc.dispatch(OnLoadingMoreTrends());
  }

  @override
  void dispose() {
    _scrollController.dispose();
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
            itemCount: state.repositories.length+1,
            separatorBuilder: (BuildContext context, int index) => Divider(
              color: Colors.grey,
            ),
            itemBuilder: (BuildContext context, int index) {
              return index >= state.repositories.length
                  ? BottomLoader()
                  : RepositoryCard(repository: state.repositories[index]);
            },
            controller: _scrollController,
          );
        }
        return Center(
          child: Text("Trending"),
        );
      },
    );
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= GeekHub.scrollThreshold) {
      _trendingBloc.dispatch(OnLoadingMoreTrends());
    }
  }
}

class RepositoryCard extends StatelessWidget {
  final Repository repository;

  const RepositoryCard({Key key, this.repository}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
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
                      repository.description??'',
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
class BottomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: SizedBox(
          width: 33,
          height: 33,
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
          ),
        ),
      ),
    );
  }
}