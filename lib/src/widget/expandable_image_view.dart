import 'package:flutter/material.dart';

class ExpandableImageView extends StatefulWidget {
  const ExpandableImageView({super.key});

  @override
  State<ExpandableImageView> createState() => _ExpandableImageViewState();
}

class _ExpandableImageViewState extends State<ExpandableImageView> {
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
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      controller.title ?? "",
                      style: widget.titleTextStyle ?? AppStyles.titleText,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            if (widget.posHorizontal)
              Flexible(
                child: ExpandSection(
                  expand: controller.isExpand,
                  axisExpand: controller.axisExpand,
                  child: Visibility(
                      visible: controller.isExpand,
                      child: controller.expanded!),
                ),
              ),
          ],
        ),
        if (!widget.posHorizontal)
          ExpandSection(
            expand: controller.isExpand,
            axisExpand: controller.axisExpand,
            child: Visibility(
                visible: controller.isExpand,
                child: controller.expanded!),
          ),
      ],
    );
  }
}
