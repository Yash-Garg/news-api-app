import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'src/theme/app_theme.dart';
import 'src/ui/home_page/home.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Color(0xFF141414)),
    );

    return MaterialApp(
      title: 'IMDB Task App',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: appTheme,
    );
  }
}
