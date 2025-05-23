part of '../short_navigation.dart';

abstract class GoBottomSheetRoute {
  ///This is simple navigation all you have to do
  ///just pass your [widget] to go
  static Future<T?> to<T extends Object?>(
    Widget page, {
    bool isScrollControlled = true,
    Offset? anchorPoint,
    Color? backgroundColor,
    String? barrierLabel,
    String? barrierOnTapHint,
    CapturedThemes? capturedThemes,
    Clip? clipBehavior,
    BoxConstraints? constraints,
    double? elevation,
    bool enableDrag = true,
    bool isDismissible = true,
    Color? modalBarrierColor,
    double scrollControlDisabledMaxHeightRatio = 9.0 / 16.0,
    RouteSettings? settings,
    ShapeBorder? shape,
    AnimationStyle? sheetAnimationStyle,
    bool? showDragHandle,
    AnimationController? transitionAnimationController,
    bool useSafeArea = false,
  }) async {
    return Go.navigatorKey.currentState?.push<T>(
      ModalBottomSheetRoute(
        builder: (context) => page,
        isScrollControlled: isScrollControlled,
        anchorPoint: anchorPoint,
        backgroundColor: backgroundColor,
        barrierLabel: barrierLabel,
        barrierOnTapHint: barrierOnTapHint,
        capturedThemes: capturedThemes,
        clipBehavior: clipBehavior,
        constraints: constraints,
        elevation: elevation,
        enableDrag: enableDrag,
        isDismissible: isDismissible,
        modalBarrierColor: modalBarrierColor,
        scrollControlDisabledMaxHeightRatio:
            scrollControlDisabledMaxHeightRatio,
        settings: settings,
        shape: shape,
        sheetAnimationStyle: sheetAnimationStyle,
        showDragHandle: showDragHandle,
        transitionAnimationController: transitionAnimationController,
        useSafeArea: useSafeArea,
      ),
    );
  }

  ///This is simple navigation all you have to do
  ///just pass your [widget] to go and it will
  ///remove previous route from the tree
  static Future<T?> toReplace<T extends Object?, TO extends Object?>(
    Widget page, {
    bool isScrollControlled = true,
    Offset? anchorPoint,
    Color? backgroundColor,
    String? barrierLabel,
    String? barrierOnTapHint,
    CapturedThemes? capturedThemes,
    Clip? clipBehavior,
    BoxConstraints? constraints,
    double? elevation,
    bool enableDrag = true,
    bool isDismissible = true,
    Color? modalBarrierColor,
    double scrollControlDisabledMaxHeightRatio = 9.0 / 16.0,
    RouteSettings? settings,
    ShapeBorder? shape,
    AnimationStyle? sheetAnimationStyle,
    bool? showDragHandle,
    AnimationController? transitionAnimationController,
    bool useSafeArea = false,
  }) async {
    return Go.navigatorKey.currentState?.pushReplacement<T, TO>(
      ModalBottomSheetRoute(
        builder: (context) => page,
        isScrollControlled: isScrollControlled,
        anchorPoint: anchorPoint,
        backgroundColor: backgroundColor,
        barrierLabel: barrierLabel,
        barrierOnTapHint: barrierOnTapHint,
        capturedThemes: capturedThemes,
        clipBehavior: clipBehavior,
        constraints: constraints,
        elevation: elevation,
        enableDrag: enableDrag,
        isDismissible: isDismissible,
        modalBarrierColor: modalBarrierColor,
        scrollControlDisabledMaxHeightRatio:
            scrollControlDisabledMaxHeightRatio,
        settings: settings,
        shape: shape,
        sheetAnimationStyle: sheetAnimationStyle,
        showDragHandle: showDragHandle,
        transitionAnimationController: transitionAnimationController,
        useSafeArea: useSafeArea,
      ),
    );
  }

  ///This is simple navigation all you have to do
  ///just pass your [widget] to go and it will
  ///remove all routes from the tree
  static Future<T?> toRemoveUntil<T extends Object?>(
    Widget page, {
    bool isScrollControlled = true,
    Offset? anchorPoint,
    Color? backgroundColor,
    String? barrierLabel,
    String? barrierOnTapHint,
    CapturedThemes? capturedThemes,
    Clip? clipBehavior,
    BoxConstraints? constraints,
    double? elevation,
    bool enableDrag = true,
    bool isDismissible = true,
    Color? modalBarrierColor,
    double scrollControlDisabledMaxHeightRatio = 9.0 / 16.0,
    RouteSettings? settings,
    ShapeBorder? shape,
    AnimationStyle? sheetAnimationStyle,
    bool? showDragHandle,
    AnimationController? transitionAnimationController,
    bool useSafeArea = false,
    bool Function(Route<dynamic> route)? predicate,
  }) async {
    predicate ??= (route) => false;

    return Go.navigatorKey.currentState?.pushAndRemoveUntil<T>(
      ModalBottomSheetRoute(
        builder: (context) => page,
        isScrollControlled: isScrollControlled,
        anchorPoint: anchorPoint,
        backgroundColor: backgroundColor,
        barrierLabel: barrierLabel,
        barrierOnTapHint: barrierOnTapHint,
        capturedThemes: capturedThemes,
        clipBehavior: clipBehavior,
        constraints: constraints,
        elevation: elevation,
        enableDrag: enableDrag,
        isDismissible: isDismissible,
        modalBarrierColor: modalBarrierColor,
        scrollControlDisabledMaxHeightRatio:
            scrollControlDisabledMaxHeightRatio,
        settings: settings,
        shape: shape,
        sheetAnimationStyle: sheetAnimationStyle,
        showDragHandle: showDragHandle,
        transitionAnimationController: transitionAnimationController,
        useSafeArea: useSafeArea,
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
