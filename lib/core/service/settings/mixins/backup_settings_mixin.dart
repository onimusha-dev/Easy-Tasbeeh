import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workmanager/workmanager.dart';
import '../settings_state.dart';
import '../settings_service.dart';

mixin BackupSettingsMixin on Notifier<SettingsState> {
  SettingsService get _service => ref.read(settingsServiceProvider);

  Future<void> togglePeriodicBackup(bool v) async {
    await _service.setBool('periodicBackupEnabled', v);
    state = state.copyWith(
      backup: state.backup.copyWith(periodicBackupEnabled: v),
    );

    if (v && state.backup.backupDirectory != null) {
      await Workmanager().registerPeriodicTask(
        '1',
        'dailyBackup',
        frequency: const Duration(days: 1),
        existingWorkPolicy: ExistingPeriodicWorkPolicy.keep,
        constraints: Constraints(requiresBatteryNotLow: true),
      );
    } else {
      await Workmanager().cancelByUniqueName('1');
    }
  }

  Future<void> setBackupDirectory(String? path) async {
    if (path == null) {
      await _service.remove('backupDirectory');
    } else {
      await _service.setString('backupDirectory', path);
    }
    state = state.copyWith(
      backup: state.backup.copyWith(backupDirectory: path),
    );
  }

  Future<void> completeOnboarding() async {
    await _service.setBool('onboardingCompleted', true);
    state = state.copyWith(onboardingCompleted: true);
  }
}
