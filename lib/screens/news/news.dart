import 'package:flutter/material.dart';
import 'package:evryday/widgets/drawer.dart';
import 'package:flutter/material.dart';

import 'package:evryday/models/news_model.dart';
import 'package:evryday/common/fetch_news.dart';
import 'package:evryday/widgets/news/widget.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  final String title = "News";

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<News> list = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getNewsData();
  }

  void getNewsData() {
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
        title: const Text("News"),
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: GestureDetector(
                  onTap: () {
                    getNewsData();
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
      drawer: const DrawerComponents(currentPage: 'News'),
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
                getNewsData();
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
      })
    );
  }

  Widget _buildListView() {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        const NewsWidget(),
        ListView.builder(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: list.length,
            padding: EdgeInsets.fromLTRB(
                5, 15, 5, MediaQuery.of(context).size.height * 0.05),
            itemBuilder: (ctx, index) {
              return NewsItem(news: list[index]);
            }),
      ],
    );
  }
}
