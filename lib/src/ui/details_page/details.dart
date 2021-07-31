import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/models/article.dart';
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
    var description = article.description;
    var content = article.content;

    description ??= 'No description found.';
    content ??= 'No content found.';

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
            widget.article.urlToImage != null
                ? Image.network(article.urlToImage!)
                : Image.asset('assets/placeholder.jpg'),
            PublisherDetails(article: article),
            DescriptionCard(description: description, content: content)
          ],
        ),
      ),
    );
  }
}
