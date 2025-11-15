import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inthon_7_professor/app/routing/router_service.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ShadCard(
          title: Text('Something went wrong'),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.error, size: 64, color: Colors.red),
                SizedBox(height: 16),
                ShadButton.ghost(
                  onPressed: () {
                    context.go(Routes.home);
                  },
                  child: Text('Go Back Home'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
