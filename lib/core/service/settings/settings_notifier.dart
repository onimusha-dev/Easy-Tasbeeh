import 'package:easy_tasbeeh/core/theme/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

import 'mixins/appearance_settings_mixin.dart';
import 'mixins/backup_settings_mixin.dart';
import 'mixins/dhikr_settings_mixin.dart';
import 'mixins/feedback_settings_mixin.dart';
import 'mixins/reminder_settings_mixin.dart';
import 'settings_service.dart';
import 'settings_state.dart';

class SettingsNotifier extends Notifier<SettingsState>
    with
        AppearanceSettingsMixin,
        FeedbackSettingsMixin,
        DhikrSettingsMixin,
        ReminderSettingsMixin,
        BackupSettingsMixin {
  @override
  SettingsState build() {
    final service = ref.watch(settingsServiceProvider);

    Future.microtask(() {
      refreshPermissionStatus();
      syncPresetsFromDb();
    });

    final settings = service.loadSettings();
    return settings.copyWith(
      appearance: settings.appearance.copyWith(
        colorScheme: AppColorScheme.sage,
      ),
    );
  }

  Future<void> refreshPermissionStatus() async {
    final status = await Permission.notification.status;
    state = state.copyWith(notificationPermissionGranted: status.isGranted);
  }

  Future<bool> requestNotificationPermission() async {
    final status = await Permission.notification.request();

    if (status.isGranted) {
      final exactStatus = await Permission.scheduleExactAlarm.status;
      if (exactStatus.isDenied || exactStatus.isPermanentlyDenied) {
        await Permission.scheduleExactAlarm.request();
      }
    }

    final finalStatus = await Permission.notification.status;
    final granted = finalStatus.isGranted;
    state = state.copyWith(notificationPermissionGranted: granted);
    return granted;
  }
}
