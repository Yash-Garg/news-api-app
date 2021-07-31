import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants.dart';
import '../../data/models/article.dart';
import '../shimmer.dart';
import 'widgets/description_card.dart';
import 'widgets/publisher_details.dart';

class DetailsPage extends StatefulWidget {
  final Article article;
  const DetailsPage({Key? key, required this.article}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    var article = widget.article;

    return Scaffold(
      appBar: AppBar(
        title: Text(article.source.name),
        actions: [
          IconButton(
            onPressed: () => launch(article.url),
            icon: Icon(Icons.open_in_new),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              placeholder: (ctx, url) => ShimmerLoading(),
              imageUrl: article.urlToImage ?? Constants.PLACEHOLDER,
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
            PublisherDetails(article: article),
            DescriptionCard(
              description: article.description ?? 'No description found.',
              content: article.content ?? 'No content found.',
            ),
          ],
        ),
      ),
    );
  }
}
