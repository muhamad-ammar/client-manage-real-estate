

import 'package:flutter/material.dart';

import 'app_assets.dart';

enum AppMenuItem {
  home("Home"),
  explore("Explore"),
  followUps("FollowUps"),
  // chat(Strings.chat),
  profile("Profile");

  const AppMenuItem(this.value);

  final String value;

  static IconData getIconAsset(int index) {
    if (index == AppMenuItem.home.index) {
      return Icons.home;
    } else if (index == AppMenuItem.explore.index) {
      return Icons.explore;
    } else if (index == AppMenuItem.followUps.index) {
      return Icons.calendar_today_rounded;
      // } else if (index == AppMenuItem.chat.index) {
      //   return AppAssets.icNavChat;
    } else if (index == AppMenuItem.profile.index) {
      return Icons.person_outline;
    }
    return Icons.lock;
  }
}