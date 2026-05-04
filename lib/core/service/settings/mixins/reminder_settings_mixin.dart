import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../settings_state.dart';
import '../settings_service.dart';

mixin ReminderSettingsMixin on Notifier<SettingsState> {
  SettingsService get _service => ref.read(settingsServiceProvider);

  Future<void> toggleMorningReminder(bool v) async {
    await _service.setBool('morningReminder', v);
    state = state.copyWith(
      reminders: state.reminders.copyWith(morningReminder: v),
    );
  }

  Future<void> setMorningTime(int h, int m) async {
    final time = ReminderTime(h, m);
    await _service.setString('morningTime', jsonEncode(time.toJson()));
    state = state.copyWith(
      reminders: state.reminders.copyWith(morningTime: time),
    );
  }

  Future<void> toggleEveningReminder(bool v) async {
    await _service.setBool('eveningReminder', v);
    state = state.copyWith(
      reminders: state.reminders.copyWith(eveningReminder: v),
    );
  }

  Future<void> setEveningTime(int h, int m) async {
    final time = ReminderTime(h, m);
    await _service.setString('eveningTime', jsonEncode(time.toJson()));
    state = state.copyWith(
      reminders: state.reminders.copyWith(eveningTime: time),
    );
  }

  Future<void> toggleSayingReminders(bool v) async {
    await _service.setBool('sayingReminders', v);
    state = state.copyWith(
      reminders: state.reminders.copyWith(sayingReminders: v),
    );
  }

  Future<void> setSayingsPerDay(int v) async {
    await _service.setInt('sayingsPerDay', v);
    state = state.copyWith(
      reminders: state.reminders.copyWith(sayingsPerDay: v),
    );
  }

  Future<void> toggleAfterSalahReminder(bool v) async {
    await _service.setBool('afterSalahReminder', v);
    state = state.copyWith(
      reminders: state.reminders.copyWith(afterSalahReminder: v),
    );
  }

  Future<void> toggleAfterSalahFajr(bool v) async {
    await _service.setBool('afterSalahFajr', v);
    state = state.copyWith(
      reminders: state.reminders.copyWith(afterSalahFajr: v),
    );
  }

  Future<void> setAfterSalahFajrTime(int h, int m) async {
    final time = ReminderTime(h, m);
    await _service.setString('afterSalahFajrTime', jsonEncode(time.toJson()));
    state = state.copyWith(
      reminders: state.reminders.copyWith(afterSalahFajrTime: time),
    );
  }

  Future<void> toggleAfterSalahDhuhr(bool v) async {
    await _service.setBool('afterSalahDhuhr', v);
    state = state.copyWith(
      reminders: state.reminders.copyWith(afterSalahDhuhr: v),
    );
  }

  Future<void> setAfterSalahDhuhrTime(int h, int m) async {
    final time = ReminderTime(h, m);
    await _service.setString('afterSalahDhuhrTime', jsonEncode(time.toJson()));
    state = state.copyWith(
      reminders: state.reminders.copyWith(afterSalahDhuhrTime: time),
    );
  }

  Future<void> toggleAfterSalahAsr(bool v) async {
    await _service.setBool('afterSalahAsr', v);
    state = state.copyWith(
      reminders: state.reminders.copyWith(afterSalahAsr: v),
    );
  }

  Future<void> setAfterSalahAsrTime(int h, int m) async {
    final time = ReminderTime(h, m);
    await _service.setString('afterSalahAsrTime', jsonEncode(time.toJson()));
    state = state.copyWith(
      reminders: state.reminders.copyWith(afterSalahAsrTime: time),
    );
  }

  Future<void> toggleAfterSalahMaghrib(bool v) async {
    await _service.setBool('afterSalahMaghrib', v);
    state = state.copyWith(
      reminders: state.reminders.copyWith(afterSalahMaghrib: v),
    );
  }

  Future<void> setAfterSalahMaghribTime(int h, int m) async {
    final time = ReminderTime(h, m);
    await _service.setString(
      'afterSalahMaghribTime',
      jsonEncode(time.toJson()),
    );
    state = state.copyWith(
      reminders: state.reminders.copyWith(afterSalahMaghribTime: time),
    );
  }

  Future<void> toggleAfterSalahIsha(bool v) async {
    await _service.setBool('afterSalahIsha', v);
    state = state.copyWith(
      reminders: state.reminders.copyWith(afterSalahIsha: v),
    );
  }

  Future<void> setAfterSalahIshaTime(int h, int m) async {
    final time = ReminderTime(h, m);
    await _service.setString('afterSalahIshaTime', jsonEncode(time.toJson()));
    state = state.copyWith(
      reminders: state.reminders.copyWith(afterSalahIshaTime: time),
    );
  }
}
