import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'news_screen.dart';
import 'viewed.dart';
import 'objects.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  late SharedPreferences prefs;
  late List<ViewedNews> viewedNews = [];

  void onTabTapped(int index) async {
    setState(() {
      _currentIndex = index;
    });
    if (index == 1 || index == 2) {
      await initSharedPreferences();
    }
  }

  initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    viewedNews = (prefs.getStringList('viewedNews') ?? [])
        .map((jsonString) => ViewedNews.fromMap(json.decode(jsonString)))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Новостной клиент',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('ru', 'RU'), // Добавьте русский язык
      ],
      home: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: [
            NewsList(),
            ViewedTab(viewedNews: viewedNews),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: onTabTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Главная',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.remove_red_eye), // иконка просмотра
              label: 'Просмотренное',
            ),
          ],
        ),
      ),
    );
  }
}
