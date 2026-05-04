import 'package:easy_tasbeeh/core/widgets/empty_state.dart';
import 'package:easy_tasbeeh/core/widgets/search_field.dart';
import 'package:easy_tasbeeh/features/learning/dhikr/widgets/dhikr_tile.dart';
import 'package:easy_tasbeeh/features/learning/providers/learning_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LearnDhikrScreen extends ConsumerStatefulWidget {
  const LearnDhikrScreen({super.key});

  @override
  ConsumerState<LearnDhikrScreen> createState() => _LearnDhikrScreenState();
}

class _LearnDhikrScreenState extends ConsumerState<LearnDhikrScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final learningState = ref.watch(learningProvider);

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: Text('Learn Dhikr', style: textTheme.titleMedium),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // The List (scrolls behind the search bar)
          learningState.dhikrs.isEmpty
              ? const Center(
                  child: EmptyState(
                    icon: Icons.search_off_rounded,
                    message: 'No dhikrs found',
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.fromLTRB(16, 80, 16, 40),
                  itemCount: learningState.dhikrs.length,
                  itemBuilder: (context, index) {
                    return DhikrTile(
                      item: learningState.dhikrs[index],
                      index: index + 1,
                      isLast: index == learningState.dhikrs.length - 1,
                    );
                  },
                ),

          // Floating Glass Search Bar Area
          Positioned(
            top: 10,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SearchField(
                controller: _searchController,
                hintText: 'Search dhikr...',
                onChanged: (query) => ref.read(learningProvider.notifier).filter(query),
                onClear: () {
                  _searchController.clear();
                  ref.read(learningProvider.notifier).clearSearch();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
