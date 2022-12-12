// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

import '../common/fetch_wishlist.dart';
import '../models/wishlist_model.dart';
import '../widget/widget.dart';
// import '../widget/drawer.dart';

class EvishlistHomePage extends StatefulWidget {
  const EvishlistHomePage({Key? key}) : super(key: key);
  static const routeName = '/evishlist-home-page';

  @override
  State<EvishlistHomePage> createState() => _Evishlist_HomePageState();
}

class _Evishlist_HomePageState extends State<EvishlistHomePage> {
  List<Car> list = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getArticleData();
  }

  getArticleData() {
    //debugPrint("Halooo");
    setLoading(true);
    setState(() {
      list.clear();
    });
    fetchWatchList().then((value) {
      setState(() {
        list.addAll(value);
      });
    }).whenComplete(() {
      setLoading(false);
    });
  }

  setLoading(bool value) {
    setState(() {
      isLoading = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(30, 30, 44, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(42, 44, 62, 1),
        title: const Text("Evishlist"),
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: GestureDetector(
                  onTap: () {
                    getArticleData();
                  },
                  child: const Icon(
                    Icons.refresh,
                  ),
                ),
              )
            ],
          )
        ],
      ),
      // drawer: const AppDrawer(),
      body: Builder(builder: (context) {
        if (isLoading && list.isEmpty) {
          return const Center(
            child: Text("Memuat..."),
          );
        }

        if (!isLoading && list.isEmpty) {
          return Center(
            child: InkWell(
              onTap: () {
                getArticleData();
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                    "Datanya kosong. Coba ketuk tulisan ini untuk memuat ulang"),
              ),
            ),
          );
        }
        return _buildListView();
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFFEA150),
        onPressed: () {},
        tooltip: 'Tambahkan Koleksi!',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildListView() {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        const CardEvishlist(),
        ListView.builder(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: list.length,
            padding: EdgeInsets.fromLTRB(
                5, 15, 5, MediaQuery.of(context).size.height * 0.05),
            itemBuilder: (ctx, index) {
              return CarItem(car: list[index]);
            }),
      ],
    );
  }
}
