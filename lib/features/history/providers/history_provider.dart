import 'package:easy_tasbeeh/database/db.dart';
import 'package:easy_tasbeeh/database/repository/count_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final historyStreamProvider = StreamProvider<List<CountHistoryTableData>>((ref) {
  return ref.watch(countRepositoryProvider).watchAllHistory();
});

final historyProvider = NotifierProvider<HistoryNotifier, AsyncValue<List<CountHistoryTableData>>>(() {
  return HistoryNotifier();
});

class HistoryNotifier extends Notifier<AsyncValue<List<CountHistoryTableData>>> {
  @override
  AsyncValue<List<CountHistoryTableData>> build() {
    return ref.watch(historyStreamProvider);
  }

  Future<void> clearAll() async {
    await ref.read(countRepositoryProvider).deleteAllHistory();
  }

  Future<void> deleteItem(int id) async {
    await ref.read(countRepositoryProvider).deleteHistoryById(id);
  }
}
