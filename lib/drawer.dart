import 'package:evryday/common/forumqueries/Forum.dart';
import 'package:evryday/main.dart';
import 'package:evryday/screencs/evorums/evorums.dart';
// import 'package:evryday/screencs/evorums/forum.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Menambahkan  menu
          ListTile(
            title: const Text('Counter'),
            onTap: () {
              // wiring menu ke halaman utama
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MyHomePage(
                          title: "Program Counter",
                        )),
              );
            },
          ),
          ListTile(
            title: Row(
              children: const [Text('Evorums')],
            ),
            onTap: () {
              // Route menu ke halaman utama
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const InForum()),
              );
            },
          ),
        ],
      ),
    );
  }
}
