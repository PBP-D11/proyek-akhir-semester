// ignore_for_file: unused_import, depend_on_referenced_packages, unused_local_variable

import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:evryday/widgets/drawer.dart';

import 'package:evryday/models/news_model.dart';
import 'package:evryday/common/fetch_news.dart';
import 'package:evryday/widgets/news/widget.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({
    super.key,
    required this.news,
  });

  final News news;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(20, 10, 20, 5),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.height * 0.2,
            child: Image.network(
              news.fields.image,
              fit: BoxFit.fill,
              errorBuilder: (context, error, stackTrace) {
                return Center(
                  child: Icon(
                    Icons.broken_image_outlined,
                    color: Colors.white.withOpacity(0.4),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text(
                    news.fields.title,
                    style: const TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    news.fields.description,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                // ========= ini ketika dipencet akan mengarah ke
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: ElevatedButton(
                    onPressed: _launchUrl,
                    child: const Text(
                      "Baca selengkapnya",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
  Future<void> _launchUrl() async {
    final url = news.fields.url;
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
class NewsWidget extends StatelessWidget {
  const NewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).primaryColor,
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: const Padding(
        padding: EdgeInsets.all(30.0),
        child: Text(
          "Disini, kamu akan mendapatkan berita terbaru seputar EV.",
          style: TextStyle(
            fontFamily: "Poppins",
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}