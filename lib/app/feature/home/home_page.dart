import 'package:flutter/material.dart';
import 'package:inthon_7_professor/app/extension/build_context_x.dart';
import 'package:inthon_7_professor/app/feature/home/widgets/home_initial_panel.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 추천 방법
            Column(
              children: [
                Transform.translate(
                  offset: Offset(0, 80),
                  child: SvgPicture.asset(
                    'assets/logo_icononly.svg', // 텍스트 없는 아이콘만
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
            SizedBox(height: 150),
          ],
        ),
      ),
    );
  }
}
