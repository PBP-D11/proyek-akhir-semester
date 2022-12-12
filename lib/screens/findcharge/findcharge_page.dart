import 'package:flutter/material.dart';
import 'package:evryday/widgets/drawer.dart';
import 'package:evryday/screens/findcharge/findcharge_detail.dart';
import 'package:evryday/screens/findcharge/findcharge_form.dart';
import 'package:evryday/common/findcharge_fetch.dart';

class MyFindChargePage extends StatefulWidget {
  const MyFindChargePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MyFindChargeState();
}

class MyFindChargeState extends State<MyFindChargePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(30, 30, 44, 1),
      appBar: AppBar(
        title: const Text("Find Charge"),
        backgroundColor: const Color.fromRGBO(42, 44, 62, 1),
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
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
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
                    )
                  )
                ),
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
        backgroundColor: const Color(0xFFFEA150),
        child: const Icon(Icons.add),
      ),
    );
  }
}
