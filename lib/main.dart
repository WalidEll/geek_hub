import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geek_hub/utils/geek_hub.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config/config_page.dart';


void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

  GeekHub.prefs = await SharedPreferences.getInstance();

  runApp(ConfigPage());
}
