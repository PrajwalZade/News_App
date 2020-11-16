import 'package:flutter/material.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/model/articleModel.dart';


import 'blogView.dart';

class CategoryViews extends StatefulWidget {
  final String category;

  const CategoryViews({this.category});
  @override
  _CategoryViewsState createState() => _CategoryViewsState();
}

class _CategoryViewsState extends State<CategoryViews> {
  List<ArticleModel> articles = new List<ArticleModel>();
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getCategoryNews();
  }

  getCategoryNews() async {
    CategoryNews newsClass = CategoryNews();
    await newsClass.getCategoryNews(widget.category);
    articles = newsClass.news;

    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("India"),
            Text(
              "News",
              style: TextStyle(color: Colors.blue),
            )
          ],
        )),
        actions: [
          Opacity(
            opacity: 0,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            // child: IconButton(
            //   icon: Icon(Icons.save),
            //   onPressed: () {
            //     Fluttertoast.showToast(
            //         msg: "Saved",
            //         toastLength: Toast.LENGTH_SHORT,
            //         gravity: ToastGravity.CENTER,
            //         timeInSecForIosWeb: 1,
            //         backgroundColor: Colors.red,
            //         textColor: Colors.white,
            //         fontSize: 16.0);
            //   },
            // )
          ),
        ],
        elevation: 4,
        // leading: new Container(),
      ),
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    Container(
                        //padding: EdgeInsets.all(10),
                        padding: EdgeInsets.only(top: 5),
                        child: ListView.builder(
                          itemCount: articles.length,
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return BlogTile(
                                imageUrl: articles[index].urlToImage,
                                title: articles[index].title,
                                desc: articles[index].description,
                                url: articles[index].url);
                          },
                        ))
                  ],
                ),
              ),
            ),
    );
  }
}
