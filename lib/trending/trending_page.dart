import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geek_hub/config/navigation_bloc.dart';
import 'package:geek_hub/config/navigation_state.dart';
import 'package:geek_hub/shared/geek_hub_scafflod.dart';
import 'package:geek_hub/trending/trending_screen.dart';

class TrendingPage extends StatefulWidget {
  @override
  TrendingPageState createState() {
    return TrendingPageState();
  }
}

class TrendingPageState extends State<TrendingPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NavigationBloc, NavigationState>(
      listener: (BuildContext context, NavigationState state) {
        if (state is ActivityNavigationState) {
          Navigator.of(context).pop();
        }
      },
      child: GeekHubScaffold(title: "Trending", body: TrendingScreen()),
    );
  }
}
