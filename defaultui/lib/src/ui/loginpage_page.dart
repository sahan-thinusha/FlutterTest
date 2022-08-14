import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'dart:typed_data';
import 'package:defaultui/src/app.dart';
import 'package:defaultui/src/env/env.dart';
import 'package:defaultui/src/constants/PageRoutes.dart';
import 'package:defaultui/src/constants/PageTitles.dart';
import 'package:defaultui/src/route/AppRouteObserver.dart';
import 'package:defaultui/src/route/AppScaffold.dart';
import 'package:defaultui/src/dio/DioException.dart';
import 'package:defaultui/src/dio/DioClient.dart';
import 'package:dio/dio.dart';

class LoginPage_Page extends StatefulWidget {
  const LoginPage_Page();

  @override
  State<LoginPage_Page> createState() => _LoginPage_PageState();
}

class _LoginData {
  String email = '';
  String password = '';
}

class UserData extends _LoginData {
  String token = '';
  String username = '';
  int id = 0;

  void addData(Map<String, dynamic> responseMap) {
    token = responseMap["token"];
    print(token);
  }
}

class _LoginPage_PageState extends State<LoginPage_Page> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  UserData userData = UserData();

  void submit() {
    login();
    //Navigator.of(context).pushNamed(PageRoutes.PAGE_2ZPKEDCWKPUYKIBPBW7DYO);
    //  Navigator.of(context).pushNamed(PageRoutes.PAGE_YEHSCMAXTKZJEWRJGTLTPF);
  }

  //UserData userData;
  Map<String, String> headers = {};
  List<Widget> posts = [];
  @override
  void initState() {
    headers["Authorization"] = 'Bearer ${userData.token}';
    // headers["x-access-token"] = '${userData.username}';
    super.initState();
  }

  void login() async {
    Map data = {'username': userData.email, 'password': userData.password};
    var body = json.encode(data);
    var url = '/api/login';
    await DioClient()
        .post(url,
            options: Options(headers: {"Content-Type": "application/json"}),
            data: body)
        .then((response) {
      Map<String, dynamic> responseMap = json.decode(response.data);
      if (response.statusCode == 200) {
        userData.addData(responseMap);
        //Navigator.of(context).pushNamed(PageRoutes.PAGE_2ZPKEDCWKPUYKIBPBW7DYO);
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text('Login Successfully'),
          action: SnackBarAction(
            label: 'Action',
            onPressed: () {},
          ),
        );
      } else {
        if (responseMap.containsKey("message")) {
          print(responseMap["message"]);
          SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text('Login Failed'),
            action: SnackBarAction(
              label: 'Action',
              onPressed: () {},
            ),
          );
        }
      }
    }).catchError((err) {
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text('Login Failed'),
        action: SnackBarAction(
          label: 'Action',
          onPressed: () {},
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Container(
            constraints: BoxConstraints(maxWidth: 400),
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                    ),
                    Expanded(child: Container()),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      "Login",
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  onSaved: (value) {
                    userData.email = value!;
                  },
                  decoration: InputDecoration(
                      labelText: "Username",
                      hintText: "username",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  onSaved: (value) {
                    userData.password = value!;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "123",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(value: true, onChanged: (value) {}),
                        Text(
                          "Remember Me",
                          style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 104, 103, 103),
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                    Text(
                      "Forget Password",
                      style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 112, 112, 112),
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: login,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xFF3C19C0),
                        borderRadius: BorderRadius.circular(20)),
                    alignment: Alignment.center,
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(text: "Do not have admin credentials? "),
                  TextSpan(
                      text: "Request Credentials! ",
                      style: TextStyle(
                        color: Color(0xFF3C19C0),
                      ))
                ]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
