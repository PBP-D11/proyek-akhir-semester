import 'package:findcharge/model/findcharge.dart';
import 'package:flutter/material.dart';
import 'package:findcharge/screens/findcharge_page.dart';

class FindChargeDetail extends StatefulWidget {
  const FindChargeDetail({super.key, required this.data});

  final Findcharge data;

  @override
  State<StatefulWidget> createState() => _FindChargeDetailState();
}

class _FindChargeDetailState extends State<FindChargeDetail> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.data.fields.namaStation)),
      body: Center(
        child: Container(
          padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
          child: Column(
            children: [
              Center(
                child: Text(
                  widget.data.fields.namaStation,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Jam Operasional: ",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${widget.data.fields.timeOpen} - ${widget.data.fields.timeClose}",
                        style: const TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Kota: ",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.data.fields.kota,
                        style: const TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Alamat: ",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                          child: Text(
                        widget.data.fields.alamat,
                        style: const TextStyle(fontSize: 16),
                        softWrap: true,
                        maxLines: 10,
                        overflow: TextOverflow.ellipsis,
                      ))
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
              const Spacer(),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MyFindChargePage()),
                            );
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.blue)),
                          child: const Text(
                            "Back",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () {
                            

                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MyFindChargePage()),
                            );
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.blue)),
                          child: const Text(
                            "Back",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  )
                )
            ],
          ),
        ),
      ),
    );
  }
}
