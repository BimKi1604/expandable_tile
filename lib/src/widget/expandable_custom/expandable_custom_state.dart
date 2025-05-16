import 'package:expandable_tile/src/controller/expand_controller.dart';
import 'package:expandable_tile/src/data/type.dart';
import 'package:expandable_tile/src/utils/animation_utils.dart';
import 'package:expandable_tile/src/utils/click_widget.dart';
import 'package:expandable_tile/src/widget/expand_section.dart';
import 'package:expandable_tile/src/widget/expandable_custom/expandable_custom_view.dart';
import 'package:flutter/material.dart';

/// Expandable Custom widget State control state expand
class ExpandableCustomViewState extends State<ExpandableCustomView> {
  final ExpandTileController controller = ExpandTileController();

  @override
  void initState() {
    super.initState();
    controller
      ..setExpanded(widget.child)
      ..setAxisExpand(widget.axis);
    controller.addListener(_onControllerChanged);
  }

  void _onControllerChanged() {
    if (mounted) setState(() {});
  }

  Widget sectionWidget() {
    return ExpandSection(
      expand: controller.isExpand,
      animationType: widget.animationType,
      axisExpand: controller.axisExpand,
      child: widget.animationType == ExpandableAnimation.none
          ? Visibility(
              visible: controller.isExpand, child: controller.expanded!)
          : AnimatedSwitcher(
              duration: Duration(
                  milliseconds: AnimationUtils.getMilByAnimationType(
                      widget.animationType)),
              child: controller.isExpand
                  ? KeyedSubtree(
                      key: const ValueKey('expanded'),
                      child: controller.expanded!,
                    )
                  : const KeyedSubtree(
                      key: ValueKey('collapsed'),
                      child: SizedBox.shrink(),
                    )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: widget.ratio.left,
              child: ClickWidget(
                  color: Colors.white.withOpacity(0.3),
                  onTap: controller.toggleExpand,
                  child: widget.title),
            ),
            const SizedBox(width: 5.0),
            if (widget.posHorizontal)
              Flexible(
                flex: widget.ratio.right,
                child: sectionWidget(),
              ),
          ],
        ),
        if (!widget.posHorizontal) sectionWidget(),
      ],
    );
  }
}
