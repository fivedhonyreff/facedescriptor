/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/icon_add.png
  AssetGenImage get iconAdd => const AssetGenImage('assets/icons/icon_add.png');

  /// List of all assets
  List<AssetGenImage> get values => [iconAdd];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/gif_loading.gif
  AssetGenImage get gifLoading =>
      const AssetGenImage('assets/images/gif_loading.gif');

  /// File path: assets/images/image_illus_splashscreen.png
  AssetGenImage get imageIllusSplashscreen =>
      const AssetGenImage('assets/images/image_illus_splashscreen.png');

  /// File path: assets/images/image_login.png
  AssetGenImage get imageLogin =>
      const AssetGenImage('assets/images/image_login.png');

  /// File path: assets/images/image_splashscreen.png
  AssetGenImage get imageSplashscreen =>
      const AssetGenImage('assets/images/image_splashscreen.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [gifLoading, imageIllusSplashscreen, imageLogin, imageSplashscreen];
}

class Assets {
  Assets._();

  static const String package = 'mpia';

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  static const String package = 'mpia';

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    @Deprecated('Do not specify package for a generated library asset')
    String? package = package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    @Deprecated('Do not specify package for a generated library asset')
    String? package = package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => 'packages/mpia/$_assetName';
}
