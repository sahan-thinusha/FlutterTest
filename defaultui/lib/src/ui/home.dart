import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:defaultui/src/ui/project_details_page.dart';
import 'package:defaultui/src/ui/add_new_project_page.dart';
import 'package:defaultui/src/ui/projects_page.dart';
import 'package:defaultui/src/constants/PageRoutes.dart';
import 'package:defaultui/src/route/AppRouteObserver.dart';
import 'package:defaultui/src/app.dart';

void main() => runApp(HomePage());

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Defaultui',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
              secondaryHeaderColor: Colors.indigo[400],
              canvasColor: Color.fromARGB(255, 236, 243, 248),
                textTheme: TextTheme(
                  button: TextStyle(color: Colors.deepPurple[900]), // button text
                  subtitle1: TextStyle(color: Colors.grey[800]), // input text
                  headline6: TextStyle(color: Colors.white), // card header text
                ),
                primaryTextTheme: TextTheme(
                  headline6: TextStyle(color: Colors.lightBlue[50]), // app header text
                ),
        pageTransitionsTheme: PageTransitionsTheme(
          builders: Map<TargetPlatform,
                  _InanimatePageTransitionsBuilder>.fromIterable(
              TargetPlatform.values.toList(),
              key: (dynamic k) => k,
              value: (dynamic _) => const _InanimatePageTransitionsBuilder()),
        ),
      ),
      builder: (context, widget) => ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(context, widget!),
        breakpoints: [
          const ResponsiveBreakpoint.resize(350, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(600, name: TABLET),
          const ResponsiveBreakpoint.resize(800, name: 'DESKTOPMINI'),
          const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          const ResponsiveBreakpoint.autoScale(1700, name: 'XL'),
        ],
      ),
      initialRoute: PageRoutes.PAGE_YEHSCMAXTKZJEWRJGTLTPF,
      
      navigatorObservers: [AppRouteObserver()],
      routes: {
       PageRoutes.PAGE_YEHSCMAXTKZJEWRJGTLTPF: (_) => Project_Details_Page(),
       PageRoutes.PAGE_IBHGS6PPPNJAVCWP3ZWNXE: (_) => Add_New_Project_Page(),
       PageRoutes.PAGE_N5CUDTCPJEHAMTCDDDQJ3F: (_) => Projects_Page(),
      },
    );
  }
}

/// This class is used to build page transitions that don't have any animation
class _InanimatePageTransitionsBuilder extends PageTransitionsBuilder {
  const _InanimatePageTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
      PageRoute<T> route,
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return child;
  }
}
