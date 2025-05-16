import 'package:expandable_tile/expandable_tile.dart';
import 'package:expandable_tile/src/utils/animation_utils.dart';
import 'package:expandable_tile/src/utils/click_widget.dart';
import 'package:expandable_tile/src/utils/image_utils.dart';
import 'package:expandable_tile/src/widget/expand_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Expandable Image State control state expand
class ExpandableImageViewState extends State<ExpandableImageView> {
  final ExpandTileController controller = ExpandTileController();

  @override
  void initState() {
    super.initState();
    controller
      ..setTitle(widget.src)
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
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: widget.titleBGColor,
                ),
                child: ClickWidget(
                  color: widget.titleBGColor,
                  onTap: controller.toggleExpand,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: ImageUtils.getImageWidgetByType(
                        ImageUtils.getImageType(controller.title ?? ""),
                        controller.title ?? ""),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 5.0),
            if (widget.posHorizontal)
              Flexible(
                child: sectionWidget(),
              ),
          ],
        ),
        if (!widget.posHorizontal) sectionWidget(),
      ],
    );
  }
}
