/// The direction in which the tile expands.
enum AxisExpand {
  /// Expands horizontally.
  horizontal,

  /// Expands vertically.
  vertical
}

/// The expandable animation type
enum ExpandableAnimation {
  /// default size animation
  def,

  /// fade animation
  fade,

  /// scale animation
  scale,

  /// no animation
  none,
}

/// The image type
enum ImageType {
  online, localFile, asset
}