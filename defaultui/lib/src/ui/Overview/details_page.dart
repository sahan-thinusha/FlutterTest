
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:defaultui/src/constants/PageRoutes.dart';
import 'package:defaultui/src/constants/PageTitles.dart';
import 'package:defaultui/src/route/AppRouteObserver.dart';
import 'package:defaultui/src/route/AppScaffold.dart';
import 'package:defaultui/src/env/env.dart';

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class Details_Page  extends StatefulWidget {
dynamic? paramdata;
Details_Page({this.paramdata});



  @override
  _Customer_PageState createState() => _Customer_PageState();
}

class _Customer_PageState extends State<Details_Page> {
  bool _isLoading = false;

  var data;
    final nameController = TextEditingController();
  
    final descriptionController = TextEditingController();
  
    final namespaceController = TextEditingController();
  
    final versionController = TextEditingController();
  
    final packageController = TextEditingController();
  
  Future getDetails_Page() async {

    Client client = Client();
    final res = await client.get(
      Uri.parse(Env.baseurl+"/projectmgmservice/api/findprojectdetailsapi").replace(queryParameters: widget.paramdata),
      headers: {"content-type": "application/json"},
    );
    if (res.statusCode >= 200 && res.statusCode <= 204) {
      data = jsonDecode(res.body);
          nameController.text = data["name"].toString();
          descriptionController.text = data["description"].toString();
          namespaceController.text = data["namespace"].toString();
          versionController.text = data["version"].toString();
          packageController.text = data["package"].toString();

     } else {
       ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
           content: Text("Data Loading Error!"),
         ),
       );
     }
   }
    setDetails_Page() async {
      await getDetails_Page();
      setState(() {});
    }

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) => setDetails_Page());
    super.initState();


  }


  @override
  Widget build(BuildContext context) {
      return  Padding(
               padding: EdgeInsets.all(10),
               child:  Card(
                    elevation: 1,
      child: ListView(
                shrinkWrap: true,
                controller: ScrollController(),
                padding: EdgeInsets.all(5),
          children: <Widget>[
                     Container(
                        decoration: BoxDecoration(
                          color: Env.widgetHeaderColor,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 9, horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                   "Details",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w100,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
          //  _buildDetailCardHeading("Project"),
                    _buildDetailCardName(nameController.text),
                    _buildDetailCardDescription(descriptionController.text),
                    _buildDetailCardNamespace(namespaceController.text),
                    _buildDetailCardVersion(versionController.text),
                    _buildDetailCardPackage(packageController.text),


            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[],
              ),
            ),
            _isLoading
                ? Stack(
                    children: <Widget>[
                      Opacity(
                        opacity: 0.3,
                        child: ModalBarrier(
                          dismissible: false,
                          color: Colors.grey,
                        ),
                      ),
                      Center(
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  )
                : Container(),
          ],
             ),
             ),
    );
  }
  Widget _buildDetailCardHeading(data) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 10),
      child: Container(
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
          //border: Border.all(color: Colors.black),
          color: Colors.blue,
        ),
        child: Row(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(data,    style: TextStyle(
                                 fontSize: 18,
                                 fontWeight: FontWeight.bold,
                                 color: Colors.white),),
            )),
          ],
        ),
      ),
    );
  }
              
  Widget _buildDetailCardName(field){
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(bottom: BorderSide(color: Colors.grey))),
        child: Row(
          children: [
            Expanded(
              child: Text("Name"),
              flex: 1,
            ),
            Expanded(
              child: Text(field ?? "-"),
              flex: 2,
            )
          ],
        ),
      ),
    );
  }


              
  Widget _buildDetailCardDescription(field){
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(bottom: BorderSide(color: Colors.grey))),
        child: Row(
          children: [
            Expanded(
              child: Text("Description"),
              flex: 1,
            ),
            Expanded(
              child: Text(field ?? "-"),
              flex: 2,
            )
          ],
        ),
      ),
    );
  }


              
  Widget _buildDetailCardNamespace(field){
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(bottom: BorderSide(color: Colors.grey))),
        child: Row(
          children: [
            Expanded(
              child: Text("Namespace"),
              flex: 1,
            ),
            Expanded(
              child: Text(field ?? "-"),
              flex: 2,
            )
          ],
        ),
      ),
    );
  }


              
  Widget _buildDetailCardVersion(field){
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(bottom: BorderSide(color: Colors.grey))),
        child: Row(
          children: [
            Expanded(
              child: Text("Version"),
              flex: 1,
            ),
            Expanded(
              child: Text(field ?? "-"),
              flex: 2,
            )
          ],
        ),
      ),
    );
  }


              
  Widget _buildDetailCardPackage(field){
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(bottom: BorderSide(color: Colors.grey))),
        child: Row(
          children: [
            Expanded(
              child: Text("Package"),
              flex: 1,
            ),
            Expanded(
              child: Text(field ?? "-"),
              flex: 2,
            )
          ],
        ),
      ),
    );
  }


}