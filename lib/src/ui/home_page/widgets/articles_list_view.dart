import 'package:flutter/material.dart';
import 'package:news_app/src/ui/details_page/details.dart';

import '../../../data/models/article.dart';

class ArticlesListView extends StatelessWidget {
  final List<Article> articles;
  const ArticlesListView({
    Key? key,
    required this.articles,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: articles.length,
        itemBuilder: (context, index) {
          var currentArticle = articles[index];

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            child: Card(
              elevation: 3,
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsPage(
                        article: currentArticle,
                      ),
                    ),
                  );
                },
                child: Column(
                  children: [
                    currentArticle.urlToImage != null
                        ? Image.network(currentArticle.urlToImage!)
                        : Image.asset('assets/placeholder.jpg'),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(
                        title: Text(
                          currentArticle.title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            currentArticle.source.name,
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
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
