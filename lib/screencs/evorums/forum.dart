import 'package:evryday/common/forumqueries/get_all_comment.dart';
import 'package:evryday/common/forumqueries/post_comment.dart';
import 'package:evryday/drawer.dart';
import 'package:flutter/material.dart';
import 'package:evryday/common/forumqueries/Forum.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ForumPage extends StatefulWidget {
  Forum data;

  ForumPage({super.key, required this.data});

  @override
  _ForumPageState createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  final _commentFormKey = GlobalKey<FormState>();
  String comment = '';
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
        appBar: AppBar(
            title: const Text(
          "evorum",
          style: TextStyle(color: Colors.white),
        )),
        drawer: const AppDrawer(),
        body: Container(
          color: Color.fromARGB(255, 30, 30, 44),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 47, 49, 66),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.data.fields.title,
                      style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Text("${widget.data.fields.timestamp}",
                            style: const TextStyle(
                                fontSize: 12.0,
                                color: Color.fromARGB(255, 255, 255, 255))),
                        const Text(" - "),
                        Text(widget.data.fields.author.toString(),
                            style: const TextStyle(
                                fontSize: 12.0,
                                color: Color.fromARGB(255, 255, 255, 255))),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(widget.data.fields.body,
                        style: const TextStyle(
                            fontSize: 14.0,
                            color: Color.fromARGB(255, 255, 255, 255)))
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("comments",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Color.fromARGB(248, 255, 255, 255),
                              fontWeight: FontWeight.bold,
                            )),
                        Form(
                          key: _commentFormKey,
                          child: TextFormField(
                            enabled: request.loggedIn,
                            decoration: InputDecoration(
                              hintText: request.loggedIn
                                  ? "leave a comment"
                                  : "login to reply",
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255)),
                              // Menambahkan circular border agar lebih rapi
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                            // Menambahkan behavior saat nama diketik
                            onChanged: request.loggedIn
                                ? (String? value) {
                                    setState(() {
                                      comment = value!;
                                    });
                                  }
                                : null,
                            // Menambahkan behavior saat data disimpan
                            onSaved: request.loggedIn
                                ? (String? value) {
                                    print("comment");
                                    setState(() {
                                      comment = value!;
                                    });
                                  }
                                : null,
                            // Validator sebagai validasi form
                            onFieldSubmitted: (value) => {
                              if (_commentFormKey.currentState!.validate())
                                {
                                  postComment(request, widget.data.pk, comment),
                                  _commentFormKey.currentState!.reset(),
                                  print('validated')
                                },
                              print(' tidak validated')
                            },
                            validator: request.loggedIn
                                ? (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return 'comment tidak boleh kosong';
                                    }
                                    return null;
                                  }
                                : null,
                          ),
                        ),
                      ])),
              Expanded(
                child: FutureBuilder(
                    future: get_all_comment(widget.data.pk),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.data == null) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        if (!snapshot.hasData) {
                          return Column(
                            children: const [
                              Text(
                                "Forum hadn't initiated",
                                style: TextStyle(
                                    color: Color(0xff59A5D8), fontSize: 20),
                              ),
                              SizedBox(height: 8),
                            ],
                          );
                        } else {
                          return ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (_, index) => InkWell(
                                      child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4, vertical: 10),
                                    decoration: const BoxDecoration(
                                      color: Color.fromARGB(255, 47, 49, 66),
                                      border: Border(
                                          bottom: BorderSide(
                                              width: 1.5, color: Colors.grey)),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            "${snapshot.data![index].fields.author}",
                                            style: const TextStyle(
                                                fontSize: 14.0,
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255),
                                                fontWeight: FontWeight.bold)),
                                        const SizedBox(height: 2),
                                        Row(
                                          children: [
                                            Text(
                                                "${snapshot.data![index].fields.timestamp}",
                                                style: const TextStyle(
                                                    fontSize: 12.0,
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255))),
                                          ],
                                        ),
                                        const SizedBox(height: 12),
                                        Text(
                                            "${snapshot.data![index].fields.body}",
                                            style: const TextStyle(
                                                fontSize: 14.0,
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255)))
                                      ],
                                    ),
                                  )));
                        }
                      }
                    }),
              ),
            ],
          ),
        ));
  }
}
