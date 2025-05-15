import 'package:expandable_tile/expandable_tile.dart';
import 'package:expandable_tile/src/theme/styles.dart';
import 'package:expandable_tile/src/utils/animation_utils.dart';
import 'package:expandable_tile/src/utils/click_widget.dart';
import 'package:expandable_tile/src/widget/expand_section.dart';
import 'package:flutter/material.dart';

/// Expandable Tile State control state expand
class ExpandableTileViewState extends State<ExpandableTileView> {
  final ExpandTileController controller = ExpandTileController();

  @override
  void initState() {
    super.initState();
    controller
      ..setTitle(widget.title)
      ..setExpanded(widget.child)
      ..setAxisExpand(widget.axis);
    controller.addListener(_onControllerChanged);
  }

  void _onControllerChanged() {
    if (mounted) setState(() {});
  }

  /// Calculate the actual size of the text string.
  Size calculateTextSize(
    String text, {
    required TextStyle style,
    int maxLines = 1,
    double maxWidth = double.infinity,
  }) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: maxLines,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: maxWidth);
    return textPainter.size;
  }

  double getWidth() {
    if (widget.posHorizontal) {
      return (calculateTextSize(controller.title ?? "",
                  style: widget.titleTextStyle ?? AppStyles.titleText)
              .width +
          40);
    }
    if (widget.width != null) return widget.width!;
    return MediaQuery.sizeOf(context).width;
  }

  Widget sectionWidget() {
    return ExpandSection(
      expand: controller.isExpand,
      animationType: widget.animationType,
      axisExpand: controller.axisExpand,
      child: widget.animationType == ExpandableAnimation.none ? Visibility(
        visible: controller.isExpand,
          child: controller.expanded!
      ) : AnimatedSwitcher(
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Container(
                width: getWidth(),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: widget.titleBGColor,
                ),
                child: ClickWidget(
                  color: widget.titleBGColor,
                  onTap: controller.toggleExpand,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              controller.title ?? "",
                              style: widget.titleTextStyle ?? AppStyles.titleText,
                            ),
                          ),
                        ),
                        Visibility(
                            visible: !widget.posHorizontal,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: AnimatedRotation(
                                turns: controller.isExpand ? -0.25 : 0, // 0 = down, -0.25 = right (90 degree)
                                duration: Duration(milliseconds: AnimationUtils.getMilByAnimationType(widget.animationType)),
                                curve: Curves.easeInOut,
                                child: const Icon(Icons.arrow_drop_down, size: 28,),
                              ),
                            )
                        )
                      ],
                    ),
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
        if (!widget.posHorizontal)
          sectionWidget(),
      ],
    );
  }
}
