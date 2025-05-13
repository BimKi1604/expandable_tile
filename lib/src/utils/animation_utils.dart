import 'package:expandable_tile/src/data/type.dart';

/// The class helper for animation
class AnimationUtils {
  /// get time (milliseconds) by animation type
  static int getMilByAnimationType(ExpandableAnimation animation) {
    switch (animation) {
      case ExpandableAnimation.scale:
        return 400;
      case ExpandableAnimation.fade:
        return 700;
      default:
        return 300;
    }
  }
}
