import 'package:flutter/material.dart';
import 'package:evryday/widgets/drawer.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  final String title = "Counter 7";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  

  String checkTitle(dynamic username) {
    if (username == null) {
      return "Welcome to EV-ryday";
    }
    return "Hello, $username!";
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      backgroundColor: Color.fromRGBO(30, 30, 44, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(42, 44, 62, 1),
        title: Text(checkTitle(request.getJsonData()['username'])),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: null /* add child content here */,
      ),
      drawer: const DrawerComponents(currentPage: "homepage"),
    );
  }
}
