import 'package:easy_tasbeeh/core/models/dhikr_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final learningProvider = NotifierProvider<LearningNotifier, LearningState>(() {
  return LearningNotifier();
});

class LearningState {
  final List<DhikrItem> dhikrs;
  final String searchQuery;

  LearningState({required this.dhikrs, required this.searchQuery});

  LearningState copyWith({List<DhikrItem>? dhikrs, String? searchQuery}) {
    return LearningState(
      dhikrs: dhikrs ?? this.dhikrs,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}

class LearningNotifier extends Notifier<LearningState> {
  @override
  LearningState build() {
    return LearningState(dhikrs: dhikrList, searchQuery: '');
  }

  void filter(String query) {
    final filtered = dhikrList
        .where(
          (item) =>
              item.transliteration.toLowerCase().contains(query.toLowerCase()) ||
              item.translation.toLowerCase().contains(query.toLowerCase()) ||
              item.arabic.contains(query) ||
              (item.category?.toLowerCase().contains(query.toLowerCase()) ??
                  false),
        )
        .toList();
    state = state.copyWith(dhikrs: filtered, searchQuery: query);
  }

  void clearSearch() {
    state = state.copyWith(dhikrs: dhikrList, searchQuery: '');
  }
}
