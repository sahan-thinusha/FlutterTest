
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' show Client;
import '/src/util/HexColor.dart';
import 'package:flutter/services.dart';
import 'package:defaultui/src/model/Project.dart';
import 'package:defaultui/src/app.dart';
import 'package:defaultui/src/env/env.dart';
import 'package:defaultui/src/constants/PageRoutes.dart';
import 'package:defaultui/src/constants/PageTitles.dart';
import 'package:defaultui/src/route/AppRouteObserver.dart';
import 'package:defaultui/src/route/AppScaffold.dart';


final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class Add_New_Project_Page extends StatefulWidget {
  Project? project;
  dynamic? paramdata;
  Add_New_Project_Page({this.paramdata,this.project} );



  @override
  _Project_PageState createState() => _Project_PageState();
}

class _Project_PageState extends State<Add_New_Project_Page> {
    bool _isLoading = false;
                        bool _isFieldNameValid = false;
                        TextEditingController _controllerName = TextEditingController();
                        bool _isFieldDescriptionValid = false;
                        TextEditingController _controllerDescription = TextEditingController();
                        bool _isFieldNamespaceValid = false;
                        TextEditingController _controllerNamespace = TextEditingController();
                        bool _isFieldVersionValid = false;
                        TextEditingController _controllerVersion = TextEditingController();
                        bool _isFieldPackageValid = false;
                        TextEditingController _controllerPackage = TextEditingController();
                        bool _isFieldProjectuuidValid = false;
                        TextEditingController _controllerProjectuuid = TextEditingController();
    @override
    void initState() {
        super.initState();
    }
    // Initial Selected Value
    
    
    
    
    
    

    @override
  Widget build(BuildContext context) {
      return AppScaffold(
        pageTitle: PageTitles.PAGE_IBHGS6PPPNJAVCWP3ZWNXE,
        body: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: ListView(
   controller: ScrollController(),
          shrinkWrap: true,
          children: <Widget>[
          Container(
                               padding: EdgeInsets.all(5.0),
                               width: MediaQuery.of(context).size.width * 0.23,
                               alignment: Alignment.topLeft,
                               child: Card(  elevation: 2 ,child: Container(
                                 decoration: BoxDecoration(
                                   color: Colors.white,
                                   borderRadius: BorderRadius.circular(5),
                                   border: Border.all(
                                     color: Colors.white,
                                     width: 0,
                                   ),
                                 ),
                                 child: Column(children: [
                   Container(
                             decoration: BoxDecoration(
                                   color: Env.widgetHeaderColor,
                                   borderRadius: const BorderRadius.all(
                                     Radius.circular(5),),

                             ),
                              child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 15),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Add new project",
                                            style: const TextStyle(
                                                 fontWeight: FontWeight.w100,
                                                 color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                           ),
                     Padding(
                       padding: const EdgeInsets.all(16.0),
                       child:Wrap(
                               runSpacing: 2,
                         children: <Widget>[
                                      Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                                       crossAxisAlignment: CrossAxisAlignment.end,
                                        children: <Widget>[
                                            Flexible(
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(right: 10, bottom: 8),
                                                    child:  _buildTextFieldName(),
                                                  ),
                                                ),
                                        ],
                                      ),
                                      Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                                       crossAxisAlignment: CrossAxisAlignment.end,
                                        children: <Widget>[
                                            Flexible(
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(right: 10, bottom: 8),
                                                    child:  _buildTextFieldDescription(),
                                                  ),
                                                ),
                                        ],
                                      ),
                                      Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                                       crossAxisAlignment: CrossAxisAlignment.end,
                                        children: <Widget>[
                                            Flexible(
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(right: 10, bottom: 8),
                                                    child:  _buildTextFieldNamespace(),
                                                  ),
                                                ),
                                        ],
                                      ),
                                      Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                                       crossAxisAlignment: CrossAxisAlignment.end,
                                        children: <Widget>[
                                            Flexible(
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(right: 10, bottom: 8),
                                                    child:  _buildTextFieldVersion(),
                                                  ),
                                                ),
                                        ],
                                      ),
                                      Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                                       crossAxisAlignment: CrossAxisAlignment.end,
                                        children: <Widget>[
                                            Flexible(
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(right: 10, bottom: 8),
                                                    child:  _buildTextFieldPackage(),
                                                  ),
                                                ),
                                        ],
                                      ),
                                      Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                                       crossAxisAlignment: CrossAxisAlignment.end,
                                        children: <Widget>[
                                        ],
                                      ),
                                      Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                                       crossAxisAlignment: CrossAxisAlignment.end,
                                        children: <Widget>[
                                            Flexible(
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(right: 10, bottom: 8),
                                                    child:  _buildTextFieldProjectuuid(),
                                                  ),
                                                ),
                                        ],
                                      ),
                         ],
                       ),
                     ),
                     Padding(
                       padding: const EdgeInsets.all(24.0),
                       child: Row(
                           
                           mainAxisAlignment: MainAxisAlignment.end,
                           

                         children: <Widget>[
                         ],
                       ),
                     ),
                                 ]),
                               ),
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
             
 Widget _buildTextFieldName() {
    return Container(
        padding: const EdgeInsets.only(bottom: 8, top: 3),
        child: TextField(
          controller: _controllerName,
                 keyboardType: TextInputType.text,
        

          decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.edit_note,
            color: Color.fromARGB(179, 37, 37, 37),
            ),
            isDense: true,
            contentPadding: EdgeInsets.symmetric(
              vertical: 18,
              horizontal: 10,
            ),
                   enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                          color: Color.fromARGB(233, 235, 235, 235), width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 178, 192, 212), width: 2),
                    ),
                   border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 178, 192, 212), width: 2),
                   ),

            labelText: " Name ",
            errorText: _isFieldNameValid == false
                ? null
                : "Name is required",
          ),
          onChanged: (value) {
            bool isFieldValid = value.trim().isNotEmpty;
            if (isFieldValid) {
              setState(() => _isFieldNameValid = false);
            }else{
            setState(() => _isFieldNameValid = true);
            }
          },
        ));
  }

             
 Widget _buildTextFieldDescription() {
    return Container(
        padding: const EdgeInsets.only(bottom: 8, top: 3),
        child: TextField(
          controller: _controllerDescription,
                 keyboardType: TextInputType.text,
        

          decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.edit_note,
            color: Color.fromARGB(179, 37, 37, 37),
            ),
            isDense: true,
            contentPadding: EdgeInsets.symmetric(
              vertical: 18,
              horizontal: 10,
            ),
                   enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                          color: Color.fromARGB(233, 235, 235, 235), width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 178, 192, 212), width: 2),
                    ),
                   border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 178, 192, 212), width: 2),
                   ),

            labelText: " Description ",
            errorText: _isFieldDescriptionValid == false
                ? null
                : "Description is required",
          ),
          onChanged: (value) {
            bool isFieldValid = value.trim().isNotEmpty;
            if (isFieldValid) {
              setState(() => _isFieldDescriptionValid = false);
            }else{
            setState(() => _isFieldDescriptionValid = true);
            }
          },
        ));
  }

             
 Widget _buildTextFieldNamespace() {
    return Container(
        padding: const EdgeInsets.only(bottom: 8, top: 3),
        child: TextField(
          controller: _controllerNamespace,
                 keyboardType: TextInputType.text,
        

          decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.edit_note,
            color: Color.fromARGB(179, 37, 37, 37),
            ),
            isDense: true,
            contentPadding: EdgeInsets.symmetric(
              vertical: 18,
              horizontal: 10,
            ),
                   enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                          color: Color.fromARGB(233, 235, 235, 235), width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 178, 192, 212), width: 2),
                    ),
                   border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 178, 192, 212), width: 2),
                   ),

            labelText: " Namespace ",
            errorText: _isFieldNamespaceValid == false
                ? null
                : "Namespace is required",
          ),
          onChanged: (value) {
            bool isFieldValid = value.trim().isNotEmpty;
            if (isFieldValid) {
              setState(() => _isFieldNamespaceValid = false);
            }else{
            setState(() => _isFieldNamespaceValid = true);
            }
          },
        ));
  }

             
 Widget _buildTextFieldVersion() {
    return Container(
        padding: const EdgeInsets.only(bottom: 8, top: 3),
        child: TextField(
          controller: _controllerVersion,
                 keyboardType: TextInputType.text,
        

          decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.edit_note,
            color: Color.fromARGB(179, 37, 37, 37),
            ),
            isDense: true,
            contentPadding: EdgeInsets.symmetric(
              vertical: 18,
              horizontal: 10,
            ),
                   enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                          color: Color.fromARGB(233, 235, 235, 235), width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 178, 192, 212), width: 2),
                    ),
                   border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 178, 192, 212), width: 2),
                   ),

            labelText: " Version ",
            errorText: _isFieldVersionValid == false
                ? null
                : "Version is required",
          ),
          onChanged: (value) {
            bool isFieldValid = value.trim().isNotEmpty;
            if (isFieldValid) {
              setState(() => _isFieldVersionValid = false);
            }else{
            setState(() => _isFieldVersionValid = true);
            }
          },
        ));
  }

             
 Widget _buildTextFieldPackage() {
    return Container(
        padding: const EdgeInsets.only(bottom: 8, top: 3),
        child: TextField(
          controller: _controllerPackage,
                 keyboardType: TextInputType.text,
        

          decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.edit_note,
            color: Color.fromARGB(179, 37, 37, 37),
            ),
            isDense: true,
            contentPadding: EdgeInsets.symmetric(
              vertical: 18,
              horizontal: 10,
            ),
                   enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                          color: Color.fromARGB(233, 235, 235, 235), width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 178, 192, 212), width: 2),
                    ),
                   border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 178, 192, 212), width: 2),
                   ),

            labelText: " Package ",
            errorText: _isFieldPackageValid == false
                ? null
                : "Package is required",
          ),
          onChanged: (value) {
            bool isFieldValid = value.trim().isNotEmpty;
            if (isFieldValid) {
              setState(() => _isFieldPackageValid = false);
            }else{
            setState(() => _isFieldPackageValid = true);
            }
          },
        ));
  }

             
 Widget _buildTextFieldProjectuuid() {
    return Container(
        padding: const EdgeInsets.only(bottom: 8, top: 3),
        child: TextField(
          controller: _controllerProjectuuid,
                 keyboardType: TextInputType.text,
        

          decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.edit_note,
            color: Color.fromARGB(179, 37, 37, 37),
            ),
            isDense: true,
            contentPadding: EdgeInsets.symmetric(
              vertical: 18,
              horizontal: 10,
            ),
                   enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                          color: Color.fromARGB(233, 235, 235, 235), width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 178, 192, 212), width: 2),
                    ),
                   border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 178, 192, 212), width: 2),
                   ),

            labelText: " Projectuuid ",
            errorText: _isFieldProjectuuidValid == false
                ? null
                : "Projectuuid is required",
          ),
          onChanged: (value) {
            bool isFieldValid = value.trim().isNotEmpty;
            if (isFieldValid) {
              setState(() => _isFieldProjectuuidValid = false);
            }else{
            setState(() => _isFieldProjectuuidValid = true);
            }
          },
        ));
  }


}