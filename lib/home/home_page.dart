import 'package:flutter/material.dart';
import 'package:geek_hub/config/index.dart';
import 'package:geek_hub/home/home_screen.dart';
import 'package:geek_hub/shared/geek_hub_scafflod.dart';
import 'index.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return GeekHubScaffold(
      title: "GeekHub",
      body: HomeScreen(
        homeBloc: _homeBloc,
      ),
    );
  }
}
