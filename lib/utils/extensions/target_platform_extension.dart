import 'package:flutter/material.dart';

extension TargetPlatformExtension on TargetPlatform {
  /// Return `true` if [TargetPlatform] is linux, macos or windows.
  bool get isDesktop => const <TargetPlatform>{
        TargetPlatform.linux,
        TargetPlatform.macOS,
        TargetPlatform.windows,
      }.contains(this);

  /// Return `true` if [TargetPlatform] is android, ios or fuchsia.
  bool get isMobile => const <TargetPlatform>{
        TargetPlatform.android,
        TargetPlatform.iOS,
        TargetPlatform.fuchsia,
      }.contains(this);
}

//usage:         
//final isMobile = Theme.of(context).platform.isMobile;
