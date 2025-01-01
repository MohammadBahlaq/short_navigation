part of '../short_navigation.dart';

abstract class GoRawDialogRoute {
  ///This is simple navigation all you have to do
  ///just pass your [widget] to go
  static Future<T?> to<T extends Object?>(
    Widget page, {
    RouteSettings? settings,
    Duration transitionDuration = const Duration(milliseconds: 200),
    bool barrierDismissible = true,
    Color barrierColor = const Color(0x80000000),
    String? barrierLabel,
    Offset? anchorPoint,
    TraversalEdgeBehavior? traversalEdgeBehavior,
    Widget Function(BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child)?
        transitionBuilder,
  }) async {
    return Go.navigatorKey.currentState?.push<T>(
      RawDialogRoute(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        barrierDismissible: barrierDismissible,
        barrierColor: barrierColor,
        barrierLabel: barrierLabel,
        transitionDuration: transitionDuration,
        transitionBuilder: transitionBuilder,
        settings: settings,
        anchorPoint: anchorPoint,
        traversalEdgeBehavior: traversalEdgeBehavior,
      ),
    );
  }

  ///This is simple navigation all you have to do
  ///just pass your [widget] to go and it will
  ///remove previous route from the tree
  static Future<T?> toReplace<T extends Object?, TO extends Object?>(
    Widget page, {
    RouteSettings? settings,
    Duration transitionDuration = const Duration(milliseconds: 200),
    bool barrierDismissible = true,
    Color barrierColor = const Color(0x80000000),
    String? barrierLabel,
    Offset? anchorPoint,
    TraversalEdgeBehavior? traversalEdgeBehavior,
    Widget Function(BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child)?
        transitionBuilder,
  }) async {
    return Go.navigatorKey.currentState?.pushReplacement<T, TO>(
      RawDialogRoute(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        barrierDismissible: barrierDismissible,
        barrierColor: barrierColor,
        barrierLabel: barrierLabel,
        transitionDuration: transitionDuration,
        transitionBuilder: transitionBuilder,
        settings: settings,
        anchorPoint: anchorPoint,
        traversalEdgeBehavior: traversalEdgeBehavior,
      ),
    );
  }

  ///This is simple navigation all you have to do
  ///just pass your [widget] to go and it will
  ///remove all routes from the tree
  static Future<T?> toRemoveUntil<T extends Object?>(
    Widget page, {
    RouteSettings? settings,
    Duration transitionDuration = const Duration(milliseconds: 200),
    bool barrierDismissible = true,
    Color barrierColor = const Color(0x80000000),
    String? barrierLabel,
    Offset? anchorPoint,
    TraversalEdgeBehavior? traversalEdgeBehavior,
    Widget Function(BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child)?
        transitionBuilder,
    bool Function(Route<dynamic>)? predicate,
  }) async {
    predicate ??= (route) => false;

    return Go.navigatorKey.currentState?.pushAndRemoveUntil<T>(
      RawDialogRoute(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        barrierDismissible: barrierDismissible,
        barrierColor: barrierColor,
        barrierLabel: barrierLabel,
        transitionDuration: transitionDuration,
        transitionBuilder: transitionBuilder,
        settings: settings,
        anchorPoint: anchorPoint,
        traversalEdgeBehavior: traversalEdgeBehavior,
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
