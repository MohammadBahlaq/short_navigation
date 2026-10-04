// ignore_for_file: unused_local_variable

part of 'package:short_navigation/short_navigation.dart';

enum SizeDirection {
  center,
  top,
  bottom,
  right,
  left,
}

abstract class GoSize {
  ///This is simple navigation all you have to do
  ///just pass your [widget] to go.
  ///
  ///If you use [sizeDirection] with [sizeAxis]
  ///and there is a conflict between them,
  ///the priority will be for [sizeAxis]
  ///for example: if you passed [Axis.vertical] and [SizeDirection.left]
  ///the [SizeDirection.left] will be ignored
  ///and the route will start from center and increase vertically
  static Future<T?> to<T extends Object?>(
    Widget page, {
    RouteSettings? settings,
    Duration transitionDuration = const Duration(milliseconds: 300),
    Duration reverseTransitionDuration = const Duration(milliseconds: 300),
    bool opaque = true,
    bool barrierDismissible = false,
    Color? barrierColor,
    String? barrierLabel,
    bool maintainState = true,
    bool fullscreenDialog = false,
    bool allowSnapshotting = true,
    SizeDirection sizeDirection = SizeDirection.center,
    Axis sizeAxis = Axis.vertical,
    Curve curve = Curves.linear,
  }) async {
    try {
      return await Go.navigatorKey.currentState!.push<T>(
        PageRouteBuilder(
            settings: settings,
            pageBuilder: (context, animation, secondaryAnimation) => page,
            transitionDuration: transitionDuration,
            reverseTransitionDuration: reverseTransitionDuration,
            opaque: opaque,
            barrierDismissible: barrierDismissible,
            barrierColor: barrierColor,
            barrierLabel: barrierLabel,
            maintainState: maintainState,
            fullscreenDialog: fullscreenDialog,
            allowSnapshotting: allowSnapshotting,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return GoTransitions.size(
                      sizeDirection: sizeDirection,
                      sizeAxis: sizeAxis,
                      curve: curve)
                  .builder(animation, child);
            }),
      );
    } catch (e) {
      _handleNavigationError(e);
    }
    return null;
  }

  ///This is simple navigation all you have to do
  ///just pass your [widget] to go and it will
  ///remove previous route from the tree.
  ///
  ///If you use [sizeDirection] with [sizeAxis]
  ///and there is a conflict between them,
  ///the priority will be for [sizeAxis]
  ///for example: if you passed [Axis.vertical] and [SizeDirection.left]
  ///the [SizeDirection.left] will be ignored
  ///and the route will start from center and increase vertically
  static Future<T?> toReplace<T extends Object?, TO extends Object?>(
    Widget page, {
    RouteSettings? settings,
    Duration transitionDuration = const Duration(milliseconds: 300),
    Duration reverseTransitionDuration = const Duration(milliseconds: 300),
    bool opaque = true,
    bool barrierDismissible = false,
    Color? barrierColor,
    String? barrierLabel,
    bool maintainState = true,
    bool fullscreenDialog = false,
    bool allowSnapshotting = true,
    SizeDirection sizeDirection = SizeDirection.center,
    Axis sizeAxis = Axis.vertical,
    Curve curve = Curves.linear,
  }) async {
    try {
      return await Go.navigatorKey.currentState!.pushReplacement<T, TO>(
        PageRouteBuilder(
            settings: settings,
            pageBuilder: (context, animation, secondaryAnimation) => page,
            transitionDuration: transitionDuration,
            reverseTransitionDuration: reverseTransitionDuration,
            opaque: opaque,
            barrierDismissible: barrierDismissible,
            barrierColor: barrierColor,
            barrierLabel: barrierLabel,
            maintainState: maintainState,
            fullscreenDialog: fullscreenDialog,
            allowSnapshotting: allowSnapshotting,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return GoTransitions.size(
                      sizeDirection: sizeDirection,
                      sizeAxis: sizeAxis,
                      curve: curve)
                  .builder(animation, child);
            }),
      );
    } catch (e) {
      _handleNavigationError(e);
    }
    return null;
  }

  ///This is simple navigation all you have to do
  ///just pass your [widget] to go and it will
  ///remove all routes from the tree.
  ///
  ///
  ///If you use [sizeDirection] with [sizeAxis]
  ///and there is a conflict between them,
  ///the priority will be for [sizeAxis]
  ///for example: if you passed [Axis.vertical] and [SizeDirection.left]
  ///the [SizeDirection.left] will be ignored
  ///and the route will start from center and increase vertically
  static Future<T?> toRemoveUntil<T extends Object?>(
    Widget page, {
    RouteSettings? settings,
    Duration transitionDuration = const Duration(milliseconds: 300),
    Duration reverseTransitionDuration = const Duration(milliseconds: 300),
    bool opaque = true,
    bool barrierDismissible = false,
    Color? barrierColor,
    String? barrierLabel,
    bool maintainState = true,
    bool fullscreenDialog = false,
    bool allowSnapshotting = true,
    SizeDirection sizeDirection = SizeDirection.center,
    Axis sizeAxis = Axis.vertical,
    Curve curve = Curves.linear,
    bool Function(Route<dynamic> route)? predicate,
  }) async {
    predicate ??= (route) => false;

    try {
      return await Go.navigatorKey.currentState!.pushAndRemoveUntil<T>(
        PageRouteBuilder(
            settings: settings,
            pageBuilder: (context, animation, secondaryAnimation) => page,
            transitionDuration: transitionDuration,
            reverseTransitionDuration: reverseTransitionDuration,
            opaque: opaque,
            barrierDismissible: barrierDismissible,
            barrierColor: barrierColor,
            barrierLabel: barrierLabel,
            maintainState: maintainState,
            fullscreenDialog: fullscreenDialog,
            allowSnapshotting: allowSnapshotting,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return GoTransitions.size(
                      sizeDirection: sizeDirection,
                      sizeAxis: sizeAxis,
                      curve: curve)
                  .builder(animation, child);
            }),
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
      Go.back();
      await to(page);
    } catch (e) {
      _handleNavigationError(e);
    }
  }
}
