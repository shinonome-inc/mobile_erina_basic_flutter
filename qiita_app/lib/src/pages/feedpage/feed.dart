import 'package:flutter/material.dart';

import '../../models/article.dart';
import 'app_title.dart';
import 'article_container.dart';
import 'article_data.dart';

class Feed extends StatefulWidget {
  const Feed({super.key});

  @override
  State<Feed> createState() => _FeedPageState();
}

class _FeedPageState extends State<Feed> {
  @override
  void initState() {
    super.initState();
    fetchArticles();
  }

  List<Article> articles = [];

  void fetchArticles() async {
    // QiitaRepositoryから記事データを非同期で取得
    List<Article> fetchedArticles = await QiitaRepository.fetchQiitaItems();
    // 取得した記事データをステートにセット
    setState(() {
      articles = fetchedArticles;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppTitle(
        title: 'Feed',
        showSearchBar: true,
        showBottomDivider: true,
      ),
      body: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return ArticleContainer(
            article: articles[index],
          );
        },
      ),
    );
  }
}
