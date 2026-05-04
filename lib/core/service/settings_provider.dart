import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'settings/settings_notifier.dart';
import 'settings/settings_state.dart';

export 'settings/settings_notifier.dart';
export 'settings/settings_service.dart';
export 'settings/settings_state.dart';

final settingsProvider = NotifierProvider<SettingsNotifier, SettingsState>(() {
  return SettingsNotifier();
});
