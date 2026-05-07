import 'package:flutter/material.dart' show ThemeMode;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../settings_state.dart';
import '../settings_service.dart';
import '../../../theme/theme.dart';

mixin AppearanceSettingsMixin on Notifier<SettingsState> {
  SettingsService get _service => ref.read(settingsServiceProvider);

  Future<void> setThemeMode(ThemeMode mode) async {
    await _service.setString('themeMode', mode.name);
    state = state.copyWith(
      appearance: state.appearance.copyWith(themeMode: mode),
    );
  }

  Future<void> setColorScheme(AppColorScheme scheme) async {
    await _service.setString('colorScheme', scheme.name);
    state = state.copyWith(
      appearance: state.appearance.copyWith(colorScheme: scheme),
    );
  }

  Future<void> setBackground(String path) async {
    await _service.setString('background', path);
    state = state.copyWith(
      appearance: state.appearance.copyWith(background: path),
    );
  }

  Future<void> setBackgroundOpacity(double value) async {
    await _service.setDouble('backgroundOpacity', value);
    state = state.copyWith(
      appearance: state.appearance.copyWith(backgroundOpacity: value),
    );
  }

  Future<void> setButtonStyle(PressButtonStyle style) async {
    await _service.setString('pressButtonStyle', style.name);
    state = state.copyWith(
      appearance: state.appearance.copyWith(pressButtonStyle: style),
    );
  }

  Future<void> setButtonSize(double value) async {
    await _service.setDouble('buttonSize', value);
    state = state.copyWith(
      appearance: state.appearance.copyWith(buttonSize: value),
    );
  }

  Future<void> toggleCenterButton(bool value) async {
    await _service.setBool('centerButton', value);
    state = state.copyWith(
      appearance: state.appearance.copyWith(centerButton: value),
    );
  }

  void updateCenterButtonTemporary(bool value) {
    state = state.copyWith(
      appearance: state.appearance.copyWith(centerButton: value),
    );
  }
}
