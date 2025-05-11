import 'package:expandable_tile/src/controller/expand_controller.dart';
import 'package:expandable_tile/src/data/type.dart';
import 'package:expandable_tile/src/theme/styles.dart';
import 'package:expandable_tile/src/utils/click_widget.dart';
import 'package:expandable_tile/src/widget/expand_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ExpandableTitleView extends StatefulWidget {

  final String title;
  final Widget child;
  final AxisExpand axis;
  final double? width;
  final Color? titleBGColor;
  final TextStyle? titleTextStyle;
  final bool widthFill;
  final bool posHorizontal;

  const ExpandableTitleView({
    super.key,
    required this.title,
    required this.child,
    this.width,
    this.axis = AxisExpand.vertical,
    this.titleBGColor,
    this.titleTextStyle,
    this.widthFill = true,
    this.posHorizontal = false
  });

  @override
  State<ExpandableTitleView> createState() => _ExpandableTitleViewState();
}

class _ExpandableTitleViewState extends State<ExpandableTitleView> {
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

  void onToggleExpand() {
    controller.toggleExpand();
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
    if (widget.posHorizontal) return (calculateTextSize(controller.title ?? "", style: widget.titleTextStyle ?? AppStyles.titleText).width + 40);
    if (widget.width != null) return widget.width!;
    if (widget.widthFill) return (calculateTextSize(controller.title ?? "", style: widget.titleTextStyle ?? AppStyles.titleText).width + 40);
    return MediaQuery.sizeOf(context).width;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: ClickWidget(
                onTap: controller.toggleExpand,
                child: Container(
                  width: getWidth(),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: widget.titleBGColor,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text(
                    controller.title ?? "",
                    style: widget.titleTextStyle ?? AppStyles.titleText,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            if (widget.posHorizontal)
              Flexible(
                child: ExpandSection(
                  expand: controller.isExpand,
                  axisExpand: controller.axisExpand,
                  child: controller.expanded!,
                ),
              ),
          ],
        ),
        if (!widget.posHorizontal)
          ExpandSection(
            expand: controller.isExpand,
            axisExpand: controller.axisExpand,
            child: controller.expanded!,
          ),
      ],
    );
  }
}