import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import '../../util/HexColor.dart';
import '../../env/env.dart';
import 'package:defaultui/src/constants/PageRoutes.dart';
import 'package:defaultui/src/constants/PageTitles.dart';
import 'package:defaultui/src/route/AppRouteObserver.dart';



class AppDrawer extends StatefulWidget {
  const AppDrawer({@required this.permanentlyDisplay, Key? key})
      : super(key: key);

  final bool? permanentlyDisplay;

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> with RouteAware {
  String? _selectedRoute;
  AppRouteObserver? _routeObserver;

  var settingOnPressed;

  @override
  void initState() {
    super.initState();
    _routeObserver = AppRouteObserver();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _routeObserver!.subscribe(this, ModalRoute.of(context) as PageRoute);
  }

  @override
  void dispose() {
    _routeObserver!.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPush() {
    _updateSelectedRoute();
  }

  @override
  void didPop() {
    _updateSelectedRoute();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
    width: 250,
     child: Drawer(
      child: Row(
        children: [
          Expanded(
            child: ListView(
              controller: ScrollController(),
              padding: EdgeInsets.zero,
              children: [
   // const UserAccountsDrawerHeader(
                      //   decoration: BoxDecoration(
                      //     color: Color.fromARGB(26, 26, 115, 232),
                      //   ),
                      //   accountName: Text(
                      //     "",
                      //     style: TextStyle(
                      //       fontWeight: FontWeight.bold,
                      //     ),
                      //   ),
                      //   accountEmail: Text(
                      //     " Virtuan",
                      //     style: TextStyle(
                      //       fontWeight: FontWeight.bold,
                      //     ),
                      //   ),
                      //   currentAccountPicture: FlutterLogo(),
                      // ),

                       Container(
                          height: 130,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(26, 26, 115, 232),
                          ),
                          child: Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Row(
                           children: [
                                  Image(
                                      image: NetworkImage(
                                          "https://cutewallpaper.org/24/png-layers/index-of-imagesicons.png"),
                                      height: 50),
                                  Text(
                                    " My App",
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                      fontFamily: "Noto Sans CJK SC",
                                      fontWeight: FontWeight.w200,
                                    ),
                                  ),
                                ],
                          ),
                        ),
                       ),
                       Padding(padding: EdgeInsets.only(bottom: 10)),
                          ListTile(
                          selectedTileColor: Env.menuSelectedColor,
                            title:  Row(
                                       children: [
                                         Icon(Icons.layers,
                                         color: Colors.white,),
                                                 Expanded(
                                                   child:
                                                 Text('   ' + 'Add new project',
                                                 style: TextStyle(color: Colors.white, fontSize: 15),  maxLines: 2,
                                                    softWrap: false,)
                                                 )
                                       ],
                                     ),
                            onTap: () async {
                                await _navigateTo(context, PageRoutes.PAGE_IBHGS6PPPNJAVCWP3ZWNXE);
                            },
                            selected: _selectedRoute == PageRoutes.PAGE_IBHGS6PPPNJAVCWP3ZWNXE,
                            ),

                    
                          ListTile(
                          selectedTileColor: Env.menuSelectedColor,
                            title:  Row(
                                       children: [
                                         Icon(Icons.layers,
                                         color: Colors.white,),
                                                 Expanded(
                                                   child:
                                                 Text('   ' + 'Projects',
                                                 style: TextStyle(color: Colors.white, fontSize: 15),  maxLines: 2,
                                                    softWrap: false,)
                                                 )
                                       ],
                                     ),
                            onTap: () async {
                                await _navigateTo(context, PageRoutes.PAGE_N5CUDTCPJEHAMTCDDDQJ3F);
                            },
                            selected: _selectedRoute == PageRoutes.PAGE_N5CUDTCPJEHAMTCDDDQJ3F,
                            ),

                    
                          ListTile(
                          selectedTileColor: Env.menuSelectedColor,
                            title:  Row(
                                       children: [
                                         Icon(Icons.layers,
                                         color: Colors.white,),
                                                 Expanded(
                                                   child:
                                                 Text('   ' + 'Project Details',
                                                 style: TextStyle(color: Colors.white, fontSize: 15),  maxLines: 2,
                                                    softWrap: false,)
                                                 )
                                       ],
                                     ),
                            onTap: () async {
                                await _navigateTo(context, PageRoutes.PAGE_YEHSCMAXTKZJEWRJGTLTPF);
                            },
                            selected: _selectedRoute == PageRoutes.PAGE_YEHSCMAXTKZJEWRJGTLTPF,
                            ),

                    
              
                
              ],
            ),
          ),
          if (widget.permanentlyDisplay!)
            const VerticalDivider(
              width: 1,
            )
        ],
      ),
      backgroundColor: Env.appDrawerColor,
    ));
  }


  Future<void> _navigateTo(BuildContext context, String routeName) async {
    if (widget.permanentlyDisplay!) {
      Navigator.pop(context);
    }
    await Navigator.pushNamed(context, routeName);
  }

  void _updateSelectedRoute() {
    setState(() {
      _selectedRoute = ModalRoute.of(context)!.settings.name.toString();
    });
  }
}
