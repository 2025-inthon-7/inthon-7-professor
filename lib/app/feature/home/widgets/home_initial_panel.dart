import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';
import 'package:inthon_7_professor/app/extension/build_context_x.dart';
import 'package:inthon_7_professor/app/feature/home/logic/home_provider.dart';
import 'package:inthon_7_professor/app/feature/home/logic/home_state.dart';
import 'package:inthon_7_professor/app/feature/home/widgets/tutorial_dialog.dart';
import 'package:inthon_7_professor/app/routing/router_service.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

const frameworks = {
  'nextjs': 'Next.js',
  'svelte': 'SvelteKit',
  'nuxtjs': 'Nuxt.js',
  'remix': 'Remix',
  'astro': 'Astro',
};

class HomeInitialPanel extends ConsumerWidget {
  const HomeInitialPanel({super.key});

  Map<String, String> filteredFrameworks(String searchValue) => {
    for (final framework in frameworks.entries)
      if (framework.value.toLowerCase().contains(searchValue.toLowerCase()))
        framework.key: framework.value,
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeProvider);

    return Center(
      child: ShadCard(
        width: 300,
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
                  enabled: state.className.isNotEmpty,
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
                ShadButton.ghost(
                  width: double.maxFinite,
                  onPressed: () {
                    showShadDialog(
                      context: context,
                      builder: (context) {
                        return TutorialDialog();
                      },
                    );
                  },

                  child: const Text('나작교가 뭔가요?'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _selectClass(WidgetRef ref, HomeState state, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('수업 선택', style: context.textTheme.small),
        const SizedBox(height: 12),
        ShadSelect<String>.withSearch(
          minWidth: 250,
          maxWidth: 250,
          maxHeight: 400,
          placeholder: const Text('Select framework...'),
          onSearchChanged: (value) =>
              ref.read(homeProvider.notifier).onSearchClassName(value),
          onChanged: (value) {
            if (value != null) {
              ref.read(homeProvider.notifier).onSelectClassName(value);
            }
          },
          searchPlaceholder: const Text('Search framework'),
          options: [
            if (filteredFrameworks(state.classSearchValue).isEmpty)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: Text('No framework found'),
              ),
            ...frameworks.entries.map((framework) {
              return Offstage(
                offstage: !filteredFrameworks(
                  state.classSearchValue,
                ).containsKey(framework.key),
                child: ShadOption(
                  value: framework.key,
                  child: Text(framework.value),
                ),
              );
            }),
          ],
          selectedOptionBuilder: (context, value) => Text(frameworks[value]!),
        ),
      ],
    );
  }
}
