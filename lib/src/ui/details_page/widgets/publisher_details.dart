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
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ListTile(
        title: Text(
          article.title,
          style: TextStyle(fontSize: 18),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Submitted by ${article.author ?? "Unknown"}'),
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
