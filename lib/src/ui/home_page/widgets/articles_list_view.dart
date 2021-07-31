import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../data/models/article.dart';
import '../../details_page/details.dart';
import '../../shimmer.dart';

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
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: articles.length,
        itemBuilder: (context, index) {
          var currentArticle = articles[index];

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
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
                        index: index,
                      ),
                    ),
                  );
                },
                child: Column(
                  children: [
                    SizedBox(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: Hero(
                        tag: 'news-banner-$index',
                        child: CachedNetworkImage(
                          placeholder: (ctx, url) => ShimmerLoading(),
                          imageUrl: currentArticle.urlToImage ??
                              Constants.PLACEHOLDER,
                          errorWidget: (ctx, url, err) => SizedBox(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            child: Image.asset(
                              'assets/placeholder.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(
                        title: Text(
                          currentArticle.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
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
