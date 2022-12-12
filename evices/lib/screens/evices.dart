

import 'package:flutter/material.dart';
import 'package:evryday/widgets/drawer.dart';
import 'package:evices/models/services.dart';
import 'package:evices/screens/form.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:evryday/common/cookie_request.dart';

class ServicesPage extends StatefulWidget {
	const ServicesPage({Key? key}) : super(key: key);
	
	@override
	State<ServicesPage> createState() => _Service_HomePageState();
}

class _Service_HomePageState extends State<ServicesPage> {
	String? name, phone, address, city, photo, link_gmap;
    TimeOfDay? time_open, time_close;
	
	  //get utf8 => null;
	
	// Main function check : GET/Fetch work?
	// Alternative : fetch using http
	Future<List<Services>> fetchServicesData() async {
		var url = Uri.parse("https://ev-ryday.up.railway.app/services/json/");
		var response = await http.get(
			url,
			headers: {
				"Content-Type": "application/json",
			},
		);
		var data = jsonDecode(utf8.decode(response.bodyBytes));
		List<Services> listService = [];
		for (var d in data) {
			if (d != null) {
	    		listService.add(Services.fromJson(d));
			}
		}
		
		return listService;
	}
	
	@override
	Widget build(BuildContext context) {
		// final request = context.watch<CookieRequest>();
		return Scaffold(
		    appBar: AppBar(
		      title: const Text("All Services"),
		    ),
		    drawer: const DrawerComponents(currentPage: 'Services'),
		    body: (
				FutureBuilder(
		            future: fetchServicesData(request),
		            builder: (context, AsyncSnapshot snapshot) {
		            	if (snapshot.data == null) {
		                	return const Center(child: CircularProgressIndicator());
		            	}
						else {
			                if (!snapshot.hasData) {
			                  	return Column(
			                    	children: const [
			                      		Text(
			                        		"Tidak ada tempat service :(",
			                        		style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
			                      		),
			                      		SizedBox(height: 8),
			                    	],
			                  	);
			                }
							else {
		                		return ListView.builder(
		                      		itemCount: snapshot.data!.length,
		                      		itemBuilder: (_, index) => Container(
			                            margin: const EdgeInsets.symmetric(
			                                horizontal: 16, vertical: 12
										),
			                            padding: const EdgeInsets.all(20.0),
			                            decoration: BoxDecoration(
			                                color: Colors.white,
			                                borderRadius: BorderRadius.circular(15.0),
			                                boxShadow: const [
			                                	BoxShadow(
			                                      color: Color(0xFFFEA150),
			                                      blurRadius: 2.0
												)
			                                ]
										),
			                            child: Card(
			                            	child: SizedBox(
			                                	height: 250,
			                                	child: Column(children: <Widget>[
			                                		// Main function check : Is data valid with logic?
			                                  		Padding(
					                                    padding: const EdgeInsets.only(top: 10, left: 12),
					                                    child: Align(
						                                    alignment: Alignment.centerLeft,
						                                    child: Text(
						                                    	"Nama: " + snapshot.data![index].name,
						                                        style: const TextStyle(fontSize: 30),
						                                    ),
					                                    ),
			                                  		),
			                                  		Padding(
			                                    		padding: const EdgeInsets.only(top: 10, left: 12),
						                                    child: Align(
						                                    alignment: Alignment.centerLeft,
						                                    child: Text(
						                                        "Waktu: " + snapshot.data![index].time_open + " - " + snapshot.data![index].time_close,
						                                        style: const TextStyle(fontSize: 15),
						                                    ),
					                                    ),
			                                  		),
													Padding(
			                                    		padding: const EdgeInsets.only(top: 10, left: 12),
						                                    child: Align(
						                                    alignment: Alignment.centerLeft,
						                                    child: Text(
						                                        "Waktu: " + snapshot.data![index].time_open + " - " + snapshot.data![index].time_close,
						                                        style: const TextStyle(fontSize: 15),
						                                    ),
					                                    ),
			                                  		),
													Padding(
			                                    		padding: const EdgeInsets.only(top: 10, left: 12),
						                                    child: Align(
						                                    alignment: Alignment.centerLeft,
						                                    child: Text(
						                                        "Alamat: " + snapshot.data![index].address + " - " + snapshot.data![index].city,
						                                        style: const TextStyle(fontSize: 15),
						                                    ),
					                                    ),
			                                  		),
			                                	]),
			                              	),
			                            ),
		                          	)
								);
		                	}
		            	}
		            }
				)
			),
		    floatingActionButton: Padding(
		    	padding: const EdgeInsets.only(left: 35),
		    	child: Row(
			        mainAxisAlignment: MainAxisAlignment.spaceBetween,
			        textDirection: TextDirection.rtl,
			        children: [
			            FloatingActionButton(
			            	backgroundColor: const Color(0xFFFEA150),
			            	onPressed: () {
				                Navigator.push(
				                  context,
				                  MaterialPageRoute(builder: (context) => const MyFormPage()),
				                );
			            	},
			            	tooltip: 'Add new Service',
			            	child: const Icon(Icons.add),
			            ),
			        ]
		    	),
		    )
		);
	}
}