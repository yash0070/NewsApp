import 'package:flutter/material.dart';
import 'package:news_flutter_app/Views/article_news.dart';
import 'package:news_flutter_app/Views/category_news.dart';
import 'package:news_flutter_app/Views/details.dart';
import 'package:news_flutter_app/helper/category_data.dart';
import 'package:news_flutter_app/helper/news_data.dart';
import 'package:news_flutter_app/models/article_model.dart';
import 'package:news_flutter_app/models/category_models.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = <CategoryModel>[];
  List<ArticleModel> articles = <ArticleModel>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getCategories();
    getNews();
  }

  bool _loading = true;

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF464646),
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "HEADLINES",
              style: TextStyle(
                  letterSpacing: 1.5,
                  fontSize: 29,
                  color: Colors.white,
                  fontFamily: 'Roboto'),
            ),
          ],
        ),
      ),
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: articles.length,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return BlogTile(
                        imageUrl: articles[index].urlToImage.toString(),
                        title: articles[index].title.toString(),
                        desc: articles[index].description.toString(),
                        publish: articles[index].publishedAt.toString(),
                        url: articles[index].url.toString(),
                      );
                    }),
              ),
            ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  String imageUrl;
  String categoryName;

  CategoryTile({required this.categoryName, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    CategoryNewsPage(category: categoryName)));
      },
      child: Container(
          margin: EdgeInsets.only(right: 16),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  imageUrl,
                  width: 120,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: 120,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.black26,
                ),
                child: Text(
                  categoryName,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              )
            ],
          )),
    );
  }
}

class BlogTile extends StatelessWidget {
  String imageUrl, title, desc, publish, url;
  BlogTile(
      {required this.imageUrl,
      required this.title,
      required this.desc,
      required this.publish,
      required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailsScreen(
                    publish: publish,
                    desc: desc,
                    title: title,
                    img: imageUrl,
                  )),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(top: 20),
        child: Stack(
          children: [
            Opacity(
              opacity: 0.6,
              child: Container(
                height: 250,
                decoration: BoxDecoration(
                    // gradient: LinearGradient(
                    //   colors: [
                    //     Colors.black.withOpacity(0.8),
                    //     Colors.black.withOpacity(0.4),
                    //   ],
                    //   begin: Alignment.topCenter,
                    //   end: Alignment.bottomCenter,
                    // ),
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                        image: NetworkImage(imageUrl), fit: BoxFit.fill)),
                // child: Image.network(
                //   imageUrl,
                //   fit: BoxFit.fill,
                // ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Positioned(
              bottom: 10.0,
              left: 16,
              right: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    overflow: TextOverflow.clip,
                    maxLines: 2,
                    style: const TextStyle(
                        fontSize: 22,
                        color: Color(0xFFf2f2f2),
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    publish,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
