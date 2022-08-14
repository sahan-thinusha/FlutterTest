
import 'package:flutter/material.dart';
import 'widgets/common/vertical_tabs.dart';
import 'package:defaultui/src/app.dart';
import 'package:defaultui/src/constants/PageRoutes.dart';
import 'package:defaultui/src/constants/PageTitles.dart';
import 'package:defaultui/src/route/AppRouteObserver.dart';
import 'package:defaultui/src/route/AppScaffold.dart';
import 'package:defaultui/src/ui/Project_Details/overview_page.dart';

class Project_Details_Page extends StatefulWidget {
  Project_Details_Page({Key? key}) : super(key: key);

  @override
  _Project_Details_PageState createState() => _Project_Details_PageState();
}

class _Project_Details_PageState extends State<Project_Details_Page>
    with TickerProviderStateMixin {
  late TabController _tabController;
  String _tabSubName = "";


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 1, vsync: this);
    _tabController.animateTo(0);
     _tabSubName = names[0];
  }
var names = ['Project Overview',];
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
         pageTitle: PageTitles.PAGE_YEHSCMAXTKZJEWRJGTLTPF,body :
        Container(
       padding: EdgeInsets.only(left: 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[

                       // Text("Project Details",
                      //    style: TextStyle(
                       //       color: Colors.blue,
                     //         fontSize: 27,
                     //         fontWeight: FontWeight.w400),
                      //  ),
                     //   Padding(padding: EdgeInsets.only(bottom: 5)),
                     //   Text(
                      //    _tabSubName,
                       //   style: TextStyle(
                      //        color: Color.fromARGB(221, 140, 142, 143),
                       //       fontSize: 20,
                      //        fontWeight: FontWeight.w400),
                      //  ),
                     //   Divider(
                     //     color: Color.fromARGB(214, 86, 160, 230),
                     //     endIndent: 10,
                     //     indent: 10,
                     //   ),
                        Padding(padding: EdgeInsets.only(bottom: 5)),
                            Padding(padding: EdgeInsets.only(top: 10)),
                        Container(
                        decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                       color: Color.fromARGB(255, 223, 240, 250),

                                      ),
                          child: TabBar(
                           isScrollable: true,
                                indicator: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50), // Creates border
                                    color: Colors.blue),
                            onTap: (value) {
                              setState(() {
                                _tabSubName = names[value];
                              });
                            },
                              labelColor: Colors.white,
                              unselectedLabelColor: Colors.black,
                              controller: _tabController,
                              tabs: [
                                             Tab( child: Text(
                                                 "Project Overview",
                                                 style: TextStyle(fontWeight: FontWeight.bold),
                                               ),),
                              ],
                            ),
                          ),
                           Expanded(
                          
                              child:
                                    TabBarView(controller: _tabController, children: <Widget>[
                                    Expanded(
                                        child: Overview_Page()),
                          ]))
                        ]),), 
    );
  }
    Widget tabsContent(String caption, [String description = '']) {
      return Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(20),
        color: Colors.black12,
        child: Column(
          children: <Widget>[
            Text(
              caption,
              style: TextStyle(fontSize: 25),
            ),
            Divider(
              height: 20,
              color: Colors.black45,
            ),
            Text(
              description,
              style: TextStyle(fontSize: 15, color: Colors.black87),
            ),
          ],
        ),
      );
    }
}
