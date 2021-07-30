import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';

class ErrorText extends StatelessWidget {
  const ErrorText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.info_outline,
          size: 80,
          color: mildWhite,
        ),
        SizedBox(height: 15),
        Text(
          'Error Loading Data',
          style: TextStyle(fontSize: 20, color: mildWhite),
        ),
      ],
    );
  }
}
