class Ratio {
  final int left;
  final int right;

  const Ratio(this.left, this.right);

  /// Tính tỉ số dạng double
  double get value => left / right;

  @override
  String toString() => '$left:$right';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Ratio &&
              runtimeType == other.runtimeType &&
              left == other.left &&
              right == other.right;

  @override
  int get hashCode => left.hashCode ^ right.hashCode;
}