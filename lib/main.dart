import 'package:flutter/material.dart';
import 'package:mediumappui/NewsArticle.dart';
import 'package:mediumappui/NewsHelper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Home',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400),
        ),
        actions: <Widget>[
          Icon(
            Icons.notifications_none,
            size: 20,
            color: Colors.grey,
          ),
          SizedBox(
            width: 10.0,
          ),
          Icon(
            Icons.search,
            size: 20,
            color: Colors.grey,
          )
        ],
      ),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(32.0, 64.0, 32.0, 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Icon(
                        Icons.account_circle,
                        size: 100.0,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          'John McKenzie',
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          'Edit profile',
                          style: TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(40.0, 16.0, 40.0, 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Home',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Audio',
                          style: TextStyle(color: Colors.white, fontSize: 12.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Bookmarks',
                          style: TextStyle(color: Colors.white, fontSize: 12.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Interest',
                          style: TextStyle(color: Colors.white, fontSize: 12.0),
                        ),
                      ),
                      Divider(
                        color: Colors.white,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Become a member',
                          style: TextStyle(color: Colors.green, fontSize: 12.0),
                        ),
                      ),
                      Divider(
                        color: Colors.white,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'New Story',
                          style: TextStyle(color: Colors.white, fontSize: 12.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Stats',
                          style: TextStyle(color: Colors.white, fontSize: 12.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Drafts',
                          style: TextStyle(color: Colors.white, fontSize: 12.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: NewsHelper.articleCount,
        itemBuilder: (context, position) {
          NewsArticle article = NewsHelper.getArticle(position);

          return Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.5, 0.0, 0.5),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      article.categoryTitle,
                      style: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Flexible(
                            child: Text(
                              article.title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                            flex: 3,
                          ),
                          Flexible(
                            flex: 1,
                            child: Container(
                              height: 80.0,
                              width: 80.0,
                              child: Image.asset(
                                'assets/' + article.imageAssetName,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              article.author,
                              style: TextStyle(
                                fontSize: 15.0,
                              ),
                            ),
                            Text(
                              article.date + '.' + article.readTime,
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        Icon(Icons.bookmark_border)
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
