import 'package:expandable_tile/src/data/type.dart';
import 'package:expandable_tile/src/models/ratio.dart';
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
  final Ratio ratio;

  /// Private constructor
  const ExpandableCustomView._(
      {required this.title,
        this.ratio = const Ratio(5, 5),
        required this.child,
        this.axis = AxisExpand.vertical,
        this.posHorizontal = false,
        this.animationType = ExpandableAnimation.def});

  /// Animation Scale
  factory ExpandableCustomView.animatedScale({
    required Widget title,
    required Widget child,
    final Ratio ratio = const Ratio(5, 5),
    bool posHorizontal = false,
  }) {
    return ExpandableCustomView._(
      title: title,
      ratio: ratio,
      animationType: ExpandableAnimation.scale,
      posHorizontal: posHorizontal,
      child: child,
    );
  }

  /// No animation
  factory ExpandableCustomView.noneAnimation({
    required Widget title,
    required Widget child,
    final Ratio ratio = const Ratio(5, 5),
    bool posHorizontal = false,
  }) {
    return ExpandableCustomView._(
      title: title,
      ratio: ratio,
      animationType: ExpandableAnimation.none,
      posHorizontal: posHorizontal,
      child: child,
    );
  }

  /// Animation Fade
  factory ExpandableCustomView.animatedFade({
    required Widget title,
    required Widget child,
    final Ratio ratio = const Ratio(5, 5),
    bool posHorizontal = false,
  }) {
    return ExpandableCustomView._(
      title: title,
      ratio: ratio,
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
    final Ratio ratio = const Ratio(5, 5),
    bool posHorizontal = false,
  }) {
    return ExpandableCustomView._(
      title: title,
      axis: axis,
      ratio: ratio,
      animationType: ExpandableAnimation.def,
      posHorizontal: posHorizontal,
      child: child,
    );
  }

  @override
  State<ExpandableCustomView> createState() => ExpandableCustomViewState();
}
