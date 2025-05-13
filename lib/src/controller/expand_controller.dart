import 'package:expandable_tile/src/data/type.dart';
import 'package:flutter/material.dart';

class ExpandTileController extends ChangeNotifier {
  String? _title;
  Widget? _expanded;
  bool _isExpand = false;
  AxisExpand _axis = AxisExpand.vertical;

  String? get title => _title;
  void setTitle(String title) {
    _title = title;
    notifyListeners();
  }

  Widget? get expanded => _expanded;
  void setExpanded(Widget? expanded) {
    _expanded = expanded;
    notifyListeners();
  }

  bool get isExpand => _isExpand;
  void setIsExpand(bool isExpand) {
    _isExpand = isExpand;
    notifyListeners();
  }

  AxisExpand get axisExpand => _axis;
  void setAxisExpand(AxisExpand axisExpand) {
    _axis = axisExpand;
    notifyListeners();
  }

  void toggleExpand() {
    _isExpand = !_isExpand;
    notifyListeners();
  }
}
