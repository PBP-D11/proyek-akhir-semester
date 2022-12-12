import 'package:flutter/material.dart';
import 'package:evryday/widgets/drawer.dart';
import 'dart:convert' as convert;
import 'package:provider/provider.dart';
import 'package:evryday/common/cookie_request.dart';

class MyFormPage extends StatefulWidget {
    const MyFormPage({super.key});

    @override
    State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
    final _formKey = GlobalKey<FormState>();
    String name, phone, address, city, photo, link_gmap;
    TimeOfDay? time_open, time_close;
    //final request = context.watch<CookieRequest>();
    @override
    Widget build(BuildContext context) {
        return Scaffold(
	        appBar: AppBar(
	            title: const Text('Add new Evices'),
	        ),
	        drawer: const DrawerComponents(),
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
			                                    labelText: "Nama", border: OutlineInputBorder()
											),
			                                onSaved: (String? value) {
			                                    setState(() {
			                                    	nama = value!;
			                                    });
			                                },
			                                onChanged: (String? value) {
			                                    setState(() {
			                                    	nama = value!;
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
			                                    labelText: "Nomor Telepon", border: OutlineInputBorder()
											),
			                                onSaved: (String? value) {
			                                    setState(() {
			                                    	phone = int.parse(value!);
			                                    });
			                                },
			                                onChanged: (String? value) {
			                                    setState(() {
			                                    	phone = int.parse(value!);
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
			                                    labelText: "Alamat", border: OutlineInputBorder()
											),
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
			                                    labelText: "Kota", border: OutlineInputBorder()
											),
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
												).then((date){
													setState(() {
														time_open = value;
													})
												})
											}
		                                ),
		                                const SizedBox(height: 10),
		                                ElevatedButton(
		                                	child: Text('Pilih Jam Tutup'),
		                                	onPressed: () async {
												showTimePicker(
													context: context,
													initialTime: TimeOfDay(hour: 10, minute: 30),
												).then((date){
													setState(() {
														time_close = value;
													})
												})
											}
		                                ),
		                                const SizedBox(height: 10),
		                                TextFormField(
			                                decoration: const InputDecoration(
			                                    labelText: "URL Photo", border: OutlineInputBorder()
											),
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
			                                    labelText: "Link Google Map", border: OutlineInputBorder()
											),
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
			                        onPressed: () async {
			                            if (_formKey.currentState!.validate() && time_open != NULL && time_close != NULL) {
			                            	final response = await request.post(
		                                    	"https://ev-ryday.up.railway.app/services/add",
												{
													
			                                        "name": name,
													"phone": phone,
													"address": address,
													"city": city,
													"photo": photo,
													"time_open": time_open.toString(),
													"time_close": time_close.toString(),
													"link_gmap": link_gmap,
		                                    	}
											);
				                            if (response.status == 200) {
			                                    ScaffoldMessenger.of(context)
			                                    	.showSnackBar(const SnackBar(
			                                    		content: Text("Berhasil menambahkan Services!"),
			                                    	));
			                                    Navigator.pop(context);
			                                }
			                            }
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