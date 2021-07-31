import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/models/article.dart';
import '../../data/repository/news_repository.dart';
import '../../data/state/result_state_notifier.dart';
import '../../theme/app_theme.dart';
import 'widgets/articles_list_view.dart';
import 'widgets/error_text.dart';
import 'widgets/loading.dart';

final articlesProvider = StateNotifierProvider<GetResultRequestsNotifier,
    ResultState<List<Article>>>(
  (ref) => GetResultRequestsNotifier(ref.watch(newsRepositoryProvider)),
);

class HomePage extends StatefulHookWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read(articlesProvider.notifier).getLatest();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              floating: true,
              snap: true,
              title: Text(
                'News API',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ),
          ],
          body: Column(
            children: [
              useProvider(articlesProvider).when(
                loading: () => CustomLoading(),
                success: (articles) => Expanded(
                  child: RefreshIndicator(
                    color: accentColor,
                    onRefresh: () => Future.value(
                      context.refresh(articlesProvider.notifier).getLatest(),
                    ),
                    child: ArticlesListView(articles: articles!),
                  ),
                ),
                error: (e, s) => Expanded(child: ErrorText()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
