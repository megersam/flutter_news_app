import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urji_news/models/newsArticle.dart';
import 'package:urji_news/viewmodels/newsArticleListViewModel.dart';

import 'DetailsScreen.dart';

class NewsList extends StatefulWidget {
  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .populatedTopHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<NewsArticleListViewModel>(context);
    TabController _tabController;
    var listTiles;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFAFAFA),
        centerTitle: true,
        title: Text(
          " News App",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      /* body: ListView.builder(
        itemCount: vm.articles.length,
        itemBuilder: (context, index) {
          final article = vm.articles[index];
          return ListTile(
            leading: Container(
                width: 100,
                height: 100,
                child: article.urlToImage == null
                    ? Image.asset("images/noimage.jpg")
                    : Image.network(article.urlToImage)),
            title: Container(child: Text(article.title)),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailsScreen(
                            title: toString(),
                            description: toString(),
                            urlToImage: toString(),
                            url: toString(),
                          )));
            },
          );
        },
      ),*/
      body: TabBarView(
        // controller: _tabController,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              child: ListView.builder(
                itemCount: listTiles.length,
                itemBuilder: (context, index) {
                  final article = vm.articles[index];
                  leading:
                  Container(
                      width: 100,
                      height: 100,
                      child: article.urlToImage == null
                          ? Image.asset("images/noimage.jpg")
                          : Image.network(article.urlToImage));
                  title:
                  Container(child: Text(article.title));
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsScreen(
                                    title: listTiles[index],
                                    urlToImage: listTiles[index],
                                    description: listTiles[index].newsTitle,
                                    url: listTiles[index],
                                  )));
                    },
                    //child: listWidget(listTiles[index]),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(),
          ),
        ],
      ),
    );
  }
}
