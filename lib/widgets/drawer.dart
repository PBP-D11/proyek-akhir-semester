import 'package:flutter/material.dart';
import 'package:evryday/main.dart';
import 'package:evryday/screens/homepage.dart';
import '../../evishlist/lib/screen/evishlist_home_page.dart';
import 'package:provider/provider.dart';

class DrawerComponents extends StatelessWidget {
  const DrawerComponents({super.key, required this.currentPage});

  final String currentPage;

  @override
  Widget build(BuildContext context) {
    var currentScreen = Provider.of<ScreenState>(context).getCurrentScreen;

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
            "Find Location",
            style: currentScreen == 1
                ? const TextStyle(fontWeight: FontWeight.bold)
                : const TextStyle(fontWeight: FontWeight.normal),
          ),
          onTap: () {
            Navigator.of(context).pop();
            if (currentPage != "Find Location") {
              Provider.of<ScreenState>(context, listen: false)
                  .setCurrentScreen(1);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FindLocationPage()));
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
                  MaterialPageRoute(builder: (context) => const ForumsPage()));
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
                  MaterialPageRoute(builder: (context) => const NewsPage()));
            }
          },
        ),
      ],
    ));
  }
}
