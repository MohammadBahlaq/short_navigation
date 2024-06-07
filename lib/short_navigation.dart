import 'package:flutter/material.dart';

class Go {
  static final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  ///This is navigatorKey you have to pass it in the MaterialApp in the main.dart
  static GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  ///If you need context in any file in your code you can use it
  static BuildContext get context => _navigatorKey.currentContext!;

  ///This is simple navigation all you have to do
  ///just pass your [widget] to go
  static Future<void> to(Widget page) async {
    navigatorKey.currentState?.push(MaterialPageRoute(builder: (context) => page));
  }

  ///This is simple navigation all you have to do
  ///just pass your [widget] to go and it will
  ///remove previous route from the tree
  static Future<void> toReplace(Widget page) async {
    navigatorKey.currentState?.pushReplacement(MaterialPageRoute(builder: (context) => page));
  }

  ///This is simple navigation all you have to do
  ///just pass your [widget] to go and it will
  ///remove all routes from the tree
  static Future<void> toRemoveAll(Widget page) async {
    navigatorKey.currentState?.pushAndRemoveUntil(MaterialPageRoute(builder: (context) => page), (route) => false);
  }

  ///If you want to pop sothing before
  ///pushing to another widget you could use it,
  ///just pass your [widget] to go
  static Future<void> backAndto(Widget page) async {
    back();
    to(page);
  }

  ///This is simple navigation all you have to do
  ///just passing your route [name] to go
  static Future<void> toName(String page) async {
    navigatorKey.currentState?.pushNamed(page);
  }

  ///This is simple navigation all you have to do
  ///just pass your route [name] to go and it will
  ///remove previous route from the tree
  static Future<void> toReplaceName(String page) async {
    navigatorKey.currentState?.pushReplacementNamed(page);
  }

  ///This is simple navigation all you have to do
  ///just pass your route [name] to go and it will
  ///remove all routes from the tree
  static Future<void> toNameRemoveAll(String page) async {
    navigatorKey.currentState?.pushNamedAndRemoveUntil(page, (route) => false);
  }

  ///If you want to pop sothing before
  ///pushing to another widget you could use it,
  ///just pass your route [name] to go
  static Future<void> backAndtoName(String page) async {
    navigatorKey.currentState?.popAndPushNamed(page);
  }

  ///If you need to back to previous page you can use this function,
  ///however if you need to pop many routes you simply
  ///you have to pass how many time you want to pop
  ///using [numOfBacks].
  ///There is no need to pass [numOfBacks] if you just want to pop one time.
  static void back([int? numOfBacks]) async {
    if (numOfBacks == null) {
      navigatorKey.currentState?.pop();
    } else {
      for (var i = 0; i < numOfBacks; i++) {
        navigatorKey.currentState?.pop();
      }
    }
  }

  ///If you wnat to [showDialog] without using context
  ///you have to use this function and the package will pass the context automaticlly.
  ///You can use all [showDialog] proparties as usuall.
  static Future<void> dialog({
    required Widget content,
    bool barrierDismissible = true,
    Color? barrierColor,
    String? barrierLabel,
    bool useSafeArea = true,
    bool useRootNavigator = true,
    RouteSettings? routeSettings,
    Offset? anchorPoint,
    TraversalEdgeBehavior? traversalEdgeBehavior,
  }) async {
    showDialog(
      context: context,
      builder: (context) => content,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      barrierLabel: barrierLabel,
      useSafeArea: useSafeArea,
      useRootNavigator: useRootNavigator,
      routeSettings: routeSettings,
      anchorPoint: anchorPoint,
      traversalEdgeBehavior: traversalEdgeBehavior,
    );
  }

  ///If you wnat to [showModalBottomSheet] without using context
  ///you have to use this function and the package will pass the context automaticlly.
  ///You can use all [showModalBottomSheet] proparties as usuall.
  static Future<void> bottomSheet({
    required Widget content,
    Color? backgroundColor,
    String? barrierLabel,
    double? elevation,
    ShapeBorder? shape,
    Clip? clipBehavior,
    BoxConstraints? constraints,
    Color? barrierColor,
    bool isScrollControlled = false,
    double scrollControlDisabledMaxHeightRatio = 9.0 / 16.0,
    bool useRootNavigator = false,
    bool isDismissible = true,
    bool enableDrag = true,
    bool? showDragHandle,
    bool useSafeArea = false,
    RouteSettings? routeSettings,
    AnimationController? transitionAnimationController,
    Offset? anchorPoint,
    AnimationStyle? sheetAnimationStyle,
  }) async {
    showModalBottomSheet(
      context: context,
      builder: (context) => content,
      backgroundColor: backgroundColor,
      barrierLabel: barrierLabel,
      elevation: elevation,
      shape: shape,
      clipBehavior: clipBehavior,
      constraints: constraints,
      barrierColor: barrierColor,
      isScrollControlled: isScrollControlled,
      scrollControlDisabledMaxHeightRatio: scrollControlDisabledMaxHeightRatio,
      useRootNavigator: useRootNavigator,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      showDragHandle: showDragHandle,
      useSafeArea: useSafeArea,
      routeSettings: routeSettings,
      transitionAnimationController: transitionAnimationController,
      anchorPoint: anchorPoint,
      sheetAnimationStyle: sheetAnimationStyle,
    );
    return;
  }

  ///If you wnat to [showSnackBar] without using context
  ///you have to use this function and the package will pass the context automaticlly.
  ///You can use all [showSnackBar] proparties as usuall.
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snackBar(
    SnackBar snackBar, {
    AnimationStyle? snackBarAnimationStyle,
  }) {
    return ScaffoldMessenger.of(context).showSnackBar(
      snackBar,
      snackBarAnimationStyle: snackBarAnimationStyle,
    );
  }

  ///If you wnat to [showMaterialBanner] without using context
  ///you have to use this function and the package will pass the context automaticlly.
  ///You can use all [showMaterialBanner] proparties as usuall.
  static ScaffoldFeatureController<MaterialBanner, MaterialBannerClosedReason> materialBanner(MaterialBanner materialBanner) {
    return ScaffoldMessenger.of(context).showMaterialBanner(materialBanner);
  }

  ///If you need any thing from [ScaffoldMessenger.of(context)]
  ///you can use it wherevere in your code without need any context.
  static ScaffoldMessengerState get scaffoldMassenger => ScaffoldMessenger.of(context);
}
