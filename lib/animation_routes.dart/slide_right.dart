part of 'package:short_navigation/short_navigation.dart';

class GoSlide {
  ///This is simple navigation all you have to do
  ///just pass your [widget] to go
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
    Curve curve = Curves.linear,
    AxisDirection slideDirection = AxisDirection.left,
  }) async {
    return Go.navigatorKey.currentState?.push<T>(
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
            _slideTransitionBuilder(
          slideDirection,
          animation,
          curve,
          child,
        ),
      ),
    );
  }

  ///This is simple navigation all you have to do
  ///just pass your [widget] to go and it will
  ///remove previous route from the tree
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
    Curve curve = Curves.linear,
    AxisDirection slideDirection = AxisDirection.left,
  }) async {
    return Go.navigatorKey.currentState?.pushReplacement<T, TO>(
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
            _slideTransitionBuilder(
          slideDirection,
          animation,
          curve,
          child,
        ),
      ),
    );
  }

  ///This is simple navigation all you have to do
  ///just pass your [widget] to go and it will
  ///remove all routes from the tree
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
    Curve curve = Curves.linear,
    AxisDirection slideDirection = AxisDirection.left,
    bool Function(Route<dynamic> route)? predicate,
  }) async {
    predicate ??= (route) => false;

    return Go.navigatorKey.currentState?.pushAndRemoveUntil<T>(
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
            _slideTransitionBuilder(
          slideDirection,
          animation,
          curve,
          child,
        ),
      ),
      predicate,
    );
  }

  ///If you want to pop sothing before
  ///pushing to another widget you could use it,
  ///just pass your [widget] to go
  static Future<void> backAndTo(Widget page) async {
    Go.back();
    to(page);
  }
}

Widget _slideTransitionBuilder(
  AxisDirection slideDirection,
  Animation<double> animation,
  Curve curve,
  Widget child,
) {
  Tween<Offset> tween = _getTween(slideDirection);

  CurvedAnimation curvedAnimation = CurvedAnimation(
    parent: animation,
    curve: curve,
  );

  return SlideTransition(
    position: tween.animate(curvedAnimation),
    child: child,
  );
}

Tween<Offset> _getTween(AxisDirection axisDirection) {
  switch (axisDirection) {
    case AxisDirection.left:
      return Tween<Offset>(
        begin: const Offset(-1, 0),
        end: const Offset(0, 0),
      );
    case AxisDirection.right:
      return Tween<Offset>(
        begin: const Offset(1, 0),
        end: const Offset(0, 0),
      );
    case AxisDirection.up:
      return Tween<Offset>(
        begin: const Offset(0, -1),
        end: const Offset(0, 0),
      );
    case AxisDirection.down:
      return Tween<Offset>(
        begin: const Offset(0, 1),
        end: const Offset(0, 0),
      );
  }
}
