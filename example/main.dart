import 'package:expandable_tile/src/data/type.dart';
import 'package:expandable_tile/src/widget/expandable_tile_view.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Demo Expandable Tile")),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
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
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        const Text(
                            "This is demo for expand text with animation fading in and out!"),
                        Image.network(
                          "https://www.shutterstock.com/image-photo/demo-text-message-magnifying-glass-600nw-2491336635.jpg",
                          height: 60,
                          width: 100,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: ExpandableTileView.animatedScale(
                  title: "Animation scale",
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        const Text(
                            "This is demo for expand text with scaling animation!"),
                        Image.network(
                          "https://www.shutterstock.com/image-photo/demo-text-message-magnifying-glass-600nw-2491336635.jpg",
                          height: 60,
                          width: 100,
                        )
                      ],
                    ),
                  ),
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
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        const Text(
                            "This is demo for expand text horizontal with horizontal position. The Child is Text and Image"),
                        Image.network(
                          "https://www.shutterstock.com/image-photo/demo-text-message-magnifying-glass-600nw-2491336635.jpg",
                          height: 60,
                          width: 100,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: ExpandableTileView.animatedDef(
                  posHorizontal: true,
                  title: "Animation default vertical",
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        const Text(
                            "This is demo for expand text vertical with horizontal position. The Child is Text and Image"),
                        Image.network(
                          "https://www.shutterstock.com/image-photo/demo-text-message-magnifying-glass-600nw-2491336635.jpg",
                          height: 60,
                          width: 100,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: ExpandableTileView.animatedScale(
                  posHorizontal: true,
                  title: "Animation scale",
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        const Text(
                            "This is demo for expand text with scaling animation!"),
                        Image.network(
                          "https://www.shutterstock.com/image-photo/demo-text-message-magnifying-glass-600nw-2491336635.jpg",
                          height: 60,
                          width: 100,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: ExpandableTileView.animatedFade(
                  posHorizontal: true,
                  title: "Animation fade",
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        const Text(
                            "This is demo for expand text with animation fading in and out!"),
                        Image.network(
                          "https://www.shutterstock.com/image-photo/demo-text-message-magnifying-glass-600nw-2491336635.jpg",
                          height: 60,
                          width: 100,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
