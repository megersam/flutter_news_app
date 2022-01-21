import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urji_news/pages/newsList.dart';
import 'package:urji_news/viewmodels/newsArticleListViewModel.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ChangeNotifierProvider(
            create: (BuildContext context) => NewsArticleListViewModel(),
            child: NewsList()));
  }
}
