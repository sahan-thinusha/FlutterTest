
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' show Client;
import '/src/util/HexColor.dart';
import 'package:flutter/services.dart';
import 'package:defaultui/src/model/Environment.dart';
import 'package:defaultui/src/app.dart';
import 'package:defaultui/src/env/env.dart';
import 'package:defaultui/src/constants/PageRoutes.dart';
import 'package:defaultui/src/constants/PageTitles.dart';
import 'package:defaultui/src/route/AppRouteObserver.dart';
import 'package:defaultui/src/route/AppScaffold.dart';


final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class Environments_Page_Page extends StatefulWidget {
  Environment? environment;
  dynamic? paramdata;
  Environments_Page_Page({this.paramdata,this.environment} );



  @override
  _Environment_PageState createState() => _Environment_PageState();
}

class _Environment_PageState extends State<Environments_Page_Page> {
    bool _isLoading = false;
                        bool _isFieldNameValid = false;
                        TextEditingController _controllerName = TextEditingController();
                        bool _isFieldProfileValid = false;
                        TextEditingController _controllerProfile = TextEditingController();
                        bool _isFieldRegionValid = false;
                        TextEditingController _controllerRegion = TextEditingController();
                        bool _isFieldDescriptionValid = false;
                        TextEditingController _controllerDescription = TextEditingController();
                        bool _isFieldProviderValid = false;
                        TextEditingController _controllerProvider = TextEditingController();
                        bool _isFieldStatusValid = false;
                        TextEditingController _controllerStatus = TextEditingController();
                        bool _isFieldEnvironmentidValid = false;
                        TextEditingController _controllerEnvironmentid = TextEditingController();
    @override
    void initState() {
        if (widget.environment != null) {
                
                    _isFieldNameValid = false;
                    _controllerName.text = widget.environment!.name.toString();
                    _isFieldProfileValid = false;
                    _controllerProfile.text = widget.environment!.profile.toString();
                    _isFieldRegionValid = false;
                    _controllerRegion.text = widget.environment!.region.toString();
                    _isFieldDescriptionValid = false;
                    _controllerDescription.text = widget.environment!.description.toString();
                    _isFieldProviderValid = false;
                    _controllerProvider.text = widget.environment!.provider.toString();
                    _isFieldStatusValid = false;
                    _controllerStatus.text = widget.environment!.status.toString();
                    _isFieldEnvironmentidValid = false;
                    _controllerEnvironmentid.text = widget.environment!.environmentid.toString();
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
                                            "Environments_Page",
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
                                    _buildTextFieldProfile(),
                                    _buildTextFieldRegion(),
                                    _buildTextFieldDescription(),
                                    _buildTextFieldProvider(),
                                    _buildTextFieldStatus(),
                                    _buildTextFieldEnvironmentid(),
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
                                 widget.environment == null
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
                                 widget.environment == null
                                     ? "Submit".toUpperCase()
                                     : "Update".toUpperCase(),
                                 style: TextStyle(
                                   color: Colors.white,
                                 ),
                               ),
                               onPressed: () {
                                     if ( _isFieldNameValid == true ||
                                                    _isFieldNameValid || _isFieldProfileValid == true ||
                                                    _isFieldProfileValid || _isFieldRegionValid == true ||
                                                    _isFieldRegionValid || _isFieldDescriptionValid == true ||
                                                    _isFieldDescriptionValid || _isFieldProviderValid == true ||
                                                    _isFieldProviderValid || _isFieldStatusValid == true ||
                                                    _isFieldStatusValid || _isFieldEnvironmentidValid == true ||
                                                    _isFieldEnvironmentidValid)
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
                                  
                                         String profile = _controllerProfile.text.toString();
                                  
                                         String region = _controllerRegion.text.toString();
                                  
                                         String description = _controllerDescription.text.toString();
                                  
                                         String provider = _controllerProvider.text.toString();
                                  
                                         String status = _controllerStatus.text.toString();
                                  
                                         String environmentid = _controllerEnvironmentid.text.toString();
                                  


                                 Environment environment = Environment(
                                          name : name,
                                     
                                          profile : profile,
                                     
                                          region : region,
                                     
                                          description : description,
                                     
                                          provider : provider,
                                     
                                          status : status,
                                     
                                          environmentid : environmentid,
                                     
                                 );
                                 if (widget.environment == null) {

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

             
 Widget _buildTextFieldProfile() {
    return Container(
        padding: const EdgeInsets.only(bottom: 8, top: 3),
        child: TextField(
          controller: _controllerProfile,
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

            labelText: " Profile ",
            errorText: _isFieldProfileValid == false
                ? null
                : "Profile is required",
          ),
          onChanged: (value) {
            bool isFieldValid = value.trim().isNotEmpty;
            if (isFieldValid) {
              setState(() => _isFieldProfileValid = false);
            }else{
            setState(() => _isFieldProfileValid = true);
            }
          },
        ));
  }

             
 Widget _buildTextFieldRegion() {
    return Container(
        padding: const EdgeInsets.only(bottom: 8, top: 3),
        child: TextField(
          controller: _controllerRegion,
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

            labelText: " Region ",
            errorText: _isFieldRegionValid == false
                ? null
                : "Region is required",
          ),
          onChanged: (value) {
            bool isFieldValid = value.trim().isNotEmpty;
            if (isFieldValid) {
              setState(() => _isFieldRegionValid = false);
            }else{
            setState(() => _isFieldRegionValid = true);
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

             
 Widget _buildTextFieldProvider() {
    return Container(
        padding: const EdgeInsets.only(bottom: 8, top: 3),
        child: TextField(
          controller: _controllerProvider,
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

            labelText: " Provider ",
            errorText: _isFieldProviderValid == false
                ? null
                : "Provider is required",
          ),
          onChanged: (value) {
            bool isFieldValid = value.trim().isNotEmpty;
            if (isFieldValid) {
              setState(() => _isFieldProviderValid = false);
            }else{
            setState(() => _isFieldProviderValid = true);
            }
          },
        ));
  }

             
 Widget _buildTextFieldStatus() {
    return Container(
        padding: const EdgeInsets.only(bottom: 8, top: 3),
        child: TextField(
          controller: _controllerStatus,
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

            labelText: " Status ",
            errorText: _isFieldStatusValid == false
                ? null
                : "Status is required",
          ),
          onChanged: (value) {
            bool isFieldValid = value.trim().isNotEmpty;
            if (isFieldValid) {
              setState(() => _isFieldStatusValid = false);
            }else{
            setState(() => _isFieldStatusValid = true);
            }
          },
        ));
  }

             
 Widget _buildTextFieldEnvironmentid() {
    return Container(
        padding: const EdgeInsets.only(bottom: 8, top: 3),
        child: TextField(
          controller: _controllerEnvironmentid,
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

            labelText: " Environmentid ",
            errorText: _isFieldEnvironmentidValid == false
                ? null
                : "Environmentid is required",
          ),
          onChanged: (value) {
            bool isFieldValid = value.trim().isNotEmpty;
            if (isFieldValid) {
              setState(() => _isFieldEnvironmentidValid = false);
            }else{
            setState(() => _isFieldEnvironmentidValid = true);
            }
          },
        ));
  }


}