import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'result_state_notifier.freezed.dart';

class ResultStateNotifier<T> extends StateNotifier<ResultState<T>> {
  ResultStateNotifier() : super(const ResultState.loading());

  Future<ResultState<T>> makeRequest(Future<T> Function() function) async {
    try {
      state = ResultState<T>.loading();
      final response = await function();
      final newState = ResultState<T>.success(response);
      if (mounted) {
        state = newState;
      }
      return newState;
    } catch (e, st) {
      final newState = ResultState<T>.error(e, st);
      if (mounted) {
        state = newState;
      }
      return newState;
    }
  }
}

@freezed
class ResultState<T> with _$ResultState<T> {
  const factory ResultState.loading() = Loading<T>;

  const factory ResultState.success(T? value) = Success<T>;

  const factory ResultState.error(Object error, StackTrace stackTrace) =
      Error<T>;
}
