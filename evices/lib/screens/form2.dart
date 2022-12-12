import 'package:flutter/material.dart';
import 'package:evryday/widgets/drawer.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:evices/screens/evices.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class MyFormPage2 extends StatefulWidget {
  const MyFormPage2({super.key});

  @override
  State<MyFormPage2> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage2> {
  final _formKey = GlobalKey<FormState>();
  String? name, phone, address, city, photo, link_gmap;
  TimeOfDay? time_open, time_close;

  void _initFeedback(request) async {
    var data = convert.jsonEncode(
      <String, dynamic>{
        "name": name,
        "phone": phone,
        "address": address,
        "city": city,
        "photo": photo,
        "time_open": time_open,
        "time_close": time_close,
        "link_gmap": link_gmap,
      },
    );

    final response =
        await request.postJson("http://localhost:8000/services/add", data);
    if (response['message'] == 'SUCCESS') {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Feedback berhasil tersimpan"),
      ));
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const ServicesPage()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Gagal!"),
      ));
    }
  }

  //
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new Evices'),
      ),
      drawer: const DrawerComponents(
        currentPage: '',
      ),
      body: Column(
        children: [
          Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: "Nama", border: OutlineInputBorder()),
                      onSaved: (String? value) {
                        setState(() {
                          name = value!;
                        });
                      },
                      onChanged: (String? value) {
                        setState(() {
                          name = value!;
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Nama tak boleh kosong";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: "Nomor Telepon",
                          border: OutlineInputBorder()),
                      onSaved: (String? value) {
                        setState(() {
                          phone = value!;
                        });
                      },
                      onChanged: (String? value) {
                        setState(() {
                          phone = value!;
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Nomor telepon tak boleh kosong";
                        } else if (int.tryParse(value) == null) {
                          return "Nomor telepon harus berupa angka";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: "Alamat", border: OutlineInputBorder()),
                      onSaved: (String? value) {
                        setState(() {
                          address = value!;
                        });
                      },
                      onChanged: (String? value) {
                        setState(() {
                          address = value!;
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Alamat tak boleh kosong";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: "Kota", border: OutlineInputBorder()),
                      onSaved: (String? value) {
                        setState(() {
                          city = value!;
                        });
                      },
                      onChanged: (String? value) {
                        setState(() {
                          city = value!;
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Kota tak boleh kosong";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                        child: Text('Pilih Jam Buka'),
                        onPressed: () async {
                          showTimePicker(
                            context: context,
                            initialTime: TimeOfDay(hour: 10, minute: 30),
                          ).then((time) {
                            setState(() {
                              time_open = time!;
                            });
                          });
                        }),
                    const SizedBox(height: 10),
                    ElevatedButton(
                        child: Text('Pilih Jam Tutup'),
                        onPressed: () async {
                          print("PLISSFDSFJSDFYSDFYUKADGKUFGSDAKJ");
                          showTimePicker(
                            context: context,
                            initialTime: TimeOfDay(hour: 10, minute: 30),
                          ).then((time) {
                            setState(() {
                              time_close = time!;
                            });
                          });
                        }),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: "URL Photo", border: OutlineInputBorder()),
                      onSaved: (String? value) {
                        setState(() {
                          photo = value!;
                        });
                      },
                      onChanged: (String? value) {
                        setState(() {
                          photo = value!;
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "URL Photo tak boleh kosong";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: "Link Google Map",
                          border: OutlineInputBorder()),
                      onSaved: (String? value) {
                        setState(() {
                          link_gmap = value!;
                        });
                      },
                      onChanged: (String? value) {
                        setState(() {
                          link_gmap = value!;
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Link Google Map tak boleh kosong";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  onPressed: () {
                    print("PLISSS");
                    _initFeedback(request);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: const Text(
                      "Simpan",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
