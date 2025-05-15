import 'package:expandable_tile/src/data/type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'expandable_image_state.dart';

/// The main widget Image usage
class ExpandableImageView extends StatefulWidget {
  final String src;
  final Widget child;
  final AxisExpand axis;
  final double? size;
  final Color? titleBGColor;
  final TextStyle? titleTextStyle;
  final bool posHorizontal;
  final ExpandableAnimation animationType;

  /// Private constructor
  const ExpandableImageView._(
      {required this.src,
        required this.child,
        this.size,
        this.axis = AxisExpand.vertical,
        this.titleBGColor,
        this.titleTextStyle,
        this.posHorizontal = false,
        this.animationType = ExpandableAnimation.def});

  /// Animation Scale
  factory ExpandableImageView.animatedScale({
    required String src,
    required Widget child,
    double? size,
    Color? titleBGColor,
    TextStyle? titleTextStyle,
    bool posHorizontal = false,
  }) {
    return ExpandableImageView._(
      src: src,
      animationType: ExpandableAnimation.scale,
      size: size,
      titleBGColor: titleBGColor,
      titleTextStyle: titleTextStyle,
      posHorizontal: posHorizontal,
      child: child,
    );
  }

  /// No animation
  factory ExpandableImageView.noneAnimation({
    required String src,
    required Widget child,
    double? size,
    Color? titleBGColor,
    TextStyle? titleTextStyle,
    bool posHorizontal = false,
  }) {
    return ExpandableImageView._(
      src: src,
      animationType: ExpandableAnimation.none,
      size: size,
      titleBGColor: titleBGColor,
      titleTextStyle: titleTextStyle,
      posHorizontal: posHorizontal,
      child: child,
    );
  }

  /// Animation Fade
  factory ExpandableImageView.animatedFade({
    required String src,
    required Widget child,
    double? size,
    Color? titleBGColor,
    TextStyle? titleTextStyle,
    bool posHorizontal = false,
  }) {
    return ExpandableImageView._(
      src: src,
      animationType: ExpandableAnimation.fade,
      size: size,
      titleBGColor: titleBGColor,
      titleTextStyle: titleTextStyle,
      posHorizontal: posHorizontal,
      child: child,
    );
  }

  /// Animation Default (Size)
  factory ExpandableImageView.animatedDef({
    required String src,
    required Widget child,
    AxisExpand axis = AxisExpand.vertical,
    double? size,
    Color? titleBGColor,
    TextStyle? titleTextStyle,
    bool posHorizontal = false,
  }) {
    return ExpandableImageView._(
      src: src,
      axis: axis,
      animationType: ExpandableAnimation.def,
      size: size,
      titleBGColor: titleBGColor,
      titleTextStyle: titleTextStyle,
      posHorizontal: posHorizontal,
      child: child,
    );
  }

  @override
  State<ExpandableImageView> createState() => ExpandableImageViewState();
}
