import 'package:expandable_tile/src/data/type.dart';
import 'package:flutter/material.dart';

class ExpandSection extends StatefulWidget {
  final Widget child;
  final bool expand;
  final AxisExpand axisExpand;

  const ExpandSection({
    super.key,
    this.expand = false,
    required this.child,
    this.axisExpand = AxisExpand.vertical,
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
      duration: const Duration(milliseconds: 300),
    );
    animation = CurvedAnimation(
      parent: expandController,
      curve: Curves.fastOutSlowIn,
    );
    // Set the initial state to avoid splash delay or UI jump.
    if (widget.expand) {
      expandController.value = 1.0;
    } else {
      expandController.value = 0.0;
    }
  }

  void _runExpandCheck() {
    if (widget.expand) {
      expandController.forward();
    } else {
      expandController.reverse();
    }
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

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: SizeTransition(
        axis: widget.axisExpand == AxisExpand.horizontal ? Axis.horizontal : Axis.vertical,
        axisAlignment: 1.0,
        sizeFactor: animation,
        child: widget.child,
      ),
    );
  }
}
