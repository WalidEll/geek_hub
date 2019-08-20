import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geek_hub/config/index.dart';

class GeekHubScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget tabBar;
  final Widget bottomNavigationBar;
  const GeekHubScaffold(
      {Key key,
      @required this.body,
      @required this.title,
      this.tabBar,
      this.bottomNavigationBar})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      color: ConfigBloc().darkModeOn ? Colors.grey[800] : Colors.white,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          appBar: AppBar(
            title: Text(title),
            centerTitle: true,
            bottom: tabBar != null ? tabBar : null,
            actions: <Widget>[],
          ),
          drawer: Drawer(
            child: ListView(
              children: <Widget>[
                
                ListTile(
                  leading: Icon(
                     FontAwesomeIcons.home,
                    size: 24,
                  ),
                  title: Text('Home'),
                  onTap: () {
                    // Navigator.pop(context); // close the drawer
                  },
                ),
                Divider(),
                ListTile(
                  leading: Icon(
                    ConfigBloc().darkModeOn
                        ? FontAwesomeIcons.lightbulb
                        : FontAwesomeIcons.solidLightbulb,
                    size: 24,
                  ),
                  title: Text('Dark mode'),
                  onTap: () {
                    ConfigBloc()
                        .dispatch(DarkModeEvent(!ConfigBloc().darkModeOn));
                    // Navigator.pop(context); // close the drawer
                  },
                ),
                ListTile(
                  leading: Icon(
                    FontAwesomeIcons.cog,
                    size: 24,
                  ),
                  title: Text('Settings'),
                  onTap: () {
                    // Navigator.pop(context); // close the drawer
                  },
                ),
                ListTile(
                  leading: Icon(
                    FontAwesomeIcons.infoCircle,
                    size: 24,
                  ),
                  title: Text('About'),
                  onTap: () {
                    // Navigator.pop(context); // close the drawer
                  },
                )
              ],
            ),
          ),
          body: body,
          bottomNavigationBar:
              bottomNavigationBar != null ? bottomNavigationBar : null,
        ),
      ),
    );
  }
}
