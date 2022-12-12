import 'package:evryday/drawer.dart';
import 'package:evryday/screencs/evorums/evorums.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:evryday/common/forumqueries/post_forum.dart';
// import 'package:start_in_mobile/pages/home.dart';
// import 'package:start_in_mobile/queries/auth_login.dart';
// import 'package:start_in_mobile/queries/post_forum.dart';

class ForumForm extends StatefulWidget {
  const ForumForm({super.key});

  @override
  State<ForumForm> createState() => _ForumFormState();
}

class _ForumFormState extends State<ForumForm> {
  final _forumFormKey = GlobalKey<FormState>();

  String title = "";
  String content = "";
  String defaulCategory = "misc";
  List<String> categories = ["misc", "technology", "startup", "business"];

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    // The rest of your widgets are down below
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 40, 44, 62),
      appBar: AppBar(
        title: Text('Create Forum'),
      ),
      drawer: AppDrawer(),
      body: Form(
        key: _forumFormKey,
        child: SingleChildScrollView(
          child: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Judul",
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 14,
                      )),
                  const SizedBox(
                    height: 2,
                    child: const DecoratedBox(
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 47, 49, 66))),
                  ),
                  TextFormField(
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    maxLength: 100,
                    decoration: InputDecoration(
                      hintText: "title",
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                      fillColor: const Color.fromARGB(255, 47, 49, 66),
                      filled: true,
                      // fillColor: const Color.fromARGB(255, 47, 49, 66),
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        title = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        title = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Judul tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 6),
                  // const Text("Category",
                  //     style: TextStyle(
                  //       color: Color.fromARGB(255, 255, 255, 255),
                  //       fontSize: 14,
                  //     )),
                  // const SizedBox(height: 2),
                  // DropdownButton(
                  //     dropdownColor: Color.fromARGB(255, 85, 97, 255),
                  //     value: defaulCategory,
                  //     icon: const Icon(Icons.keyboard_arrow_down),
                  //     items: categories.map((String cat) {
                  //       return DropdownMenuItem(
                  //         value: cat,
                  //         child: Text(cat),
                  //       );
                  //     }).toList(),
                  //     onChanged: (String? newVal) {
                  //       setState(() {
                  //         defaulCategory = newVal!;
                  //       });
                  //     }),
                  const SizedBox(height: 6),
                  const Text("Content",
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 14,
                      )),
                  const SizedBox(height: 2),
                  TextFormField(
                    maxLength: 1000,
                    maxLines: 10,
                    decoration: InputDecoration(
                      fillColor: const Color.fromARGB(255, 47, 49, 66),
                      filled: true,
                      hintText: "share your thought",
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        content = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        content = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Judul tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 85, 97, 255)),
                    ),
                    onPressed: () async {
                      if (_forumFormKey.currentState!.validate()) {
                        postForum(request, title, defaulCategory, content);
                        _forumFormKey.currentState!.reset();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const InForum()));
                      }
                    },
                    child: const Text(
                      "create",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
