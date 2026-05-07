import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:easy_tasbeeh/database/dao/combo_presets_dao.dart';
import 'package:easy_tasbeeh/database/db.dart';
import 'package:easy_tasbeeh/core/service/settings/settings_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'combo_repository.g.dart';

@Riverpod(keepAlive: true)
ComboRepository comboRepository(Ref ref) {
  final dao = ref.watch(comboPresetsDaoProvider);
  return ComboRepository(dao);
}

class ComboRepository {
  final ComboPresetsDao _dao;

  ComboRepository(this._dao);

  Future<List<ComboPreset>> getAllPresets() async {
    final data = await _dao.getAllPresets();
    return data.map(_mapToModel).toList();
  }

  Stream<List<ComboPreset>> watchAllPresets() {
    return _dao.watchAllPresets().map((list) => list.map(_mapToModel).toList());
  }

  Future<void> savePreset(ComboPreset preset) async {
    await _dao.insertPreset(
      ComboPresetsTableCompanion(
        id: Value(preset.id),
        name: Value(preset.name),
        dhikrIds: Value(jsonEncode(preset.dhikrIds)),
        counts: Value(jsonEncode(preset.counts)),
      ),
    );
  }

  Future<void> deletePreset(String id) async {
    await _dao.deletePreset(id);
  }

  Future<void> updatePositions(List<ComboPreset> presets) async {
    final tableData = presets
        .map(
          (p) => ComboPresetsTableData(
            id: p.id,
            name: p.name,
            dhikrIds: jsonEncode(p.dhikrIds),
            counts: jsonEncode(p.counts),
            position: 0, // Position will be set by the DAO method
            createdAt: DateTime.now(),
          ),
        )
        .toList();
    await _dao.updatePresetsPositions(tableData);
  }

  ComboPreset _mapToModel(ComboPresetsTableData data) {
    return ComboPreset(
      id: data.id,
      name: data.name,
      dhikrIds: List<String>.from(jsonDecode(data.dhikrIds)),
      counts: List<int>.from(jsonDecode(data.counts)),
    );
  }
}
