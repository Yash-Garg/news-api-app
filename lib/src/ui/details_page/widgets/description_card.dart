import 'package:flutter/material.dart';

import 'heading.dart';

class DescriptionCard extends StatelessWidget {
  const DescriptionCard({
    Key? key,
    required this.description,
    required this.content,
  }) : super(key: key);

  final String description;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Heading(text: 'Description'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    description,
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Heading(text: 'Content'),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 5),
                  child: Text(
                    content,
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
