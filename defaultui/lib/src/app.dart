import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;
import 'package:defaultui/src/ui/loginpage_page.dart';
import 'package:defaultui/src/util/HexColor.dart';
import 'package:defaultui/src/env/env.dart';

final ThemeData theme = ThemeData();

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  bool changeClass = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
            primary: HexColor("#1a202e"), secondary: HexColor("#5c77ff")),
      ),
      home: const Scaffold(
        body: LoginPage_Page(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    if (kIsWeb) {
      final host = html.window.location.hostname;
      final protocol = html.window.location.protocol;
      Env.baseurl = protocol + "//" + host! + "";
    }
  }
}
