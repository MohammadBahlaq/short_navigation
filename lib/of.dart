part of 'short_navigation.dart';

abstract class GofContext {
  ///If you need any thing from [Theme.of(context)]
  ///you can use it wherevere in your code without need any context.
  static ThemeData get theme => Theme.of(Go.context);

  ///If you need any thing from [ModalRoute.of(context)]
  ///you can use it wherevere in your code without need any context.
  static ModalRoute? get modalRoute => ModalRoute.of(Go.context);

  ///If you need any thing from [MediaQuery.of(context)]
  ///you can use it wherevere in your code without need any context.
  static MediaQueryData get mediaQuery => MediaQuery.of(Go.context);

  ///If you need any thing from [Focus.of(Go.context)]
  ///you can use it wherevere in your code without need any context.
  static FocusNode get focus => Focus.of(Go.context);

  ///If you need any thing from [FocusScope.of(Go.context)]
  ///you can use it wherevere in your code without need any context.
  static FocusNode get focusScope => FocusScope.of(Go.context);

  ///If you need any thing from [DefaultAssetBundle.of(Go.context)]
  ///you can use it wherevere in your code without need any context.
  static AssetBundle get defaultAssetBundle =>
      DefaultAssetBundle.of(Go.context);

  ///If you need any thing from [MaterialLocalizations.of(context)]
  ///you can use it wherevere in your code without need any context.
  static MaterialLocalizations get materialLocalizations =>
      MaterialLocalizations.of(Go.context);

  ///If you need any thing from [Scaffold.of(context)]
  ///you can use it wherevere in your code without need any context.
  static ScaffoldState get scaffold => Scaffold.of(Go.context);

  ///If you need any thing from [ScaffoldMessenger.of(context)]
  ///you can use it wherevere in your code without need any context.
  static ScaffoldMessengerState get scaffoldMessenger =>
      ScaffoldMessenger.of(Go.context);
}
