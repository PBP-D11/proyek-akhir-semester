import 'dart:convert';

import 'package:evryday/screens/homepage.dart';
import 'package:evryday/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:evryday/models/profile_model.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Future<Map<String, dynamic>> fetchProfile() async {
    var username = context.watch<CookieRequest>().jsonData['username'];
    final response = await CookieRequest().get(
        "https://ev-ryday.up.railway.app/profile-json-flutter/?username=$username");
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Profile'),
        ),
        drawer: const DrawerComponents(currentPage: "profile"),
        body: FutureBuilder(
          future: fetchProfile(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              Map<String, dynamic> myMap = snapshot.data;
              return Column(
                children: [
                  AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    toolbarHeight: 10,
                  ),
                  const Center(
                      child: Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Text(
                            'My Profile',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                            ),
                          ))),
                  const Center(
                      child: Icon(Icons.account_circle_rounded,
                          size: 100, color: Colors.black26)),
                  Center(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          child: Row(children: [
                        Expanded(
                            child: Center(
                                child: Text(
                          myMap['username'],
                          style: const TextStyle(fontSize: 16, height: 1.4),
                        ))),
                      ]))
                    ],
                  )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          child: Row(children: [
                        Expanded(
                            child: Center(
                                child: Text(
                          myMap['full_name'],
                          style: const TextStyle(fontSize: 16, height: 1.4),
                        ))),
                      ])),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          child: Row(children: [
                        Expanded(
                            child: Center(
                                child: Text(
                          myMap['contributor'] ? "Contributor" : "User",
                          style: const TextStyle(fontSize: 16, height: 1.4),
                        ))),
                      ])),
                    ],
                  ),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 10, top: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "First Name",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(
                            height: 1,
                          ),
                          Container(
                              width: 350,
                              height: 40,
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                color: Colors.grey,
                                width: 1,
                              ))),
                              child: Row(children: [
                                Expanded(
                                    child: Text(
                                  myMap['first_name'],
                                  style: const TextStyle(
                                      fontSize: 16, height: 1.4),
                                )),
                              ]))
                        ],
                      )),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Last Name",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(
                            height: 1,
                          ),
                          Container(
                              width: 350,
                              height: 40,
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                color: Colors.grey,
                                width: 1,
                              ))),
                              child: Row(children: [
                                Expanded(
                                    child: Text(
                                  myMap['last_name'],
                                  style: const TextStyle(
                                      fontSize: 16, height: 1.4),
                                )),
                              ]))
                        ],
                      )),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Email",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(
                            height: 1,
                          ),
                          Container(
                              width: 350,
                              height: 40,
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                color: Colors.grey,
                                width: 1,
                              ))),
                              child: Row(children: [
                                Expanded(
                                    child: Text(
                                  myMap['email'],
                                  style: const TextStyle(
                                      fontSize: 16, height: 1.4),
                                )),
                              ]))
                        ],
                      )),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Phone Number",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(
                            height: 1,
                          ),
                          Container(
                              width: 350,
                              height: 40,
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                color: Colors.grey,
                                width: 1,
                              ))),
                              child: Row(children: [
                                Expanded(
                                    child: Text(
                                  myMap['phone'],
                                  style: const TextStyle(
                                      fontSize: 16, height: 1.4),
                                )),
                              ]))
                        ],
                      )),
                ],
              );
            }
          },
        ));
  }
}
