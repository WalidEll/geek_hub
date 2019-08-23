import 'package:flutter/material.dart';
import 'package:geek_hub/shared/geek_hub_scafflod.dart';

import 'activity_widgets/events/index.dart';


class ActivityPage extends StatefulWidget {
  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage>
    with SingleTickerProviderStateMixin {
  var _eventsBloc = EventsBloc();
  final List<Tab> myTabs = <Tab>[
    Tab(
      text: 'Feed',
      icon: Icon(Icons.rss_feed),
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
      title: "GeekHub",
      body: TabBarView(
        controller: _tabController,
        children: [
          Container(),
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
