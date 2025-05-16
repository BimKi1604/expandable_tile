import 'package:expandable_tile/src/data/type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'expandable_custom_state.dart';

/// The custom widget usage
class ExpandableCustomView extends StatefulWidget {
  final Widget title;
  final Widget child;
  final AxisExpand axis;
  final bool posHorizontal;
  final ExpandableAnimation animationType;

  /// Private constructor
  const ExpandableCustomView._(
      {required this.title,
        required this.child,
        this.axis = AxisExpand.vertical,
        this.posHorizontal = false,
        this.animationType = ExpandableAnimation.def});

  /// Animation Scale
  factory ExpandableCustomView.animatedScale({
    required Widget title,
    required Widget child,
    bool posHorizontal = false,
  }) {
    return ExpandableCustomView._(
      title: title,
      animationType: ExpandableAnimation.scale,
      posHorizontal: posHorizontal,
      child: child,
    );
  }

  /// No animation
  factory ExpandableCustomView.noneAnimation({
    required Widget title,
    required Widget child,
    bool posHorizontal = false,
  }) {
    return ExpandableCustomView._(
      title: title,
      animationType: ExpandableAnimation.none,
      posHorizontal: posHorizontal,
      child: child,
    );
  }

  /// Animation Fade
  factory ExpandableCustomView.animatedFade({
    required Widget title,
    required Widget child,
    bool posHorizontal = false,
  }) {
    return ExpandableCustomView._(
      title: title,
      animationType: ExpandableAnimation.fade,
      posHorizontal: posHorizontal,
      child: child,
    );
  }

  /// Animation Default (Size)
  factory ExpandableCustomView.animatedDef({
    required Widget title,
    required Widget child,
    AxisExpand axis = AxisExpand.vertical,
    bool posHorizontal = false,
  }) {
    return ExpandableCustomView._(
      title: title,
      axis: axis,
      animationType: ExpandableAnimation.def,
      posHorizontal: posHorizontal,
      child: child,
    );
  }

  @override
  State<ExpandableCustomView> createState() => ExpandableCustomViewState();
}
