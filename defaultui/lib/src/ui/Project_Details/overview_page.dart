
import 'package:flutter/material.dart';
import 'package:defaultui/src/app.dart';
import 'package:defaultui/src/constants/PageRoutes.dart';
import 'package:defaultui/src/constants/PageTitles.dart';
import 'package:defaultui/src/route/AppRouteObserver.dart';
import 'package:defaultui/src/route/AppScaffold.dart';
import 'package:defaultui/src/ui/Overview/details_page.dart';
import 'package:defaultui/src/ui/Overview/environments_page.dart';
class Overview_Page extends StatefulWidget {
   dynamic? paramdata;
    Overview_Page({this.paramdata,} );

  @override
  _Overview_PageState createState() => _Overview_PageState();
}

class _Overview_PageState extends State<Overview_Page> {
  @override
  Widget build(BuildContext context) {
    bool _dispaySize = true;
    final double screenWidthSize = MediaQuery.of(context).size.width;
    if (screenWidthSize > 1100) {
      _dispaySize = true;
    } else if (screenWidthSize < 1100) {
      _dispaySize = false;
    }
         return  Padding(padding: EdgeInsets.all(10),
                              child: _dispaySize == true
        ? SingleChildScrollView(
        controller: ScrollController(),
                   child: Column(
                     children: [
                        Card(
                        elevation: 1,
                        child:
                              Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 mainAxisSize: MainAxisSize.max,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: <Widget>[
                                      Expanded(
                                           flex: 1,
                                           child: Container(
                                             padding: EdgeInsets.all(1.0),
                                             width: MediaQuery.of(context).size.width * 0.23,
                                             alignment: Alignment.topLeft,
                                             child: Container(
                                               child:
                                                   Details_Page()
                                                   ,
                                             ),
                                           ),
                                         ),

                                 ],
                               ),
                               ),
                        Card(
                        elevation: 1,
                        child:
                              Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 mainAxisSize: MainAxisSize.max,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: <Widget>[

                                 ],
                               ),
                               ),
                        Card(
                        elevation: 1,
                        child:
                              Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 mainAxisSize: MainAxisSize.max,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: <Widget>[
                                      Expanded(
                                           flex: 1,
                                           child: Container(
                                             padding: EdgeInsets.all(1.0),
                                             width: MediaQuery.of(context).size.width * 0.23,
                                             alignment: Alignment.topLeft,
                                             child: Container(
                                               child:
                                                   Environments_Page()
                                                   ,
                                             ),
                                           ),
                                         ),

                                 ],
                               ),
                               ),
                        Card(
                        elevation: 1,
                        child:
                              Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 mainAxisSize: MainAxisSize.max,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: <Widget>[

                                 ],
                               ),
                               ),

                     ],
                   ),
                 )
        :SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                Card(
                elevation: 1,
                child: SizedBox(
                    child:Column(
                       children: [
                                  Details_Page()],

                    ),
                  ),
                  ),
                Card(
                elevation: 1,
                child: SizedBox(
                    child:Column(
                       children: [
                                  Environments_Page()],

                    ),
                  ),
                  ),
                ],
              ),
      ),
    );
  }
}

