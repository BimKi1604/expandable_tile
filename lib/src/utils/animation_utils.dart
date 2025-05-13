import 'package:expandable_tile/src/data/type.dart';

class AnimationUtils {
  static int getMilByAnimationType(ExpandableAnimation animation) {
    switch (animation) {
      case ExpandableAnimation.scale:
        return 400;
      case ExpandableAnimation.fade:
        return 700;
      default: return 300;
    }
  }
}