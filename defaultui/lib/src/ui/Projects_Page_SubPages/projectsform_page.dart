
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

class ProjectsForm_Page extends StatefulWidget {
  Project? project;
  dynamic? paramdata;
  ProjectsForm_Page({this.paramdata,this.project} );



  @override
  _Project_PageState createState() => _Project_PageState();
}

class _Project_PageState extends State<ProjectsForm_Page> {
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
        if (widget.project != null) {
                
                    _isFieldNameValid = false;
                    _controllerName.text = widget.project!.name.toString();
                    _isFieldDescriptionValid = false;
                    _controllerDescription.text = widget.project!.description.toString();
                    _isFieldNamespaceValid = false;
                    _controllerNamespace.text = widget.project!.namespace.toString();
                    _isFieldVersionValid = false;
                    _controllerVersion.text = widget.project!.version.toString();
                    _isFieldPackageValid = false;
                    _controllerPackage.text = widget.project!.package.toString();
                    _isFieldProjectuuidValid = false;
                    _controllerProjectuuid.text = widget.project!.projectuuid.toString();
        }
        super.initState();
    }
    // Initial Selected Value
    
    
    
    
    
    

    @override
  Widget build(BuildContext context) {
  return  ListView(
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
                                            "ProjectsForm",
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
                                    _buildTextFieldName(),
                                    _buildTextFieldDescription(),
                                    _buildTextFieldNamespace(),
                                    _buildTextFieldVersion(),
                                    _buildTextFieldPackage(),
                                    _buildTextFieldProjectuuid(),
                         ],
                       ),
                     ),
                     Padding(
                       padding: const EdgeInsets.all(24.0),
                       child: Row(
                           
                           mainAxisAlignment: MainAxisAlignment.end,
                           

                         children: <Widget>[

                           SizedBox(
                             width: 100.0,
                             child: ElevatedButton(
                               style: ElevatedButton.styleFrom(
                                 primary: Color.fromARGB(255, 162, 179, 192),
                                 onPrimary: Colors.white,
                                 shadowColor: Colors.blue,
                                 elevation: 3,
                                 shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(30.0)),
                                 minimumSize: Size(100, 40),
                               ),
                               child: Text(
                                 widget.project == null
                                     ? "Cancel".toUpperCase()
                                     : "Cancel".toUpperCase(),
                                 style: TextStyle(
                                   color: Colors.white,
                                 ),
                               ),
                               onPressed: () {},
                             ),
                           ),
                           SizedBox(
                             width: 10.0,
                           ),
                           SizedBox(
                             width: 100.0,
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
                               child: Text(
                                 widget.project == null
                                     ? "Submit".toUpperCase()
                                     : "Update".toUpperCase(),
                                 style: TextStyle(
                                   color: Colors.white,
                                 ),
                               ),
                               onPressed: () {
                                     if ( _isFieldNameValid == true ||
                                                    _isFieldNameValid || _isFieldDescriptionValid == true ||
                                                    _isFieldDescriptionValid || _isFieldNamespaceValid == true ||
                                                    _isFieldNamespaceValid || _isFieldVersionValid == true ||
                                                    _isFieldVersionValid || _isFieldPackageValid == true ||
                                                    _isFieldPackageValid || _isFieldProjectuuidValid == true ||
                                                    _isFieldProjectuuidValid)
                                           {
                                       ScaffoldMessenger.of(context).showSnackBar(
                                         SnackBar(
                                           content: Text("Please fill all fields"),
                                         ),
                                       );
                                       return;
}
                                 setState(() => _isLoading = true);
                                         String name = _controllerName.text.toString();
                                  
                                         String description = _controllerDescription.text.toString();
                                  
                                         String namespace = _controllerNamespace.text.toString();
                                  
                                         String version = _controllerVersion.text.toString();
                                  
                                         String package = _controllerPackage.text.toString();
                                  
                                         String projectuuid = _controllerProjectuuid.text.toString();
                                  


                                 Project project = Project(
                                          name : name,
                                     
                                          description : description,
                                     
                                          namespace : namespace,
                                     
                                          version : version,
                                     
                                          package : package,
                                     
                                          projectuuid : projectuuid,
                                     
                                 );
                                 if (widget.project == null) {

                                 } else {


                                 }
                               },
                             ),
                           ),
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