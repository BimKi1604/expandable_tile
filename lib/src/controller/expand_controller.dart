import 'package:expandable_tile/src/data/type.dart';
import 'package:flutter/material.dart';

/// A controller that manages the expansion state and content of an expandable tile.
class ExpandTileController extends ChangeNotifier {
  String? _title;
  Widget? _expanded;
  bool _isExpand = false;
  AxisExpand _axis = AxisExpand.vertical;

  /// The title will show and can be toggle
  String? get title => _title;
  void setTitle(String title) {
    _title = title;
    notifyListeners();
  }

  /// The children which can be expanded.
  Widget? get expanded => _expanded;
  void setExpanded(Widget? expanded) {
    _expanded = expanded;
    notifyListeners();
  }

  /// Whether the tile is currently expanded.
  bool get isExpand => _isExpand;
  void setIsExpand(bool isExpand) {
    _isExpand = isExpand;
    notifyListeners();
  }

  /// The direction in which the tile expands.
  AxisExpand get axisExpand => _axis;
  void setAxisExpand(AxisExpand axisExpand) {
    _axis = axisExpand;
    notifyListeners();
  }

  /// action change status expandable
  void toggleExpand() {
    _isExpand = !_isExpand;
    notifyListeners();
  }
}
