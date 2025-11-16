import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:inthon_7_professor/app/feature/classroom/classroom_page.dart';
import 'package:inthon_7_professor/app/feature/error/error_page.dart';
import 'package:inthon_7_professor/app/feature/history/history_page.dart';
import 'package:inthon_7_professor/app/feature/home/home_page.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

extension GoRouterX on GoRouter {
  BuildContext? get context => configuration.navigatorKey.currentContext;
  OverlayState? get overlayState {
    final context = this.context;
    if (context == null) return null;
    return Overlay.of(context);
  }

  Uri get currentUri {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri;
  }
}

abstract class Routes {
  static const String home = '/';
  static const String error = '/error';
  static const String classRoom = '/classroom';
  static const String history = '/history';
}

class RouterService {
  static RouterService get I => GetIt.I<RouterService>();

  late final GoRouter router;

  String? queryParameter(String key) => router.currentUri.queryParameters[key];

  void showToast(String message, {String? description}) {
    final context = router.context;
    if (context == null) return;
    ShadToaster.of(context).show(
      ShadToast(
        title: Text(message),
        description: description == null ? null : Text(description),
        action: ShadButton.outline(
          child: const Text('닫기'),
          onPressed: () => ShadToaster.of(context).hide(),
        ),
      ),
    );
  }

  void init() {
    router = GoRouter(
      initialLocation: Routes.home,
      routes: [
        GoRoute(
          path: Routes.home,
          builder: (context, state) {
            // var args = state.extra;
            return const HomePage();
          },
        ),
        GoRoute(
          path: Routes.classRoom,
          builder: (context, state) {
            return const ClassroomPage();
          },
        ),
        GoRoute(
          path: Routes.history,
          builder: (context, state) {
            return const HistoryPage();
          },
        ),
      ], // TODO: Add routes

      errorBuilder: (context, state) {
        return const ErrorPage();
      },
    );
  }
}
