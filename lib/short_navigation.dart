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
    try {
      return navigatorKey.currentState!.push<T>(
        MaterialPageRoute(
          builder: (context) => page,
          allowSnapshotting: allowSnapshotting,
          barrierDismissible: barrierDismissible,
          fullscreenDialog: fullscreenDialog,
          maintainState: maintainState,
          settings: settings,
        ),
      );
    } catch (e) {
      _handleNavigationError(e);
    }
    return null;
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
    try {
      return navigatorKey.currentState!.pushReplacement<T, TO>(
        MaterialPageRoute(
          builder: (context) => page,
          allowSnapshotting: allowSnapshotting,
          barrierDismissible: barrierDismissible,
          fullscreenDialog: fullscreenDialog,
          maintainState: maintainState,
          settings: settings,
        ),
      );
    } catch (e) {
      _handleNavigationError(e);
    }

    return null;
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
    bool Function(Route<dynamic> route)? predicate,
  }) async {
    predicate ??= (route) => false;

    try {
      return navigatorKey.currentState!.pushAndRemoveUntil<T>(
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
    } catch (e) {
      _handleNavigationError(e);
    }
    return null;
  }

  ///If you want to pop sothing before
  ///pushing to another widget you could use it,
  ///just pass your [widget] to go
  static Future<void> backAndTo(Widget page) async {
    try {
      back();
      to(page);
    } catch (e) {
      _handleNavigationError(e);
    }
  }

  ///This is simple navigation all you have to do
  ///just passing your route [name] to go
  static Future<T?> toName<T extends Object?>(String page,
      {Object? arguments}) async {
    try {
      return navigatorKey.currentState!.pushNamed<T>(
        page,
        arguments: arguments,
      );
    } catch (e) {
      _handleNavigationError(e);
    }
    return null;
  }

  ///This is simple navigation all you have to do
  ///just pass your route [name] to go and it will
  ///remove previous route from the tree
  static Future<T?> toReplaceName<T extends Object?, TO extends Object?>(
      String page,
      {Object? arguments}) async {
    try {
      return navigatorKey.currentState!.pushReplacementNamed<T, TO>(
        page,
        arguments: arguments,
      );
    } catch (e) {
      _handleNavigationError(e);
    }
    return null;
  }

  ///This is simple navigation all you have to do
  ///just pass your route [name] to go and it will
  ///remove all routes from the tree
  static Future<T?> toNameRemoveUntil<T extends Object?>(
    String page, {
    Object? arguments,
    bool Function(Route<dynamic> route)? predicate,
  }) async {
    predicate ??= (route) => false;

    try {
      return navigatorKey.currentState!.pushNamedAndRemoveUntil<T>(
        page,
        predicate,
        arguments: arguments,
      );
    } catch (e) {
      _handleNavigationError(e);
    }
    return null;
  }

  ///If you want to pop sothing before
  ///pushing to another widget you could use it,
  ///just pass your route [name] to go
  static Future<T?> backAndToName<T extends Object?, TO extends Object?>(
      String page,
      {Object? arguments,
      TO? result}) async {
    try {
      return navigatorKey.currentState!.popAndPushNamed<T, TO>(
        page,
        arguments: arguments,
        result: result,
      );
    } catch (e) {
      _handleNavigationError(e);
    }
    return null;
  }

  ///If you need to back to previous page you can use this function,
  ///however if you need to pop many routes you simply
  ///have to pass how many time you want to pop
  ///using [numOfBacks].
  ///There is no need to pass [numOfBacks] if you just want to pop one time.
  static void multiBack([int? numOfBacks]) async {
    try {
      if (numOfBacks == null) {
        navigatorKey.currentState!.pop();
      } else {
        for (var i = 0; i < numOfBacks; i++) {
          navigatorKey.currentState!.pop();
        }
      }
    } catch (e) {
      _handleNavigationError(e);
    }
  }

  static void back<T extends Object?>([T? result]) async {
    return navigatorKey.currentState!.pop(result);
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
    try {
      predicate ??= (route) => route.isFirst;

      navigatorKey.currentState!.popUntil(predicate);
    } catch (e) {
      _handleNavigationError(e);
    }
  }

  ///Returns true if you can pop without any problems, otherwise it will reurn false
  static bool? canBack() {
    try {
      return navigatorKey.currentState!.canPop();
    } catch (e) {
      _handleNavigationError(e);
    }
    return null;
  }
}

void _handleNavigationError(Object e) {
  if (e.toString().contains("Unexpected null value")) {
    debugPrint(
      "${'\x1B[31m'}[short_navigation]: Please make sure that you passed Go.navigatorKey to navigatorKey in MaterialApp like this `navigatorKey: Go.navigatorKey`",
    );
  } else {
    GoMessenger.dialog(AlertDialog(
      alignment: Alignment.center,
      content: Text(e.toString()),
    ));

    debugPrint(
      "${'\x1B[31m'}[short_navigation]: ${e.toString()}",
    );
  }
}
