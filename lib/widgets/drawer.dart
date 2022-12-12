// ignore_for_file: use_build_context_synchronously

import 'package:evryday/screens/evishlist/evishlist_home_page.dart';
import 'package:flutter/material.dart';
import 'package:evryday/main.dart';
import 'package:evryday/screens/homepage.dart';
import 'package:evryday/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:evryday/screens/signup.dart';
import 'package:evryday/screens/profile.dart';
// import '../../evishlist/lib/screen/evishlist_home_page.dart';
// import 'package:evices/screens/evices.dart';
import 'package:evryday/screens/findcharge/findcharge_page.dart';
import 'package:provider/provider.dart';

import '../screens/evices/evices.dart';

class DrawerComponents extends StatelessWidget {
  const DrawerComponents({super.key, required this.currentPage});

  final String currentPage;

  Drawer checkLogin(BuildContext context) {
    var currentScreen = Provider.of<ScreenState>(context).getCurrentScreen;
    final request = context.watch<CookieRequest>();
    if (!request.loggedIn) {
      return Drawer(
          child: ListView(
        children: <Widget>[
          ListTile(
            title: Text(
              "Home",
              style: currentScreen == 0
                  ? const TextStyle(fontWeight: FontWeight.bold)
                  : const TextStyle(fontWeight: FontWeight.normal),
            ),
            onTap: () {
              Navigator.of(context).pop();
              if (currentPage != "homepage") {
                Provider.of<ScreenState>(context, listen: false)
                    .setCurrentScreen(0);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              }
            },
          ),
          ListTile(
            title: Text(
              "Login",
              style: currentScreen == 6
                  ? const TextStyle(fontWeight: FontWeight.bold)
                  : const TextStyle(fontWeight: FontWeight.normal),
            ),
            onTap: () {
              Navigator.of(context).pop();
              if (currentPage != "Login") {
                Provider.of<ScreenState>(context, listen: false)
                    .setCurrentScreen(6);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              }
            },
          ),
          ListTile(
            title: Text(
              "Sign Up",
              style: currentScreen == 7
                  ? const TextStyle(fontWeight: FontWeight.bold)
                  : const TextStyle(fontWeight: FontWeight.normal),
            ),
            onTap: () {
              Navigator.of(context).pop();
              if (currentPage != "Sign Up") {
                Provider.of<ScreenState>(context, listen: false)
                    .setCurrentScreen(7);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignUpPage()));
              }
            },
          ),
        ],
      ));
    }
    return Drawer(
        child: ListView(
      children: <Widget>[
        ListTile(
          title: Text(
            "Home",
            style: currentScreen == 0
                ? const TextStyle(fontWeight: FontWeight.bold)
                : const TextStyle(fontWeight: FontWeight.normal),
          ),
          onTap: () {
            Navigator.of(context).pop();
            if (currentPage != "homepage") {
              Provider.of<ScreenState>(context, listen: false)
                  .setCurrentScreen(0);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
            }
          },
        ),
        ListTile(
          title: Text(
            "Find Charge",
            style: currentScreen == 1
                ? const TextStyle(fontWeight: FontWeight.bold)
                : const TextStyle(fontWeight: FontWeight.normal),
          ),
          onTap: () {
            Navigator.of(context).pop();
            if (currentPage != "Find Charge") {
              Provider.of<ScreenState>(context, listen: false)
                  .setCurrentScreen(1);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      //TODO: Ubah ke FindLocationPage()
                      builder: (context) => const MyFindChargePage()));
            }
          },
        ),
        ListTile(
          title: Text(
            "Forums",
            style: currentScreen == 2
                ? const TextStyle(fontWeight: FontWeight.bold)
                : const TextStyle(fontWeight: FontWeight.normal),
          ),
          onTap: () {
            Navigator.of(context).pop();
            if (currentPage != "Forums") {
              Provider.of<ScreenState>(context, listen: false)
                  .setCurrentScreen(2);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
            }
          },
        ),
        ListTile(
          title: Text(
            "Services",
            style: currentScreen == 3
                ? const TextStyle(fontWeight: FontWeight.bold)
                : const TextStyle(fontWeight: FontWeight.normal),
          ),
          onTap: () {
            Navigator.of(context).pop();
            if (currentPage != "Services") {
              Provider.of<ScreenState>(context, listen: false)
                  .setCurrentScreen(3);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      //TODO: Ubah ke ServicesPage()
                      builder: (context) => const ServicesPage()));
            }
          },
        ),
        ListTile(
          title: Text(
            "Wishlist",
            style: currentScreen == 4
                ? const TextStyle(fontWeight: FontWeight.bold)
                : const TextStyle(fontWeight: FontWeight.normal),
          ),
          onTap: () {
            Navigator.of(context).pop();
            if (currentPage != "Wishlist") {
              Provider.of<ScreenState>(context, listen: false)
                  .setCurrentScreen(4);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EvishlistHomePage()));
            }
          },
        ),
        ListTile(
          title: Text(
            "News",
            style: currentScreen == 5
                ? const TextStyle(fontWeight: FontWeight.bold)
                : const TextStyle(fontWeight: FontWeight.normal),
          ),
          onTap: () {
            Navigator.of(context).pop();
            if (currentPage != "News") {
              Provider.of<ScreenState>(context, listen: false)
                  .setCurrentScreen(5);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
            }
          },
        ),
        ListTile(
          title: Text(
            "Profile",
            style: currentScreen == 6
                ? const TextStyle(fontWeight: FontWeight.bold)
                : const TextStyle(fontWeight: FontWeight.normal),
          ),
          onTap: () {
            Navigator.of(context).pop();
            if (currentPage != "Profile") {
              Provider.of<ScreenState>(context, listen: false)
                  .setCurrentScreen(6);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()));
            }
          },
        ),
        ListTile(
          title: Text(
            "Logout",
            style: currentScreen == 7
                ? const TextStyle(fontWeight: FontWeight.bold)
                : const TextStyle(fontWeight: FontWeight.normal),
          ),
          onTap: () async {
            final response = await request
                .logout("https://ev-ryday.up.railway.app/logout-flutter/");
            if (response['status']) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Successfully logged out!"),
              ));
              Provider.of<ScreenState>(context, listen: false)
                  .setCurrentScreen(7);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("An error occured, please try again."),
              ));
            }
          },
        ),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return checkLogin(context);
  }
}
