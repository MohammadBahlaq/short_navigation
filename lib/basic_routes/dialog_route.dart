part of '../short_navigation.dart';

abstract class GoDialogRoute {
  ///This is simple navigation all you have to do
  ///just pass your [widget] to go
  static Future<T?> to<T extends Object?>(
    Widget page, {
    CapturedThemes? themes,
    Color barrierColor = Colors.black54,
    bool barrierDismissible = true,
    String? barrierLabel,
    bool useSafeArea = true,
    RouteSettings? settings,
    Offset? anchorPoint,
    TraversalEdgeBehavior? traversalEdgeBehavior,
  }) async {
    return Go.navigatorKey.currentState?.push<T>(
      DialogRoute(
        context: Go.context,
        builder: (context) => page,
        themes: themes,
        barrierColor: barrierColor,
        barrierDismissible: barrierDismissible,
        barrierLabel: barrierLabel,
        useSafeArea: useSafeArea,
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
    CapturedThemes? themes,
    Color barrierColor = Colors.black54,
    bool barrierDismissible = true,
    String? barrierLabel,
    bool useSafeArea = true,
    RouteSettings? settings,
    Offset? anchorPoint,
    TraversalEdgeBehavior? traversalEdgeBehavior,
  }) async {
    return Go.navigatorKey.currentState?.pushReplacement<T, TO>(
      DialogRoute(
        context: Go.context,
        builder: (context) => page,
        themes: themes,
        barrierColor: barrierColor,
        barrierDismissible: barrierDismissible,
        barrierLabel: barrierLabel,
        useSafeArea: useSafeArea,
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
    CapturedThemes? themes,
    Color barrierColor = Colors.black54,
    bool barrierDismissible = true,
    String? barrierLabel,
    bool useSafeArea = true,
    RouteSettings? settings,
    Offset? anchorPoint,
    TraversalEdgeBehavior? traversalEdgeBehavior,
    bool Function(Route<dynamic>)? predicate,
  }) async {
    predicate ??= (route) => false;

    return Go.navigatorKey.currentState?.pushAndRemoveUntil<T>(
      DialogRoute(
        context: Go.context,
        builder: (context) => page,
        themes: themes,
        barrierColor: barrierColor,
        barrierDismissible: barrierDismissible,
        barrierLabel: barrierLabel,
        useSafeArea: useSafeArea,
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
