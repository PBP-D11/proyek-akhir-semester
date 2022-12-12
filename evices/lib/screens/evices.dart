import 'package:flutter/material.dart';
import 'package:evryday/widgets/drawer.dart';
import 'package:evices/models/services.dart';
import 'package:evices/screens/form.dart';
import 'dart:convert' as convert;
import 'package:provider/provider.dart';
import 'package:evryday/common/cookie_request.dart';

class ServicePage extends StatefulWidget {
	const ServicePage({Key? key}) : super(key: key);
	
	@override
	State<ServicePage> createState() => _Service_HomePageState();
}

class _Service_HomePageState extends State<ServicePage> {
	final _formKey = GlobalKey<FormState>();
	String name, phone, address, city, photo, link_gmap;
    TimeOfDay? time_open, time_close;
	
	// Main function check : GET/Fetch work?
	// Alternative : fetch using http
	Future<List<Service>> fetchFoodData(CookieRequest request) async {
		var response = await request.get("https://ev-ryday.up.railway.app/services/json/");
	
		List<Service> listService = [];
		for (var d in response) {
			if (d != null) {
	    		listService.add(Service.fromJson(d));
			}
		}
		
		return listFoodData;
	}
	
	@override
	Widget build(BuildContext context) {
		final request = context.watch<CookieRequest>();
		return Scaffold(
		    appBar: AppBar(
		      title: const Text("All Services"),
		    ),
		    drawer: const DrawerComponents(),
		    body: (
				FutureBuilder(
		            future: fetchFoodData(request),
		            builder: (context, AsyncSnapshot snapshot) {
		            	if (snapshot.data == null) {
		                	return const Center(child: CircularProgressIndicator());
		            	}
						else {
			                if (!snapshot.hasData) {
			                  	return Column(
			                    	children: const [
			                      		Text(
			                        		"Tidak ada food list :(",
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
			                                	height: 95,
			                                	child: Column(children: <Widget>[
			                                		// Main function check : Is data valid with logic?
			                                  		Padding(
					                                    padding: const EdgeInsets.only(top: 10, left: 12),
					                                    child: Align(
						                                    alignment: Alignment.centerLeft,
						                                    child: Text(
						                                    	snapshot.data![index].fields.food_name,
						                                        style: const TextStyle(fontSize: 30),
						                                    ),
					                                    ),
			                                  		),
			                                  		Padding(
			                                    		padding: const EdgeInsets.only(top: 10, left: 12),
						                                    child: Align(
						                                    alignment: Alignment.centerLeft,
						                                    child: Text(
						                                        snapshot.data![index].fields.food_expired_date,
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
			)
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