import 'package:findcharge/screens/findcharge_detail.dart';
import 'package:flutter/material.dart';
import 'package:findcharge/screens/findcharge_page.dart';
import 'package:findcharge/screens/findcharge_form.dart';
import 'package:findcharge/util/findcharge_fetch.dart';
import 'package:evryday/widgets/drawer.dart';

class MyFindChargePage extends StatefulWidget {
  const MyFindChargePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MyFindChargeState();
}

class MyFindChargeState extends State<MyFindChargePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Find Charge"),
      ),
      drawer: const DrawerComponents(currentPage: "Find Charge"),
      body: FutureBuilder(
        future: fetchFindCharge(),
        builder: ((context, snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (!snapshot.hasData) {
              return Column(
                children: const [
                  Text(
                    "Charging station belum tersedia :(",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  )
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => GestureDetector(
                    onTap: (() {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FindChargeDetail(
                                  data: snapshot.data![index])));
                    }),
                    child: Container(
                        padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                        child: SizedBox(
                          width: 300,
                          height: 350,
                          child: Card(
                            child: Column(
                              children: [
                                Image.network(
                                  "https://maps.gstatic.com/tactile/pane/default_geocode-2x.png",
                                  width: 300,
                                  height: 250,
                                ),
                                ListTile(
                                  title: Text(
                                      snapshot.data![index].fields.namaStation),
                                  subtitle: Text(
                                    snapshot.data![index].fields.alamat,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ))),
              );
            }
          }
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const FindChargeForm()));
        },
        tooltip: 'Add New Charging Station',
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }
}
