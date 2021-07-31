import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../data/models/article.dart';

class PublisherDetails extends StatelessWidget {
  const PublisherDetails({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    var author = article.author;
    article.author != null
        ? author = 'Submitted by ${article.author}'
        : author = 'Author unknown';

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ListTile(
        title: Text(article.title),
        subtitle: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(author),
              SizedBox(height: 5),
              Text(
                'Published at ${DateFormat('dd/MM/yyyy | hh:mm a').format(article.publishedAt)}',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
