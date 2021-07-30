import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: CircularProgressIndicator(color: accentColor),
      ),
    );
  }
}
