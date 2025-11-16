import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';
import 'package:inthon_7_professor/app/extension/build_context_x.dart';
import 'package:inthon_7_professor/app/feature/home/logic/home_provider.dart';
import 'package:inthon_7_professor/app/feature/home/logic/home_state.dart';
import 'package:inthon_7_professor/app/feature/home/widgets/tutorial_dialog.dart';
import 'package:inthon_7_professor/app/model/course.dart';
import 'package:inthon_7_professor/app/routing/router_service.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class HomeInitialPanel extends ConsumerWidget {
  const HomeInitialPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeProvider);

    return Center(
      child: ShadCard(
        width: 400,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _selectClass(ref, state, context),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                ShadButton(
                  enabled: state.selectedCourse != null,
                  width: double.maxFinite,
                  onPressed: () async {
                    if (ref.read(homeProvider).isStartingClass) return;
                    ref.read(homeProvider.notifier).startClass().then((
                      success,
                    ) {
                      if (success && context.mounted) {
                        context.go(Routes.classRoom);
                      }
                    });
                  },
                  child: const Text('수업 시작'),
                ),

                const SizedBox(height: 5),
                ShadButton.outline(
                  width: double.maxFinite,
                  leading: const Icon(Icons.history),
                  onPressed: () {
                    context.go(Routes.history);
                  },
                  child: const Text('수업 기록'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _selectClass(WidgetRef ref, HomeState state, BuildContext context) {
    final cources = state.cources;
    final filteredCources = cources.where((cource) {
      return cource.displayName.toLowerCase().contains(
        state.classSearchValue.toLowerCase(),
      );
    }).toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('수업 선택', style: context.textTheme.small),
        const SizedBox(height: 12),
        ShadSelect<int>.withSearch(
          minWidth: 350,
          maxWidth: 350,
          maxHeight: 400,
          placeholder: const Text('수업을 선택 해 주세요..'),
          onSearchChanged: (value) =>
              ref.read(homeProvider.notifier).onSearchClassName(value),
          onChanged: (value) {
            if (value != null) {
              ref
                  .read(homeProvider.notifier)
                  .onSelectCourse(
                    cources.firstWhere((cource) => cource.id == value),
                  );
            }
          },
          searchPlaceholder: const Text('검색'),
          options: [
            if (filteredCources.isEmpty)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: Text('검색 결과가 없습니다.'),
              ),
            ...cources.map((course) {
              return Offstage(
                offstage: !filteredCources.contains(course),
                child: ShadOption(
                  value: course.id,
                  child: Text(course.displayName),
                ),
              );
            }),
          ],
          selectedOptionBuilder: (context, value) => Text(
            cources.firstWhere((cource) => cource.id == value).displayName,
          ),
        ),
      ],
    );
  }
}
