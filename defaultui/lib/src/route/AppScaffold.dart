import 'package:flutter/material.dart';
import '../../src/ui/navigation_bar/app_drawer.dart';
import '/src/env/env.dart';

/// A responsive scaffold for our application.
/// Displays the navigation drawer alongside the [Scaffold] if the screen/window size is large enough
class AppScaffold extends StatelessWidget {
  const AppScaffold({@required this.body, @required this.pageTitle, Key? key})
      : super(key: key);

  final Widget? body;

  final String? pageTitle;

  @override
  Widget build(BuildContext context) {
    final bool displayMobileLayout = MediaQuery.of(context).size.width < 650;
    return Row(
      children: [
        if (!displayMobileLayout)
          const AppDrawer(
            permanentlyDisplay: true,
          ),
        Expanded(
          child: Scaffold(
              appBar: AppBar(
              iconTheme: IconThemeData(color: Color.fromARGB(255, 26, 115, 232)),
                automaticallyImplyLeading: displayMobileLayout,
                 title: displayMobileLayout
                                 ? Container()
                                     : Container(
                                         width: 300,
                                         height: 45,
                                         decoration: BoxDecoration(
                                             border: Border.all(
                                                 width: 1,
                                                 color: Color.fromARGB(255, 221, 221, 221)),
                                             color: Colors.white,
                                             borderRadius: BorderRadius.circular(20)),
                                         child: Center(
                                           child: TextField(
                                             decoration: InputDecoration(
                                                 prefixIcon: const Icon(Icons.search),
                                                 suffixIcon: IconButton(
                                                   icon: const Icon(Icons.clear),
                                                   onPressed: () {
                                                     /* Clear the search field */
                                                   },
                                                 ),
                                                 hintText: 'Search...',
                                                 border: InputBorder.none),
                                           ),
                                         ),
                                       ),
              //  title: Row(
              //    crossAxisAlignment: CrossAxisAlignment.start,
                //  children: [
                //    Text(
                 //     pageTitle!,
                //     style: TextStyle(
                 //           fontSize: 25,
                  //            color: Colors.grey[800],
                   //           fontWeight: FontWeight.w900,
                  //            fontStyle: FontStyle.normal,
                   //           fontFamily: 'Open Sans',),
                  //  ),
                   //Icon(Icons.home),
                   //Icon(Icons.navigate_next),
                    //Text(pageTitle!),
                //  ],
             //   ),
                       actions: displayMobileLayout
                                     ? <Widget>[
                                         InkWell(
                                             onTap: () {
                                               print('Click Profile Pic');
                                             },
                                             child: Padding(
                                               padding: EdgeInsets.all(10),
                                               child: Container(
                                                 decoration: BoxDecoration(
                                                   color: Colors.white,
                                                 ),
                                                 width: 75,
                                                 alignment: Alignment.centerLeft,
                                                 child: DropdownButtonHideUnderline(
                                                   child: new DropdownButton<String>(
                                                     iconSize: 24,
                                                     isExpanded: true,
                                                     elevation: 16,
                                                     focusColor: Colors.white,
                                                     dropdownColor: Colors.white,
                                                     alignment: Alignment.centerLeft,
                                                     icon: Image.network(
                                                         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkSQpuRwKcQD_-_2yf6EGsw56SsFVa4jdKaQ&usqp=CAU"),
                                                     items: <DropdownMenuItem<String>>[
                                                       new DropdownMenuItem(
                                                         child: new Text('Profile'),
                                                         value: 'one',
                                                         onTap: () {
                                                           print("Profile");
                                                         },
                                                       ),
                                                       new DropdownMenuItem(
                                                         child: new Text('Logo out'),
                                                         value: 'one',
                                                         onTap: () {
                                                           print("Log out");
                                                         },
                                                       ),
                                                     ],
                                                     onChanged: (value) {},
                                                   ),
                                                 ),
                                               ),
                                             ))
                                       ]
                                     : [
                                         IconButton(
                                           padding: EdgeInsets.all(10.0),
                                           icon: Icon(
                                             Icons.message,
                                             color: Colors.green[900],
                                           ),
                                           onPressed: () {
                                             // Implement navigation to shopping cart page here...
                                             print('Click Action2');
                                           },
                                         ),
                                         IconButton(
                                           padding: EdgeInsets.all(10.0),
                                           icon: Icon(
                                             Icons.notification_important_sharp,
                                             color: Colors.yellow[900],
                                           ),
                                           onPressed: () {
                                             // Implement navigation to shopping cart page here...
                                             print('Click Action2');
                                           },
                                         ),
                                         IconButton(
                                           padding: EdgeInsets.all(10.0),
                                           icon: Icon(
                                             Icons.settings,
                                             color: Colors.blue[900],
                                           ),
                                           onPressed: () {
                                             // Implement navigation to shopping cart page here...
                                             print('Click Action3');
                                           },
                                         ),
                                         InkWell(
                                             onTap: () {
                                               print('Click Profile Pic');
                                             },
                                             child: Padding(
                                               padding: EdgeInsets.all(10),
                                               child: Container(
                                                 decoration: BoxDecoration(
                                                   color: Colors.white,
                                                 ),
                                                 width: 75,
                                                 alignment: Alignment.centerLeft,
                                                 child: DropdownButtonHideUnderline(
                                                   child: new DropdownButton<String>(
                                                     iconSize: 24,
                                                     isExpanded: true,
                                                     elevation: 16,
                                                     focusColor: Colors.white,
                                                     dropdownColor: Colors.white,
                                                     alignment: Alignment.centerLeft,
                                                     icon: Image.network(
                                                         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkSQpuRwKcQD_-_2yf6EGsw56SsFVa4jdKaQ&usqp=CAU"),
                                                     items: <DropdownMenuItem<String>>[
                                                       new DropdownMenuItem(
                                                         child: new Text('Profile'),
                                                         value: 'one',
                                                         onTap: () {
                                                           print("Profile");
                                                         },
                                                       ),
                                                       new DropdownMenuItem(
                                                         child: new Text('Logo out'),
                                                         value: 'one',
                                                         onTap: () {
                                                           print("Log out");
                                                         },
                                                       ),
                                                     ],
                                                     onChanged: (value) {},
                                                   ),
                                                 ),
                                               ),
                                             ))
                                       ],
                                backgroundColor:
                                    displayMobileLayout ? Colors.white : Colors.white,
                                // flexibleSpace: Container(
                                //   decoration: const BoxDecoration(
                                //     gradient: LinearGradient(
                                //         begin: const FractionalOffset(0.0, 0.0),
                                //         end: const FractionalOffset(1.0, 0.0),
                                //         stops: [
                                //           0.0,
                                //           1.0
                                //         ],
                                //         colors: <Color>[
                                //           const Color(0xFF3366FF),
                                //           const Color(0xFF00CCFF),
                                //         ]),
                                //   ),
                                // ),
                elevation: 5,
              ),
              drawer: displayMobileLayout
                  ? const AppDrawer(
                      permanentlyDisplay: false,
                    )
                  : null,
              body: Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: body,
                  )

              ),
        )
      ],
    );
  }
}
