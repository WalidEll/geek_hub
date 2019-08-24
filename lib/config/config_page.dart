import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geek_hub/geekhub/index.dart';
import 'package:geek_hub/trending/index.dart';
import 'package:geek_hub/utils/geek_hub.dart';
import 'index.dart';

class ConfigPage extends StatefulWidget {
  @override
  _ConfigPageState createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  ConfigBloc configBloc;
  NavigationBloc navigationBloc;

  @override
  void initState() {
    super.initState();
    setupApp();
  }

  setupApp() {
    configBloc = ConfigBloc();
    navigationBloc = NavigationBloc();
    configBloc.darkModeOn =
        GeekHub.prefs.getBool(GeekHub.darkModePref) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ConfigBloc>(
            builder: (BuildContext context) => configBloc,
          ),
          BlocProvider<NavigationBloc>(
            builder: (BuildContext context) => navigationBloc,
          ),
        ],
        child: BlocBuilder<ConfigBloc, ConfigState>(
          builder: (context, state) {
            return MaterialApp(
              title: "GeekHub",
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                //* Custom Google Font
                // fontFamily: Devfest.google_sans_family,
                primarySwatch: Colors.red,
                primaryColor: configBloc.darkModeOn
                    ? Colors.black
                    : Color.fromRGBO(36, 41, 46, 1),
                disabledColor: Colors.grey,
                cardColor: configBloc.darkModeOn ? Colors.black : Colors.white,
                canvasColor:
                    configBloc.darkModeOn ? Colors.black : Colors.grey[50],
                brightness:
                    configBloc.darkModeOn ? Brightness.dark : Brightness.light,
                buttonTheme: Theme.of(context).buttonTheme.copyWith(
                    colorScheme: configBloc.darkModeOn
                        ? ColorScheme.dark()
                        : ColorScheme.light()),
                dividerColor: configBloc.darkModeOn ? Colors.white : Colors.grey,
                appBarTheme: AppBarTheme(
                  elevation: 0.0,
                ),
              ),
              routes: {
                '/': (context) => ActivityPage(),
                '/trending': (context) => TrendingPage(),
              },
              initialRoute: '/trending',
            );
          },
        ));
  }
}