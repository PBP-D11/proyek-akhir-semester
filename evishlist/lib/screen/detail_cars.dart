// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../models/wishlist_model.dart';

class DetailCarPage extends StatefulWidget {
  const DetailCarPage({
    super.key,
    required this.model,
  });
  static const String routeName = "detail-car";
  final Car model;

  @override
  State<DetailCarPage> createState() => _DetailCarPageState();
}

class _DetailCarPageState extends State<DetailCarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(30, 30, 44, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(42, 44, 62, 1),
        title: Text("Detail car"),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Image.network(
              widget.model.fields.photo,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Center(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.broken_image_outlined,
                          color: Colors.red.withOpacity(0.7),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Gambar rusak atau mungkin URL tidak valid",
                          style: TextStyle(
                            color: Colors.red.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // ListTile(
          //   contentPadding: EdgeInsets.symmetric(horizontal: 25),
          //   // title: Text(
          //   //   "Dibuat oleh Author 1",
          //   //   style:
          //   //       TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.w600),
          //   // ),
          //   subtitle: Text(
          //     DateFormat("dd MMM yyyy")
          //         .format(widget.model.fields.publish)
          //         .toString(),
          //     style: TextStyle(
          //       fontFamily: "Poppins",
          //     ),
          //   ),
          // ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.model.fields.name,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w900,
                    fontSize: 28,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  widget.model.fields.price,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontFamily: "Poppins", fontSize: 24, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
