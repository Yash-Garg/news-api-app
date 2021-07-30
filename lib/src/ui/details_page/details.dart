import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../data/models/article.dart';

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
      appBar: AppBar(title: Text(article.source.name)),
      body: Column(
        children: [
          widget.article.urlToImage != null
              ? Image.network(article.urlToImage!)
              : Image.asset('assets/placeholder.jpg'),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              title: Text(article.title),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Submitted by ${article.author}'),
                    SizedBox(height: 5),
                    Text(
                      'Published at ${DateFormat('dd/MM/yyyy | hh:mm a').format(article.publishedAt)}',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
