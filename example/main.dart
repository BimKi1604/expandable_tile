import 'package:expandable_tile/src/data/type.dart';
import 'package:expandable_tile/src/widget/expandable_image/expandable_image_view.dart';
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

  Widget expandImage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("None animation",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.deepOrange)),
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: ExpandableImageView.noneAnimation(
            src: "https://www.centrale-canine.fr/sites/default/files/2024-11/Fiche%20de%20race%20banni%C3%A8re%20corgi%20pembroke.jpg",
            child: const Text(
                "This is demo for expand image without animation. The Child is Text"),
          ),
        ),
        const Text("Vertical position",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.deepOrange)),
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: ExpandableImageView.animatedDef(
            src: "https://www.centrale-canine.fr/sites/default/files/2024-11/Fiche%20de%20race%20banni%C3%A8re%20corgi%20pembroke.jpg",
            child: const Text(
                "This is demo for expand image with default animation. The Child is Text"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: ExpandableImageView.animatedFade(
            src: "https://file.hstatic.net/1000292100/article/61312315_440746569804333_4727353524977926144_n_9a585e47ace64345af4b2dd9bc1f45bb.jpg",
            child: const Text(
                "This is demo for expand image with fade animation. The Child is Text"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: ExpandableImageView.animatedScale(
            src: "https://file.hstatic.net/1000292100/file/img_1907_grande_e05accd5a03247069db4f3169cfb8b11_grande.jpg",
            child: const Text(
                "This is demo for expand image with scale animation. The Child is Text"),
          ),
        ),
        const Text("Horizontal position",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.deepOrange)),
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: ExpandableImageView.animatedFade(
            posHorizontal: true,
            src: "https://file.hstatic.net/1000292100/article/61312315_440746569804333_4727353524977926144_n_9a585e47ace64345af4b2dd9bc1f45bb.jpg",
            child: const Text(
                "This is demo for expand image with fade animation. The Child is Text"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: ExpandableImageView.animatedScale(
            posHorizontal: true,
            src: "https://file.hstatic.net/1000292100/file/img_1907_grande_e05accd5a03247069db4f3169cfb8b11_grande.jpg",
            child: const Text(
                "This is demo for expand image with scale animation. The Child is Text"),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ExpandableTileView.animatedDef(
                  title: "Demo expandable text",
                  child: expandableText()
              ),
              ExpandableTileView.animatedDef(
                  title: "Demo expandable image",
                  child: expandImage()
              )
            ],
          ),
        ),
      ),
    );
  }
}
