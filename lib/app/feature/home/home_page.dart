import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inthon_7_professor/app/extension/build_context_x.dart';
import 'package:inthon_7_professor/app/feature/home/logic/home_provider.dart';
import 'package:inthon_7_professor/app/feature/home/widgets/home_initial_panel.dart';
import 'package:inthon_7_professor/app/feature/home/widgets/tutorial_dialog.dart';
import 'package:inthon_7_professor/app/routing/router_service.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    ref.read(homeProvider.notifier).getCources();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // SizedBox(height: 100),
            Column(
              children: [
                Transform.translate(
                  offset: Offset(0, 80),
                  child: SvgPicture.asset(
                    'assets/logo_icononly.svg',
                    width: 300,
                  ),
                ),
                SizedBox(height: 5),
                Text('나작교', style: context.textTheme.h3),
                Text(
                  '나만의 작은 교수',
                  style: TextStyle(fontSize: 11, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 24),
            HomeInitialPanel(),
            const SizedBox(height: 5),
            ShadButton.ghost(
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
      ),
    );
  }
}
