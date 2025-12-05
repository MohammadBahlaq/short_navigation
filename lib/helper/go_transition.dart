part of 'package:short_navigation/short_navigation.dart';

class GoTransitions {
  final Widget Function(Animation<double>, Widget) builder;

  const GoTransitions._(this.builder);

  factory GoTransitions.fade({Curve curve = Curves.linear}) {
    return GoTransitions._((animation, child) {
      Tween<double> tween = Tween(
        begin: 0,
        end: 1,
      );

      CurvedAnimation curved = CurvedAnimation(
        parent: animation,
        curve: curve,
      );

      return FadeTransition(opacity: tween.animate(curved), child: child);
    });
  }

  factory GoTransitions.slide({
    AxisDirection slideDirection = AxisDirection.left,
    Curve curve = Curves.easeOut,
  }) {
    late Tween<Offset> tween;

    switch (slideDirection) {
      case AxisDirection.left:
        tween = Tween<Offset>(
          begin: const Offset(-1, 0),
          end: const Offset(0, 0),
        );
        break;
      case AxisDirection.right:
        tween = Tween<Offset>(
          begin: const Offset(1, 0),
          end: const Offset(0, 0),
        );
        break;
      case AxisDirection.up:
        tween = Tween<Offset>(
          begin: const Offset(0, -1),
          end: const Offset(0, 0),
        );
        break;
      case AxisDirection.down:
        tween = Tween<Offset>(
          begin: const Offset(0, 1),
          end: const Offset(0, 0),
        );
        break;
    }

    return GoTransitions._((animation, child) {
      CurvedAnimation curved = CurvedAnimation(
        parent: animation,
        curve: curve,
      );

      return SlideTransition(
        position: tween.animate(curved),
        child: child,
      );
    });
  }

  factory GoTransitions.scale(
      {Curve curve = Curves.easeInOut,
      Alignment alignment = Alignment.center}) {
    return GoTransitions._((animation, child) {
      Tween<double> tween = Tween(
        begin: 0,
        end: 1,
      );

      CurvedAnimation curved = CurvedAnimation(
        parent: animation,
        curve: curve,
      );

      return ScaleTransition(
        scale: tween.animate(curved),
        alignment: alignment,
        child: child,
      );
    });
  }

  factory GoTransitions.rotation(
      {Curve curve = Curves.easeInOut,
      double numberOfTurns = 1,
      Alignment alignment = Alignment.center}) {
    return GoTransitions._((animation, child) {
      Tween<double> tween = Tween(
        begin: 0,
        end: numberOfTurns,
      );

      CurvedAnimation curved = CurvedAnimation(
        parent: animation,
        curve: curve,
      );

      return RotationTransition(
          turns: tween.animate(curved), alignment: alignment, child: child);
    });
  }

  factory GoTransitions.size({
    Curve curve = Curves.easeInOut,
    Axis sizeAxis = Axis.vertical,
    SizeDirection sizeDirection = SizeDirection.center,
  }) {
    return GoTransitions._((animation, child) {
      CurvedAnimation curved = CurvedAnimation(
        parent: animation,
        curve: curve,
      );

      Tween<double> tween = Tween(
        begin: 0,
        end: 1,
      );

      late Alignment alignment;

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
          sizeFactor: tween.animate(curved),
          axis: sizeAxis,
          child: child,
        ),
      );
    });
  }
}
