import 'package:expandable_tile/src/data/type.dart';
import 'package:expandable_tile/src/widget/expandable_tile/expandable_tile_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Example());
}

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Expanded Tile Example',
      home: ExpandedPage(),
    );
  }
}

class ExpandedPage extends StatefulWidget {
  const ExpandedPage({super.key});

  @override
  State<ExpandedPage> createState() => _ExpandedPageState();
}

class _ExpandedPageState extends State<ExpandedPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget expandableText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text("None animation",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.deepOrange)),
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: ExpandableTileView.noneAnimation(
            title: "No animation",
            child: const Text(
                "This is demo for expand text without animation. The Child is Text"),
          ),
        ),
        const Text("Vertical position",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.deepOrange)),
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: ExpandableTileView.animatedDef(
            title: "Animation default vertical",
            child: const Text(
                "This is demo for expand text vertical. The Child is Text"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: ExpandableTileView.animatedDef(
            axis: AxisExpand.horizontal,
            title: "Animation default horizontal",
            child: const Text(
                "This is demo for expand text horizontal. The Child is Text"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: ExpandableTileView.animatedFade(
            title: "Animation fade",
            child: const Text(
                "This is demo for expand text with animation fading in and out!"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: ExpandableTileView.animatedScale(
            title: "Animation scale",
            child: const Text(
                "This is demo for expand text with scaling animation!"),
          ),
        ),
        const Text("Horizontal position",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.deepOrange)),
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: ExpandableTileView.animatedDef(
            axis: AxisExpand.horizontal,
            posHorizontal: true,
            title: "Animation default horizontal",
            child: const Text(
                "This is demo for expand text horizontal with horizontal position. The Child is Text and Image"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: ExpandableTileView.animatedDef(
            posHorizontal: true,
            title: "Animation default vertical",
            child: const Text(
                "This is demo for expand text vertical with horizontal position. The Child is Text"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: ExpandableTileView.animatedScale(
            posHorizontal: true,
            title: "Animation scale",
            child: const Text(
                "This is demo for expand text with scaling animation!"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: ExpandableTileView.animatedFade(
            posHorizontal: true,
            title: "Animation fade",
            child: const Text(
                "This is demo for expand text with animation fading in and out!"),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Demo Expandable Tile")),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ExpandableTileView.animatedDef(
                  title: "Demo expandable text",
                  child: expandableText()
              ),
            ],
          ),
        ),
      ),
    );
  }
}
