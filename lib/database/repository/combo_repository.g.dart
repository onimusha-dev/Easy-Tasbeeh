// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'combo_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(comboRepository)
final comboRepositoryProvider = ComboRepositoryProvider._();

final class ComboRepositoryProvider
    extends
        $FunctionalProvider<ComboRepository, ComboRepository, ComboRepository>
    with $Provider<ComboRepository> {
  ComboRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'comboRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$comboRepositoryHash();

  @$internal
  @override
  $ProviderElement<ComboRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ComboRepository create(Ref ref) {
    return comboRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ComboRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ComboRepository>(value),
    );
  }
}

String _$comboRepositoryHash() => r'6dc4568b9d37a4cdfdae9c1798722515ff654aea';
