import 'dart:io';

import 'package:expandable_tile/expandable_tile.dart';
import 'package:flutter/material.dart';

/// The class helper for image
class ImageUtils {

  /// Get Image type from src params
  static ImageType getImageType(String src) {
    if (src.startsWith('http://') || src.startsWith('https://')) {
      /// Online image
      return ImageType.online;
    } else if (src.startsWith('/')) {
      /// Local file path
      return ImageType.localFile;
    } else {
      /// Default is asset
      return ImageType.asset;
    }
  }

  /// Get Widget by ImageType
  static Widget getImageWidgetByType(ImageType type, String src) {
    switch (type) {
      /// Online image
      case ImageType.online:
        return Image.network(src, fit: BoxFit.cover,);
      /// Local file path
      case ImageType.localFile:
        return Image.file(File(src), fit: BoxFit.cover);
      /// Default is asset
      default: return Image.asset(src, fit: BoxFit.cover);
    }
  }
}