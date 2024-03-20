import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:property_help/view/auth/view_profile_screen.dart';

import '../Utils/appTheme.dart';
import '../Utils/uiUtils.dart';
import '../constants/app_constants.dart';
import '../constants/app_menu_items.dart';
import 'FollowUps/followups.dart';
import 'home.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UiUtils.getPrimaryAppBar(context),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: _getPage(AppConstants.bottomBarIndex),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _getPage(int index) {
    if (index == AppMenuItem.home.index) {
      return const HomeScreen();
    } else if(index == AppMenuItem.profile.index){
      return  ViewProfileScreen();
    }
    else if(index == AppMenuItem.followUps.index){
      return  FollowUpsScreen();
    }
    else
    {
      return const HomeScreen();
    }
    // } else if (index == AppMenuItem.explore.index) {
    //   return const ExploreScreen();
    // } else if (index == AppMenuItem.courseLog.index) {
    //   return const CourseLogScreen();
    //   // } else if (index == AppMenuItem.chat.index) {
    //   //   return const ChatListScreen();
    // } else {
    //   return const ViewProfileScreen();
    // }
  }

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      currentIndex: AppConstants.bottomBarIndex,
      selectedFontSize: 12,
      selectedLabelStyle: GoogleFonts.poppins(fontWeight: FontWeight.w500),
      selectedItemColor: AppTheme.accentColor,
      unselectedFontSize: 12,
      unselectedLabelStyle: GoogleFonts.poppins(fontWeight: FontWeight.w400),
      unselectedItemColor: AppTheme.grayColor,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: _getIcon(AppMenuItem.home),
          label: AppMenuItem.home.value,
        ),
        BottomNavigationBarItem(
          icon: _getIcon(AppMenuItem.explore),
          label: AppMenuItem.explore.value,
        ),
        BottomNavigationBarItem(
          icon: _getIcon(AppMenuItem.followUps),
          label: AppMenuItem.followUps.value,
        ),
        // BottomNavigationBarItem(
        //   icon: _getIcon(AppMenuItem.chat),
        //   label: AppMenuItem.chat.value,
        // ),
        BottomNavigationBarItem(
          icon: _getIcon(AppMenuItem.profile),
          label: AppMenuItem.profile.value,
        ),
      ],
      onTap: _onItemSelected,
    );
  }

  Widget _getIcon(AppMenuItem item) {
    final index = item.index;
    final asset = AppMenuItem.getIconAsset(index);
    return Icon(
      asset,
      color: _isSelected(index) ? AppTheme.accentColor : AppTheme.grayColor,
    );
  }

  bool _isSelected(int index) => index == AppConstants.bottomBarIndex;

  void _onItemSelected(int index) {
    // if (index == AppMenuItem.chat.index ||
    //     index == AppMenuItem.profile.index) {
    // }
    setState(() {
      AppConstants.bottomBarIndex = index;
    });
  }
}
