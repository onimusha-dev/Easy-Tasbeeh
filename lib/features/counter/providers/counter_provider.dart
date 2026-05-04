import 'package:easy_tasbeeh/core/service/settings_provider.dart';
import 'package:easy_tasbeeh/database/db.dart';
import 'package:easy_tasbeeh/database/repository/count_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentCountStreamProvider = StreamProvider<CurrentCountTableData?>((
  ref,
) {
  final settings = ref.watch(settingsProvider);
  final sessionId = settings.activeComboIndex >= 0
      ? sessionIdCombo
      : sessionIdSingle;
  return ref.watch(countRepositoryProvider).watchCountById(sessionId);
});

final counterProvider =
    NotifierProvider<CounterNotifier, AsyncValue<CurrentCountTableData?>>(() {
      return CounterNotifier();
    });

class CounterNotifier extends Notifier<AsyncValue<CurrentCountTableData?>> {
  @override
  AsyncValue<CurrentCountTableData?> build() {
    return ref.watch(currentCountStreamProvider);
  }

  Future<bool> increment() async {
    final repo = ref.read(countRepositoryProvider);
    final currentData = state.value;

    if (currentData == null) return false;

    final nextCount = currentData.currentCount + 1;
    final target = currentData.targetCount;
    final isTargetReached = target > 0 && nextCount >= target;

    await repo.increment();

    if (isTargetReached) {
      await repo.saveAndReset();
      return true;
    }

    return false;
  }

  Future<void> reset() async {
    await ref.read(countRepositoryProvider).reset();
  }

  Future<void> saveAndReset({bool isRestorable = true}) async {
    await ref
        .read(countRepositoryProvider)
        .saveAndReset(isRestorable: isRestorable);
  }

  Future<void> setTarget(int target, {int? sessionId}) async {
    await ref
        .read(countRepositoryProvider)
        .setTarget(target, sessionId: sessionId);
  }

  Future<void> setDhikrId(String dhikrId, {int? sessionId}) async {
    await ref
        .read(countRepositoryProvider)
        .setDhikrId(dhikrId, sessionId: sessionId);
  }

  Future<bool> restoreLastSession() async {
    return await ref.read(countRepositoryProvider).restoreLastSession();
  }
}
