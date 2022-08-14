
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' show Client;
import 'package:progress_indicators/progress_indicators.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:card_settings/card_settings.dart';
import 'package:defaultui/src/ui/Projects_Page_SubPages/projectsform_page.dart';
import 'package:defaultui/src/ui/Projects_Page_SubPages/projectsdetails_page.dart';
import 'package:defaultui/src/model/Project.dart';
import 'package:defaultui/src/app.dart';
import 'package:defaultui/src/env/env.dart';
import 'package:defaultui/src/constants/PageRoutes.dart';
import 'package:defaultui/src/constants/PageTitles.dart';
import 'package:defaultui/src/route/AppRouteObserver.dart';
import 'package:defaultui/src/route/AppScaffold.dart';

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class Projects_Page extends StatefulWidget {
  Projects_Page();

  @override
  _Projects_PageState createState() => _Projects_PageState();
}

class _Projects_PageState extends State<Projects_Page> {
  bool _isLoading = true;
Project? project;
  @override
  void initState() {
    super.initState();
    _initData();
  }

  List? data;
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        pageTitle: PageTitles.PAGE_N5CUDTCPJEHAMTCDDDQJ3F,
        body:
    ListView(
          controller: ScrollController(),
          children: [
            Container(
            padding: EdgeInsets.only(right: 20),
              height: 50,
              child: ButtonBar(
                mainAxisSize: MainAxisSize
                    .min, // this will take space as minimum as posible(to center)
                children: <Widget>[
                  ElevatedButton.icon(
                      icon: Icon(
                        Icons.add,
                        size: 15,
                      ),
                      style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(10),
                            primary: Colors.blue,
                              shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(30.0)),
                             minimumSize: Size(100, 40),
                      ),
                      label: const Text('Add', style: TextStyle(fontSize: 12)),
                      onPressed: () => showDialog<String>(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              content: Builder(
                                builder: (context) {
                             return Container(
                                  height: 700,
                                  width: 900,
                                  child: SingleChildScrollView(
                                      child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.end,
                                    children: [
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: IconButton(
                                          icon: const Icon(Icons.close),
                                          tooltip: 'Close',
                                          onPressed: () => Navigator.pop(
                                              context, 'Cancel'),
                                        ),
                                      ),
                                      SingleChildScrollView(
                                         child: ProjectsForm_Page()
                                         )
                                    ],
                                  )),
                                );
                                },
                              ),
                            ),
                          ).then((value) => {
                               if (value == "Cancel")
                                 {
                                   super.setState(() {
                                     _initData();
                                   })
                                 }
                             }))
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.all(20),
                child: data == null
                  ? _isLoading == true
                     ? Center(
                         child: new Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: <Widget>[
                             JumpingDotsProgressIndicator(
                               fontSize: 50.0,
                             ),
                           ]))
                     : Center(
                         child: Text("No Data"),
                       )
                 :  ResponsiveGridList(
                        horizontalGridSpacing:
                            5, // Horizontal space between grid items
                        verticalGridSpacing:
                            20, // Vertical space between grid items
                        horizontalGridMargin:
                            5, // Horizontal space around the grid
                        verticalGridMargin: 5, // Vertical space around the grid
                        minItemWidth:
                            300, // The minimum item width (can be smaller, if the layout constraints are smaller)
                        minItemsPerRow:1, // The minimum items to show in a single row. Takes precedence over minItemWidth
                        maxItemsPerRow:3,  // The maximum items to show in a single row. Can be useful on large screens
                        shrinkWrap:
                            true, // shrinkWrap property of the ListView.builder()
                        children: data!.map((e) {
                          return Card(
                              elevation: 3,
                              child: InkWell(
                              onTap: () => showDialog<String>(
                                barrierDismissible: false,
                                context: context,
                                builder: (BuildContext context) =>
                                    AlertDialog(
                                  content: Builder(
                                    builder: (context) {
                                      return Container(
                                        height: 700,
                                        width: 900,
                                        child: SingleChildScrollView(
                                            child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Align(
                                              alignment: Alignment.topRight,
                                              child: IconButton(
                                                icon: const Icon(Icons.close),
                                                tooltip: 'Close',
                                                onPressed: () =>
                                                    Navigator.pop(
                                                        context, 'Cancel'),
                                              ),
                                            ),
                                            SingleChildScrollView(
                                                child: ProjectsDetails_Page(paramdata: e))
                                          ],
                                        )),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              child:  Column(
                                children: [


                                         Container(
                                             margin: EdgeInsets.all(0.0),
                                             decoration: BoxDecoration(
                                             borderRadius: BorderRadius.circular(3),
                                               color: Colors.blue,
                                             ),
                                             height: 44,
                                             padding: EdgeInsets.only(
                                                 left: 14.0,
                                                 top: 8.0,
                                                 right: 14.0,
                                                 bottom: 8.0),
                                             child: Row(
                                               children: <Widget>[
                                                 Expanded(
                                                   child: Text(
                                                   "",
                                                     maxLines: 1,
                                                     style: Theme.of(context)
                                                         .textTheme
                                                         .headline6,
                                                     textAlign: TextAlign.left,
                                                   ),
                                                 ),
                                               ],
                                             ),
                                           ),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                top: 10, left: 20, right: 5, bottom: 5),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    "Name",
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 15),
                                                  ),
                                                  flex: 4,
                                                ),
                                                Expanded(
                                                  child: Text(":"),
                                                  flex: 1,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    e["name"].toString(),
                                                    maxLines: 1,
                                                    style: TextStyle(fontSize: 15),
                                                  ),
                                                  flex: 8,
                                                ),
                                              ],
                                            ),
                                          ),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                top: 10, left: 20, right: 5, bottom: 5),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    "Description",
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 15),
                                                  ),
                                                  flex: 4,
                                                ),
                                                Expanded(
                                                  child: Text(":"),
                                                  flex: 1,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    e["description"].toString(),
                                                    maxLines: 1,
                                                    style: TextStyle(fontSize: 15),
                                                  ),
                                                  flex: 8,
                                                ),
                                              ],
                                            ),
                                          ),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                top: 10, left: 20, right: 5, bottom: 5),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    "Namespace",
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 15),
                                                  ),
                                                  flex: 4,
                                                ),
                                                Expanded(
                                                  child: Text(":"),
                                                  flex: 1,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    e["namespace"].toString(),
                                                    maxLines: 1,
                                                    style: TextStyle(fontSize: 15),
                                                  ),
                                                  flex: 8,
                                                ),
                                              ],
                                            ),
                                          ),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                top: 10, left: 20, right: 5, bottom: 5),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    "Version",
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 15),
                                                  ),
                                                  flex: 4,
                                                ),
                                                Expanded(
                                                  child: Text(":"),
                                                  flex: 1,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    e["version"].toString(),
                                                    maxLines: 1,
                                                    style: TextStyle(fontSize: 15),
                                                  ),
                                                  flex: 8,
                                                ),
                                              ],
                                            ),
                                          ),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                top: 10, left: 20, right: 5, bottom: 5),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    "Package",
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 15),
                                                  ),
                                                  flex: 4,
                                                ),
                                                Expanded(
                                                  child: Text(":"),
                                                  flex: 1,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    e["package"].toString(),
                                                    maxLines: 1,
                                                    style: TextStyle(fontSize: 15),
                                                  ),
                                                  flex: 8,
                                                ),
                                              ],
                                            ),
                                          ),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                top: 10, left: 20, right: 5, bottom: 5),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    "Projectuuid",
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 15),
                                                  ),
                                                  flex: 4,
                                                ),
                                                Expanded(
                                                  child: Text(":"),
                                                  flex: 1,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    e["projectuuid"].toString(),
                                                    maxLines: 1,
                                                    style: TextStyle(fontSize: 15),
                                                  ),
                                                  flex: 8,
                                                ),
                                              ],
                                            ),
                                          ),


                                Padding(
                                        padding: EdgeInsets.only(
                                          left: 5,
                                          right: 0,
                                          top: 20,
                                        ),
                                        child: const Divider(
                                          height: 1,
                                          thickness: 1,
                                          endIndent: 10,
                                          color: Color.fromARGB(255, 73, 131, 206),
                                        ),
                                      ),
                                  Padding(
                                      padding: EdgeInsets.all(5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: <Widget>[
                                        ],
                                      ))
                                ],
                              ),));
                        }).toList(), // The list of widgets in the list
                      ))
          ],  )

        );
  }

  void _initData() async {
    var jsonString;
  }
}