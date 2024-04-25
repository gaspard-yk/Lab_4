import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'objects.dart';
import 'news_details.dart';

class ViewedTab extends StatefulWidget {
  final List<ViewedNews> viewedNews;

  ViewedTab({required this.viewedNews});

  @override
  _ViewedTabState createState() => _ViewedTabState();
}

class _ViewedTabState extends State<ViewedTab> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Новостной клиент'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10.0)),
            padding: EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: widget.viewedNews.length,
              itemBuilder: (context, index) {
                final news = widget.viewedNews[index];
                return ListTile(
                  minVerticalPadding: 20,
                  title: Text(news.title,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                  subtitle: Text(
                      DateFormat('d MMMM yyyy - HH:mm', 'ru_RU')
                          .format(DateTime.parse(news.publishedAt)),
                      style: TextStyle(color: Colors.black)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewsDetail(
                          newsData: news.toMap(),
                        ),
                      ),
                    );
                  },
                );
              },
            )),
      ),
    );
  }
}
