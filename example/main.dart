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
      appBar: AppBar(title: const Text("Expanded Tile Demo")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const ExpandableTitleView(
            title: "Demo expand text",
            child: Text("This is demo for expand text vertical. The Child is Text"),
          ),
          ExpandableTitleView(
            axis: AxisExpand.horizontal,
            title: "Axis horizontal",
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  const Text("This is demo for expand text with axis horizontal. The Child is Text and Image"),
                  Image.network("https://www.shutterstock.com/image-photo/demo-text-message-magnifying-glass-600nw-2491336635.jpg", height: 60, width: 100,)
                ],
              ),
            ),
          ),
          ExpandableTitleView(
            title: "Axis vertical",
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  const Text("This is demo for expand text with axis vertical. The Child is Text and Image"),
                  Image.network("https://www.shutterstock.com/image-photo/demo-text-message-magnifying-glass-600nw-2491336635.jpg", height: 60, width: 100,)
                ],
              ),
            ),
          ),
          ExpandableTitleView(
            axis: AxisExpand.horizontal,
            posHorizontal: true,
            title: "Horizontal position | horizontal",
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  const Text("This is demo for expand text horizontal with horizontal position. The Child is Text and Image"),
                  Image.network("https://www.shutterstock.com/image-photo/demo-text-message-magnifying-glass-600nw-2491336635.jpg", height: 60, width: 100,)
                ],
              ),
            ),
          ),
          ExpandableTitleView(
            posHorizontal: true,
            title: "Horizontal position| vertical",
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  const Text("This is demo for expand text vertical. The Child is Text and Image"),
                  Image.network("https://www.shutterstock.com/image-photo/demo-text-message-magnifying-glass-600nw-2491336635.jpg", height: 60, width: 100,)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}