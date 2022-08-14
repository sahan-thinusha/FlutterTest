
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:responsive_table/responsive_table.dart';
import 'package:http/http.dart' show Client;
import '/src/env/env.dart';
import 'package:defaultui/src/model/Environment.dart';
import 'package:defaultui/src/route/AppScaffold.dart';
import 'package:defaultui/src/constants/PageTitles.dart';
import 'package:defaultui/src/ui/widgets/table/SimplifiedCustomResponsiveTable.dart';
import 'package:defaultui/src/model/Environment.dart';
import 'package:defaultui/src/ui/environments_page_page.dart';
class Environments_Page extends StatefulWidget {
   dynamic? paramdata;
   Environments_Page({this.paramdata});
  @override
  State<Environments_Page> createState() => _Environments_Page();
}

class _Environments_Page extends State<Environments_Page> {
  List<Map<String, dynamic>> _rows = [];


  List<DatatableHeader> headers = [];
  List<List<dynamic>>? rightClickActions;
  List<Map<String, dynamic>> _selecteds = [];
  List<DatatableHeader>? _headers;
  BoxDecoration? headerDecoration;
   void getData() async {
      try {
        Client client = Client();
        final response = await client.get(Uri.parse(Env.baseurl+"").replace(queryParameters: widget.paramdata));
        if (response.statusCode == 200) {
          List<dynamic> d = json.decode(response.body);
          d.forEach((dynamic data) {
            Map<String, dynamic> value = data as Map<String, dynamic>;
            _rows.add(value);
          });
        }
      } catch (err) {
        debugPrint((err).toString());
      }
    }

             Future deleteData(data) async {
             }



  @override
  void initState() {
    super.initState();
    getData();

  }

  @override
  Widget build(BuildContext context) {
      final bool displayMobileLayout = MediaQuery.of(context).size.width < 600;
    // if (_rows.length > 0) {
    return  ListView(
    shrinkWrap: true,
         padding: const EdgeInsets.all(6),
                  children: [
                    Container(
                      padding: EdgeInsets.all(5.0),
                      width: MediaQuery.of(context).size.width * 0.23,
                      alignment: Alignment.topLeft,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                        child: Column(children: [

                          SimplifiedCustomResponsiveTable(
                            footerBackgroundColor: Colors.white,
                             headerDecoration: BoxDecoration(
                             color: Color.fromARGB(157, 242, 244, 255),
                             border: Border(
                                 bottom: BorderSide(
                                     color: Color.fromARGB(255, 143, 143, 143), width: 1)),
                           ),
                            headers: [
                                            DatatableHeader(
                                                   text: "Name",
                                                   value: "name",
                                                   show: true,
                                                   sortable: true,
                                                   flex: 2,
                                                   textAlign: TextAlign.left),
                                            DatatableHeader(
                                                   text: "Profile",
                                                   value: "profile",
                                                   show: true,
                                                   sortable: true,
                                                   flex: 2,
                                                   textAlign: TextAlign.left),
                                            DatatableHeader(
                                                   text: "Region",
                                                   value: "region",
                                                   show: true,
                                                   sortable: true,
                                                   flex: 2,
                                                   textAlign: TextAlign.left),
                                            DatatableHeader(
                                                   text: "Description",
                                                   value: "description",
                                                   show: true,
                                                   sortable: true,
                                                   flex: 2,
                                                   textAlign: TextAlign.left),
                                            DatatableHeader(
                                                   text: "Provider",
                                                   value: "provider",
                                                   show: true,
                                                   sortable: true,
                                                   flex: 2,
                                                   textAlign: TextAlign.left),
                                            DatatableHeader(
                                                   text: "Status",
                                                   value: "status",
                                                   show: true,
                                                   sortable: true,
                                                   flex: 2,
                                                   textAlign: TextAlign.left),
                                            DatatableHeader(
                                                   text: "Environmentid",
                                                   value: "environmentid",
                                                   show: true,
                                                   sortable: true,
                                                   flex: 2,
                                                   textAlign: TextAlign.left),
                                             DatatableHeader(
                                                 text: "Action",
                                                 value: "-",
                                                 flex: 2,
                                                 sortable: false,
                                                 sourceBuilder: (value, row) {
                                                   return Container(
                                                     height: 20,
                                                     alignment: Alignment.center,
                                                     child: DropdownButtonHideUnderline(
                                                       child: new DropdownButton<String>(
                                                        isExpanded:
                                                                displayMobileLayout ? false : true,
                                                         icon: Icon(Icons.more_vert),
                                                         items: <DropdownMenuItem<String>>[
                                                           new DropdownMenuItem(
                                                             child: Row(
                                                                    children: [Icon(Icons.delete_forever_rounded), new Text(' Delete')],
                                                                  ),
                                                             value: 'one',
                                                             onTap: () {
                                                               Future.delayed(
                                                                     Duration.zero,
                                                                     () {
                                                                  showDialog(
                                                                   context: context,
                                                                   builder: (BuildContext context) {
                                                                     return AlertDialog(
                                                                       title: const Text('Please Confirm',
                                                                           style: TextStyle(color: Colors.black)),
                                                                       content: const Text(
                                                                           'Are you sure to delete the data?'),
                                                                       actions: [
                                                                         // The "Yes" button
                                                                         TextButton(
                                                                             onPressed: () {
                                                                               // Remove the box
                                                                               setState(
                                                                                   () {
                                                                                 deleteData(
                                                                                     row);
                                                                               });

                                                                               // Close the dialog
                                                                               Navigator.of(context).pop();
                                                                             },
                                                                             child: const Text('Yes')),
                                                                         TextButton(
                                                                             onPressed: () {
                                                                               // Close the dialog
                                                                               Navigator.of(context).pop();
                                                                             },
                                                                             child: const Text('No'))
                                                                       ],
                                                                     );
                                                                   });
                                                                   });
                                                             },
                                                           ),
                                                           new DropdownMenuItem(
                                                           child: Row(
                                                             children: [Icon(Icons.update), new Text(' Update')],
                                                           ),
                                                             value: 'one',
                                                             onTap: () {
                                                            var  environment = Environment(
                                                                  name: row["name"],
                                                                  profile: row["profile"],
                                                                  region: row["region"],
                                                                  description: row["description"],
                                                                  provider: row["provider"],
                                                                  status: row["status"],
                                                                  environmentid: row["environmentid"],
                                                                  );
                                                                  Future.delayed(Duration.zero, () {
                                                                   showDialog<String>(
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
                                                                                     child: Environments_Page_Page(environment :environment ),
                                                                                     ),
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
                                                                               getData();
                                                                             })
                                                                           }});
                                                                           });


                                                             },
                                                           ),
                                                         ],
                                                         onChanged: (value) {},
                                                       ),
                                                     ),
                                                   );
                                                 },
                                                 textAlign: TextAlign.center),
                                           ],
                            // remove right click options
                            title: Container(
                            child:

                            Expanded(
                               flex: 1,
                               child: Row(
                               children: [
                                Text(
                                   "Environments",

                                   style: TextStyle(
                                     fontWeight: FontWeight.w100,
                                     color: Colors.black,
                                   ),
                                 ),
                                 Spacer(),
                               Container(
                                        alignment: Alignment.centerRight,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.blue,
                                            onPrimary: Colors.white,
                                            shadowColor: Colors.blue,
                                            elevation: 3,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(30.0)),
                                            minimumSize: Size(100, 40),
                                          ),
                                          child: Text("Add"),
                                          onPressed: () {
                                         showDialog<String>(
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
                                                          child: Environments_Page_Page())
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
                                                    getData();
                                                  })
                                                }});

                                          },
                                        ),
                                      ),
                               ]
                               ),
                             ),),
                            titleBackgroundColor: Env.widgetHeaderColor,
                            searchKey: "id",
                            data: _rows,
                          ),
                        ]),
                      ),
                    ),
                  ],
                       
            );
          }
        }

        final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
          onPrimary: Colors.black87,
          primary: Colors.blue[300],
          minimumSize: Size(88, 36),
          padding: EdgeInsets.symmetric(horizontal: 16),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(2)),
          ),
        );