// ignore_for_file: unused_local_variable

part of 'package:short_navigation/short_navigation.dart';

enum SizeDirection {
  center,
  top,
  bottom,
  right,
  left,
}

class GoSize {
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
      return Go.navigatorKey.currentState!.push<T>(
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
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              _sizeTransitionBuilder(
            sizeDirection,
            sizeAxis,
            animation,
            curve,
            child,
          ),
        ),
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
      return Go.navigatorKey.currentState!.pushReplacement<T, TO>(
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
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              _sizeTransitionBuilder(
            sizeDirection,
            sizeAxis,
            animation,
            curve,
            child,
          ),
        ),
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
      return Go.navigatorKey.currentState!.pushAndRemoveUntil<T>(
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
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              _sizeTransitionBuilder(
            sizeDirection,
            sizeAxis,
            animation,
            curve,
            child,
          ),
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
      Go.back();
      to(page);
    } catch (e) {
      _handleNavigationError(e);
    }
  }

  static Widget _sizeTransitionBuilder(
    SizeDirection sizeDirection,
    Axis sizeAxis,
    Animation<double> animation,
    Curve curve,
    Widget child,
  ) {
    Tween<double> tween = Tween(
      begin: 0,
      end: 1,
    );

    CurvedAnimation curvedAnimation = CurvedAnimation(
      parent: animation,
      curve: curve,
    );

    Alignment alignment;

    switch (sizeDirection) {
      case SizeDirection.center:
        alignment = Alignment.center;
        break;
      case SizeDirection.top:
        alignment = Alignment.topCenter;
        break;
      case SizeDirection.bottom:
        alignment = Alignment.bottomCenter;
        break;
      case SizeDirection.right:
        alignment = Alignment.centerRight;
        break;
      case SizeDirection.left:
        alignment = Alignment.centerLeft;
        break;
    }

    return Align(
      alignment: alignment,
      child: SizeTransition(
        sizeFactor: tween.animate(curvedAnimation),
        axis: sizeAxis,
        child: child,
      ),
    );
  }
}
