import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants.dart';
import '../models/article.dart';
import '../state/result_state_notifier.dart';

final dioProvider = Provider((ref) => Dio());
final newsRepositoryProvider = Provider((ref) => NewsRepository(ref.read));

class NewsRepository {
  NewsRepository(this.read);
  final Reader read;

  Future<List<Article>> getLatestArticles() async {
    try {
      final response = await read(dioProvider).get(
        Constants.BASE_URL,
        options: Options(responseType: ResponseType.json),
      );

      final List<Article> articles = List<Article>.from(
          response.data['articles'].map((i) => Article.fromJson(i)));

      return articles;
    } on DioError {
      rethrow;
    }
  }
}

class GetResultRequestsNotifier extends ResultStateNotifier<List<Article>> {
  final NewsRepository _newsRepository;

  GetResultRequestsNotifier(this._newsRepository);

  getLatest() {
    makeRequest(() => _newsRepository.getLatestArticles());
  }
}
