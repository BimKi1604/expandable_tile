import 'package:expandable_tile/src/data/type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'expandable_tile_state.dart';

/// The main widget usage
class ExpandableTileView extends StatefulWidget {
  final String title;
  final Widget child;
  final AxisExpand axis;
  final double? width;
  final Color? titleBGColor;
  final TextStyle? titleTextStyle;
  final bool posHorizontal;
  final ExpandableAnimation animationType;
  final bool showIcon;

  /// Private constructor
  const ExpandableTileView._(
      {required this.title,
      required this.child,
      this.width,
      this.axis = AxisExpand.vertical,
      this.titleBGColor,
      this.titleTextStyle,
      this.posHorizontal = false,
      this.showIcon = true,
      this.animationType = ExpandableAnimation.def});

  /// Animation Scale
  factory ExpandableTileView.animatedScale({
    required String title,
    required Widget child,
    double? width,
    Color? titleBGColor,
    TextStyle? titleTextStyle,
    bool showIcon = true,
    bool posHorizontal = false,
  }) {
    return ExpandableTileView._(
      title: title,
      animationType: ExpandableAnimation.scale,
      width: width,
      showIcon: showIcon,
      titleBGColor: titleBGColor,
      titleTextStyle: titleTextStyle,
      posHorizontal: posHorizontal,
      child: child,
    );
  }

  /// No animation
  factory ExpandableTileView.noneAnimation({
    required String title,
    required Widget child,
    double? width,
    Color? titleBGColor,
    TextStyle? titleTextStyle,
    bool posHorizontal = false,
    bool showIcon = true,
  }) {
    return ExpandableTileView._(
      title: title,
      animationType: ExpandableAnimation.none,
      width: width,
      showIcon: showIcon,
      titleBGColor: titleBGColor,
      titleTextStyle: titleTextStyle,
      posHorizontal: posHorizontal,
      child: child,
    );
  }

  /// Animation Fade
  factory ExpandableTileView.animatedFade({
    required String title,
    required Widget child,
    double? width,
    Color? titleBGColor,
    TextStyle? titleTextStyle,
    bool posHorizontal = false,
    bool showIcon = true,
  }) {
    return ExpandableTileView._(
      title: title,
      animationType: ExpandableAnimation.fade,
      width: width,
      titleBGColor: titleBGColor,
      titleTextStyle: titleTextStyle,
      posHorizontal: posHorizontal,
      showIcon: showIcon,
      child: child,
    );
  }

  /// Animation Default (Size)
  factory ExpandableTileView.animatedDef({
    required String title,
    required Widget child,
    AxisExpand axis = AxisExpand.vertical,
    double? width,
    Color? titleBGColor,
    TextStyle? titleTextStyle,
    bool posHorizontal = false,
    bool showIcon = true,
  }) {
    return ExpandableTileView._(
      title: title,
      axis: axis,
      animationType: ExpandableAnimation.def,
      width: width,
      titleBGColor: titleBGColor,
      titleTextStyle: titleTextStyle,
      posHorizontal: posHorizontal,
      showIcon: showIcon,
      child: child,
    );
  }

  @override
  State<ExpandableTileView> createState() => ExpandableTileViewState();
}
