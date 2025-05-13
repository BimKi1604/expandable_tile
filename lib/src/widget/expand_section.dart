import 'package:expandable_tile/src/data/data_func.dart';
import 'package:expandable_tile/src/data/type.dart';
import 'package:expandable_tile/src/utils/animation_utils.dart';
import 'package:flutter/material.dart';

/// The main show animation expandable tile
class ExpandSection extends StatefulWidget {
  final Widget child;
  final bool expand;
  final AxisExpand axisExpand;
  final ExpandableAnimation animationType;

  const ExpandSection({
    super.key,
    this.expand = false,
    required this.child,
    this.axisExpand = AxisExpand.vertical,
    this.animationType = ExpandableAnimation.def,

    /// default
  });

  @override
  State<ExpandSection> createState() => _ExpandSectionState();
}

class _ExpandSectionState extends State<ExpandSection>
    with SingleTickerProviderStateMixin {
  late AnimationController expandController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    prepareAnimations();

    Future.microtask(() {
      if (mounted) _runExpandCheck();
    });
  }

  void prepareAnimations() {
    expandController = AnimationController(
      vsync: this,
      duration: Duration(
          milliseconds:
              AnimationUtils.getMilByAnimationType(widget.animationType)),
    );
    animation = CurvedAnimation(
      parent: expandController,
      curve: Curves.fastOutSlowIn,
    );
    // Set the initial state to avoid splash delay or UI jump.
    if (widget.expand) {
      expandController.value = 1.0;
      return;
    }
    expandController.value = 0.0;
  }

  void _runExpandCheck() {
    if (widget.expand) {
      expandController.forward();
      return;
    }
    expandController.reverse();
  }

  @override
  void didUpdateWidget(ExpandSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    _runExpandCheck();
  }

  @override
  void dispose() {
    expandController.dispose();
    super.dispose();
  }

  Map<ExpandableAnimation, AnimationBuilder> getAnimationBuilders(
      AxisExpand axisExpand) {
    final axis =
        axisExpand == AxisExpand.horizontal ? Axis.horizontal : Axis.vertical;

    return {
      ExpandableAnimation.def: (child, animation) => ClipRect(
            child: SizeTransition(
              axis: axis,
              axisAlignment: 1.0,
              sizeFactor: animation,
              child: child,
            ),
          ),
      ExpandableAnimation.fade: (child, animation) =>
          FadeTransition(opacity: animation, child: child),
      ExpandableAnimation.scale: (child, animation) =>
          ScaleTransition(scale: animation, child: child),
    };
  }

  @override
  Widget build(BuildContext context) {
    final builders = getAnimationBuilders(widget.axisExpand);
    final builder = builders[widget.animationType] ?? (_, __) => widget.child;
    return builder(widget.child, animation);
  }
}
