import 'package:flutter/material.dart';
import 'package:evryday/widgets/drawer.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../evices/evices.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class MyFormPage2 extends StatefulWidget {
  const MyFormPage2({super.key});

  @override
  State<MyFormPage2> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage2> {
  final _formKey = GlobalKey<FormState>();
  String name="", phone="", address="", city="", photo="", link_gmap="", time_open="", time_close="";

  TextEditingController timeinputOpen = TextEditingController();
  TextEditingController timeinputClose = TextEditingController();

  void _initFeedback(request) async {

    final response = await request.post("https://ev-ryday.up.railway.app/services/add-flutter/", {
    	"name": name,
		"phone": phone,
		"address": address,
		"city": city,
		"photo": photo,
		"time_open": time_open,
		"time_close": time_close,
		"link_gmap": link_gmap,
    });
    print(response['message']); 
    if (response['message'] == 'SUCCESS') {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Feedback berhasil tersimpan"),
      ));
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const ServicesPage(

          )));
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
                    Padding(
                      // Menggunakan padding sebesar 8 pixels
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: timeinputOpen,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.timer),
                          labelText: "Jam Buka",
                        ),
                        readOnly: true,
                        onTap: () async {
                          TimeOfDay? pickedTime = await showTimePicker(
                              context: context,
                              initialTime: const TimeOfDay(hour: 7, minute: 0));
                          if (pickedTime != null) {
                            String hours = "";
                            String minutes = "";
                            hours = pickedTime.hour < 10
                                ? "0${pickedTime.hour}"
                                : "${pickedTime.hour}";
                            minutes = pickedTime.minute < 10
                                ? "0${pickedTime.minute}"
                                : "${pickedTime.minute}";
                            setState(() {
                              time_open = "$hours:$minutes";
                              timeinputOpen.text = time_open!;
                            });
                          }
                        },
                      )),
                    Padding(
                      // Menggunakan padding sebesar 8 pixels
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: timeinputClose,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.timer),
                          labelText: "Jam Tutup",
                        ),
                        readOnly: true,
                        onTap: () async {
                          TimeOfDay? pickedTime = await showTimePicker(
                              context: context,
                              initialTime: const TimeOfDay(hour: 7, minute: 0));
                          if (pickedTime != null) {
                            String hours = "";
                            String minutes = "";
                            hours = pickedTime.hour < 10
                                ? "0${pickedTime.hour}"
                                : "${pickedTime.hour}";
                            minutes = pickedTime.minute < 10
                                ? "0${pickedTime.minute}"
                                : "${pickedTime.minute}";
                            setState(() {
                              time_close = "$hours:$minutes";
                              timeinputClose.text = time_close!;
                            });
                          }
                        },
                      )),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Contoh: https://www.google.com/",
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
                        hintText: "Contoh: https://www.google.com/",
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
