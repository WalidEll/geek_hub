import 'package:flutter/material.dart';
import 'package:geek_hub/home/home_screen.dart';
import 'package:geek_hub/home/home_widgets/events/index.dart';
import 'package:geek_hub/shared/geek_hub_scafflod.dart';
import 'home_widgets/trending/index.dart';
import 'index.dart';

class ActivityPage extends StatefulWidget {
  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage>
    with SingleTickerProviderStateMixin {
  var _eventsBloc = EventsBloc();
  var _trendingBloc = TrendingBloc();
  final List<Tab> myTabs = <Tab>[
    Tab(
      text: 'Trending',
      icon: Icon(Icons.trending_up),
    ), Tab(
      text: 'Events',
      icon: Icon(Icons.event),
    ),
  ];
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GeekHubScaffold(
      title: "GeekHub Activity",
      body: TabBarView(
        controller: _tabController,
        children: [
          TrendingScreen(trendingBloc: _trendingBloc,),
          EventsScreen(eventsBloc: _eventsBloc,),
        ],
      ),
      tabBar: TabBar(
        tabs: myTabs,
        controller: _tabController,
      ),
    );
  }
}
