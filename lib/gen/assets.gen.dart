/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/ic_approve.svg
  String get icApprove => 'assets/icons/ic_approve.svg';

  /// File path: assets/icons/ic_chevron_left.svg
  String get icChevronLeft => 'assets/icons/ic_chevron_left.svg';

  /// File path: assets/icons/ic_chevron_right.svg
  String get icChevronRight => 'assets/icons/ic_chevron_right.svg';

  /// File path: assets/icons/ic_close.svg
  String get icClose => 'assets/icons/ic_close.svg';

  /// File path: assets/icons/ic_home.svg
  String get icHome => 'assets/icons/ic_home.svg';

  /// File path: assets/icons/ic_invitation.svg
  String get icInvitation => 'assets/icons/ic_invitation.svg';

  /// File path: assets/icons/ic_invitation_notif.svg
  String get icInvitationNotif => 'assets/icons/ic_invitation_notif.svg';

  /// File path: assets/icons/ic_plus.svg
  String get icPlus => 'assets/icons/ic_plus.svg';

  /// File path: assets/icons/ic_profile.svg
  String get icProfile => 'assets/icons/ic_profile.svg';

  /// File path: assets/icons/ic_reject.svg
  String get icReject => 'assets/icons/ic_reject.svg';

  /// File path: assets/icons/ic_search.svg
  String get icSearch => 'assets/icons/ic_search.svg';

  /// File path: assets/icons/ic_wa.png
  AssetGenImage get icWa => const AssetGenImage('assets/icons/ic_wa.png');
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/img_ktp_example.png
  AssetGenImage get imgKtpExample =>
      const AssetGenImage('assets/images/img_ktp_example.png');

  /// File path: assets/images/img_ktp_not_found.png
  AssetGenImage get imgKtpNotFound =>
      const AssetGenImage('assets/images/img_ktp_not_found.png');

  /// File path: assets/images/img_person_default.png
  AssetGenImage get imgPersonDefault =>
      const AssetGenImage('assets/images/img_person_default.png');

  /// File path: assets/images/img_success.png
  AssetGenImage get imgSuccess =>
      const AssetGenImage('assets/images/img_success.png');
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

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
    String? package,
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

  String get path => _assetName;

  String get keyName => _assetName;
}
