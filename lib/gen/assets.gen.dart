// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/add.png
  AssetGenImage get add => const AssetGenImage('assets/images/add.png');

  /// File path: assets/images/alert.png
  AssetGenImage get alert => const AssetGenImage('assets/images/alert.png');

  /// File path: assets/images/avatar_profile.png
  AssetGenImage get avatarProfile =>
      const AssetGenImage('assets/images/avatar_profile.png');

  /// File path: assets/images/carousel_1.jpg
  AssetGenImage get carousel1 =>
      const AssetGenImage('assets/images/carousel_1.jpg');

  /// File path: assets/images/carousel_2.jpg
  AssetGenImage get carousel2 =>
      const AssetGenImage('assets/images/carousel_2.jpg');

  /// File path: assets/images/carousel_3.jpg
  AssetGenImage get carousel3 =>
      const AssetGenImage('assets/images/carousel_3.jpg');

  /// File path: assets/images/carousel_4.jpg
  AssetGenImage get carousel4 =>
      const AssetGenImage('assets/images/carousel_4.jpg');

  /// File path: assets/images/carousel_5.jpg
  AssetGenImage get carousel5 =>
      const AssetGenImage('assets/images/carousel_5.jpg');

  /// File path: assets/images/carousel_bottom_1.jpg
  AssetGenImage get carouselBottom1 =>
      const AssetGenImage('assets/images/carousel_bottom_1.jpg');

  /// File path: assets/images/carousel_bottom_2.jpg
  AssetGenImage get carouselBottom2 =>
      const AssetGenImage('assets/images/carousel_bottom_2.jpg');

  /// File path: assets/images/conversation.png
  AssetGenImage get conversation =>
      const AssetGenImage('assets/images/conversation.png');

  /// File path: assets/images/exposant.jpg
  AssetGenImage get exposant =>
      const AssetGenImage('assets/images/exposant.jpg');

  /// File path: assets/images/feed.png
  AssetGenImage get feed => const AssetGenImage('assets/images/feed.png');

  /// File path: assets/images/gallery.png
  AssetGenImage get gallery => const AssetGenImage('assets/images/gallery.png');

  /// File path: assets/images/language.png
  AssetGenImage get language =>
      const AssetGenImage('assets/images/language.png');

  /// File path: assets/images/location.png
  AssetGenImage get location =>
      const AssetGenImage('assets/images/location.png');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/plus.png
  AssetGenImage get plus => const AssetGenImage('assets/images/plus.png');

  /// File path: assets/images/post_1.jpg
  AssetGenImage get post1 => const AssetGenImage('assets/images/post_1.jpg');

  /// File path: assets/images/post_2.jpg
  AssetGenImage get post2 => const AssetGenImage('assets/images/post_2.jpg');

  /// File path: assets/images/profile.png
  AssetGenImage get profile => const AssetGenImage('assets/images/profile.png');

  /// File path: assets/images/profile_image.jpg
  AssetGenImage get profileImage =>
      const AssetGenImage('assets/images/profile_image.jpg');

  /// File path: assets/images/program_1.jpg
  AssetGenImage get program1 =>
      const AssetGenImage('assets/images/program_1.jpg');

  /// File path: assets/images/program_2.jpg
  AssetGenImage get program2 =>
      const AssetGenImage('assets/images/program_2.jpg');

  /// File path: assets/images/restaurant.png
  AssetGenImage get restaurant =>
      const AssetGenImage('assets/images/restaurant.png');

  /// File path: assets/images/search.png
  AssetGenImage get search => const AssetGenImage('assets/images/search.png');

  /// File path: assets/images/speaker_1.jpg
  AssetGenImage get speaker1 =>
      const AssetGenImage('assets/images/speaker_1.jpg');

  /// File path: assets/images/speaker_2.png
  AssetGenImage get speaker2 =>
      const AssetGenImage('assets/images/speaker_2.png');

  /// File path: assets/images/speaker_3.jpg
  AssetGenImage get speaker3 =>
      const AssetGenImage('assets/images/speaker_3.jpg');

  /// File path: assets/images/story_1.jpg
  AssetGenImage get story1 => const AssetGenImage('assets/images/story_1.jpg');

  /// File path: assets/images/story_2.jpg
  AssetGenImage get story2 => const AssetGenImage('assets/images/story_2.jpg');

  /// File path: assets/images/story_3.jpg
  AssetGenImage get story3 => const AssetGenImage('assets/images/story_3.jpg');

  /// File path: assets/images/story_4.jpg
  AssetGenImage get story4 => const AssetGenImage('assets/images/story_4.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [
    add,
    alert,
    avatarProfile,
    carousel1,
    carousel2,
    carousel3,
    carousel4,
    carousel5,
    carouselBottom1,
    carouselBottom2,
    conversation,
    exposant,
    feed,
    gallery,
    language,
    location,
    logo,
    plus,
    post1,
    post2,
    profile,
    profileImage,
    program1,
    program2,
    restaurant,
    search,
    speaker1,
    speaker2,
    speaker3,
    story1,
    story2,
    story3,
    story4,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

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
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
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

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
