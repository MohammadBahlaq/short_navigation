import 'package:flutter/material.dart';

part 'animation_routes.dart/fade_transition.dart';
part 'animation_routes.dart/rotaion_transition.dart';
part 'animation_routes.dart/scale_transition.dart';
part 'animation_routes.dart/size_transition.dart';
part 'animation_routes.dart/slide_right.dart';
part 'basic_routes/bottom_sheet_route.dart';
part 'basic_routes/dialog_route.dart';
part 'basic_routes/page_route_builder.dart';
part 'basic_routes/raw_dialog_route.dart';
part 'messenger.dart';
part 'of.dart';

abstract class Go {
  static final GlobalKey<NavigatorState> _navigatorKey =
      GlobalKey<NavigatorState>();

  ///This is navigatorKey you have to pass it in the MaterialApp in the main.dart
  static GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  ///If you need context in any file in your code you can use it
  static BuildContext get context => _navigatorKey.currentContext!;

  ///This is simple navigation all you have to do
  ///just pass your [widget] to go
  static Future<T?> to<T extends Object?>(
    Widget page, {
    bool allowSnapshotting = true,
    bool barrierDismissible = false,
    bool fullscreenDialog = false,
    bool maintainState = true,
    RouteSettings? settings,
  }) async {
    return navigatorKey.currentState?.push<T>(
      MaterialPageRoute(
        builder: (context) => page,
        allowSnapshotting: allowSnapshotting,
        barrierDismissible: barrierDismissible,
        fullscreenDialog: fullscreenDialog,
        maintainState: maintainState,
        settings: settings,
      ),
    );
  }

  ///This is simple navigation all you have to do
  ///just pass your [widget] to go and it will
  ///remove previous route from the tree
  static Future<T?> toReplace<T extends Object?, TO extends Object?>(
    Widget page, {
    bool allowSnapshotting = true,
    bool barrierDismissible = false,
    bool fullscreenDialog = false,
    bool maintainState = true,
    RouteSettings? settings,
  }) async {
    return navigatorKey.currentState?.pushReplacement<T, TO>(
      MaterialPageRoute(
        builder: (context) => page,
        allowSnapshotting: allowSnapshotting,
        barrierDismissible: barrierDismissible,
        fullscreenDialog: fullscreenDialog,
        maintainState: maintainState,
        settings: settings,
      ),
    );
  }

  ///This is simple navigation all you have to do
  ///just pass your [widget] to go and it will
  ///remove all routes from the tree
  static Future<T?> toRemoveUntil<T extends Object?>(
    Widget page, {
    bool allowSnapshotting = true,
    bool barrierDismissible = false,
    bool fullscreenDialog = false,
    bool maintainState = true,
    RouteSettings? settings,
    bool Function(Route<dynamic>)? predicate,
  }) async {
    predicate ??= (route) => false;

    return navigatorKey.currentState?.pushAndRemoveUntil<T>(
      MaterialPageRoute(
        builder: (context) => page,
        allowSnapshotting: allowSnapshotting,
        barrierDismissible: barrierDismissible,
        fullscreenDialog: fullscreenDialog,
        maintainState: maintainState,
        settings: settings,
      ),
      predicate,
    );
  }

  ///If you want to pop sothing before
  ///pushing to another widget you could use it,
  ///just pass your [widget] to go
  static Future<void> backAndTo(Widget page) async {
    back();
    to(page);
  }

  ///This is simple navigation all you have to do
  ///just passing your route [name] to go
  static Future<T?> toName<T extends Object?>(String page,
      {Object? arguments}) async {
    return navigatorKey.currentState?.pushNamed<T>(
      page,
      arguments: arguments,
    );
  }

  ///This is simple navigation all you have to do
  ///just pass your route [name] to go and it will
  ///remove previous route from the tree
  static Future<T?> toReplaceName<T extends Object?, TO extends Object?>(
      String page,
      {Object? arguments}) async {
    return navigatorKey.currentState?.pushReplacementNamed<T, TO>(
      page,
      arguments: arguments,
    );
  }

  ///This is simple navigation all you have to do
  ///just pass your route [name] to go and it will
  ///remove all routes from the tree
  static Future<T?> toNameRemoveAll<T extends Object?>(
    String page, {
    Object? arguments,
    bool Function(Route<dynamic>)? predicate,
  }) async {
    predicate ??= (route) => false;

    return navigatorKey.currentState?.pushNamedAndRemoveUntil<T>(
      page,
      predicate,
      arguments: arguments,
    );
  }

  ///If you want to pop sothing before
  ///pushing to another widget you could use it,
  ///just pass your route [name] to go
  static Future<T?> backAndToName<T extends Object?, TO extends Object?>(
      String page,
      {Object? arguments,
      TO? result}) async {
    return navigatorKey.currentState?.popAndPushNamed<T, TO>(
      page,
      arguments: arguments,
      result: result,
    );
  }

  ///If you need to back to previous page you can use this function,
  ///however if you need to pop many routes you simply
  ///have to pass how many time you want to pop
  ///using [numOfBacks].
  ///There is no need to pass [numOfBacks] if you just want to pop one time.
  static void multiBack([int? numOfBacks]) async {
    if (numOfBacks == null) {
      navigatorKey.currentState?.pop();
    } else {
      for (var i = 0; i < numOfBacks; i++) {
        navigatorKey.currentState?.pop();
      }
    }
  }

  static void back<T extends Object?>([T? result]) async {
    return navigatorKey.currentState?.pop(result);
  }

  /// Calls [back] repeatedly until the predicate returns true.
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// void _doLogout() {
  ///   navigator.backUntil(ModalRoute.withName('/login'));
  /// }
  /// ```
  static void backUntil({RoutePredicate? predicate}) async {
    predicate ??= (route) => route.isFirst;

    navigatorKey.currentState?.popUntil(predicate);
  }

  ///Returns true if you can pop without any problems, otherwise it will reurn false
  static bool? canBack() {
    return navigatorKey.currentState?.canPop();
  }
}
