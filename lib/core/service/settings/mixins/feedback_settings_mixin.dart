import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../settings_state.dart';
import '../settings_service.dart';

mixin FeedbackSettingsMixin on Notifier<SettingsState> {
  SettingsService get _service => ref.read(settingsServiceProvider);

  Future<void> toggleHaptic(bool value) async {
    await _service.setBool('hapticEnabled', value);
    state = state.copyWith(
      feedback: state.feedback.copyWith(hapticEnabled: value),
    );
  }

  Future<void> toggleTapSound(bool value) async {
    await _service.setBool('tapSound', value);
    state = state.copyWith(feedback: state.feedback.copyWith(tapSound: value));
  }

  Future<void> toggleGoalReachedSound(bool value) async {
    await _service.setBool('goalReachedSound', value);
    state = state.copyWith(
      feedback: state.feedback.copyWith(goalReachedSound: value),
    );
  }

  Future<void> toggleGoalHapticPattern(bool value) async {
    await _service.setBool('goalHapticPattern', value);
    state = state.copyWith(
      feedback: state.feedback.copyWith(goalHapticPattern: value),
    );
  }

  Future<void> toggleVibrateOnMilestone(bool value) async {
    await _service.setBool('vibrateOnMilestone', value);
    state = state.copyWith(
      feedback: state.feedback.copyWith(vibrateOnMilestone: value),
    );
  }

  Future<void> setMilestoneValue(int value) async {
    await _service.setInt('milestoneValue', value);
    state = state.copyWith(
      feedback: state.feedback.copyWith(milestoneValue: value),
    );
  }

  Future<void> toggleShowParticles(bool value) async {
    await _service.setBool('showParticles', value);
    state = state.copyWith(
      feedback: state.feedback.copyWith(showParticles: value),
    );
  }

  Future<void> toggleSound(bool value) async {
    await _service.setBool('soundEnabled', value);
    state = state.copyWith(
      feedback: state.feedback.copyWith(soundEnabled: value),
    );
  }

  Future<void> setVolume(double value) async {
    await _service.setDouble('volume', value);
    state = state.copyWith(feedback: state.feedback.copyWith(volume: value));
  }

  Future<void> setHapticIntensity(double value) async {
    await _service.setDouble('hapticIntensity', value);
    state = state.copyWith(
      feedback: state.feedback.copyWith(hapticIntensity: value),
    );
  }
}
