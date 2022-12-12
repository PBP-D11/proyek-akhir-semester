import 'package:evryday/screens/findcharge/findcharge_page.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class FindChargeForm extends StatefulWidget {
  const FindChargeForm({super.key});

  @override
  State<StatefulWidget> createState() => _FindChargeFormState();
}

class _FindChargeFormState extends State<FindChargeForm> {
  final _formKey = GlobalKey<FormState>();

  String namaStation = "";
  String namaKota = "";
  String alamat = "";
  String timeOpen = "";
  String timeClose = "";
  String linkGmap = "";

  TextEditingController timeinputOpen = TextEditingController();
  TextEditingController timeinputClose = TextEditingController();

  @override
  void initState() {
    timeinputOpen.text = "";
    timeinputClose.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              onPressed: (() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyFindChargePage()));
              }),
              icon: const Icon(Icons.arrow_back),
            ),
            title: const Text("New Charging Station")),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(children: [
              Padding(
                // Menggunakan padding sebesar 8 pixels
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Nama Station",
                    labelText: "Nama Station",
                    // Menambahkan circular border agar lebih rapi
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  // Menambahkan behavior saat nama diketik
                  onChanged: (String? value) {
                    setState(() {
                      namaStation = value!;
                    });
                  },
                  // Menambahkan behavior saat data disimpan
                  onSaved: (String? value) {
                    setState(() {
                      namaStation = value!;
                    });
                  },
                  // Validator sebagai validasi form
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama station tidak boleh kosong!';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                // Menggunakan padding sebesar 8 pixels
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Contoh: Jakarta",
                    labelText: "Kota",
                    // Menambahkan circular border agar lebih rapi
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  // Menambahkan behavior saat nama diketik
                  onChanged: (String? value) {
                    setState(() {
                      namaKota = value!;
                    });
                  },
                  // Menambahkan behavior saat data disimpan
                  onSaved: (String? value) {
                    setState(() {
                      namaKota = value!;
                    });
                  },
                  // Validator sebagai validasi form
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Kota tidak boleh kosong!';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                // Menggunakan padding sebesar 8 pixels
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Alamat",
                    labelText: "Alamat",
                    // Menambahkan circular border agar lebih rapi
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  // Menambahkan behavior saat nama diketik
                  onChanged: (String? value) {
                    setState(() {
                      alamat = value!;
                    });
                  },
                  // Menambahkan behavior saat data disimpan
                  onSaved: (String? value) {
                    setState(() {
                      alamat = value!;
                    });
                  },
                  // Validator sebagai validasi form
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Alamat tidak boleh kosong!';
                    }
                    return null;
                  },
                ),
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
                          timeOpen = "$hours:$minutes";
                          timeinputOpen.text = timeOpen;
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
                          timeClose = "$hours:$minutes";
                          timeinputClose.text = timeClose;
                        });
                      }
                    },
                  )),
              Padding(
                // Menggunakan padding sebesar 8 pixels
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Contoh: https://www.google.com/",
                    labelText: "URL Google Map",
                    // Menambahkan circular border agar lebih rapi
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  // Menambahkan behavior saat nama diketik
                  onChanged: (String? value) {
                    setState(() {
                      linkGmap = value!;
                    });
                  },
                  // Menambahkan behavior saat data disimpan
                  onSaved: (String? value) {
                    setState(() {
                      linkGmap = value!;
                    });
                  },
                  // Validator sebagai validasi form
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'URL tidak boleh kosong!';
                    }
                    return null;
                  },
                ),
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    void addStation(request, namaStation, namaKota, alamat,
                        timeOpen, timeClose, linkGmap) async {
                      var response = await request.post(
                          'https://ev-ryday.up.railway.app/find-charge/add/ajax',
                          {
                            "nama_station": namaStation,
                            "kota": namaKota,
                            "alamat": alamat,
                            "time_open": timeOpen,
                            "time_close": timeClose,
                            "link_gmap": linkGmap,
                          });
                    }

                    addStation(request, namaStation, namaKota, alamat, timeOpen,
                        timeClose, linkGmap);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyFindChargePage()),
                    );
                  }
                },
                child: const Text(
                  "Tambah",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ]),
          ),
        ));
  }
}
