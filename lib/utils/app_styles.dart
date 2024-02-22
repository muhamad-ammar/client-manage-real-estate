import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Utils/appTheme.dart';

/// A class that holds all the icon sizes used throughout
/// the entire app.
@immutable
class IconSizes {
  const IconSizes._privateConstructor();

  static const double sm19 = 19;
  static const double med22 = 22;
  static const double lg27 = 27;
}

/// A class that holds all the gaps and insets used
/// throughout the entire app by things such as padding, sizedbox etc.
@immutable
class Insets {
  const Insets._privateConstructor();

  static const double formHzPadding = 15;

  static const double homeHzPadding = 28;

  static const double sectionTitleVTPadding = 14;

  /// [SizedBox] of height **3**.
  static const gapH3 = SizedBox(height: 3);

  /// [SizedBox] of height **4**.
  static const gapH4 = SizedBox(height: 4);

  /// [SizedBox] of height **8**.
  static const gapH8 = SizedBox(height: 8);

  /// [SizedBox] of width **3**.
  static const gapW3 = SizedBox(width: 3);

  /// [SizedBox] of height **5**.
  static const gapH5 = SizedBox(height: 5);

  /// [SizedBox] of width **5**.
  static const gapW5 = SizedBox(width: 5);

  /// [SizedBox] of width **8**.
  static const gapW8 = SizedBox(width: 8);

  /// [SizedBox] of height **10**.
  static const gapH10 = SizedBox(height: 10);

  /// [SizedBox] of width **10**
  static const gapW10 = SizedBox(width: 10);

  /// [SizedBox] of width **15**
  static const gapW15 = SizedBox(width: 15);

  /// [SizedBox] of width **20**
  static const gapW20 = SizedBox(width: 20);

  /// [SizedBox] of height **15**
  static const gapH15 = SizedBox(height: 15);

  /// [SizedBox] of height **20**
  static const gapH20 = SizedBox(height: 20);

  /// [SizedBox] of height **25**
  static const gapH25 = SizedBox(height: 25);

  /// [SizedBox] of height **25**
  static const gapH40 = SizedBox(height: 40);

  /// [Spacer] for adding infinite gaps, as much as the constraints
  /// allow.
  static const expand = Spacer();

  /// The value for bottom padding of buttons in the app.
  /// It is measured from the bottom of the screen, that is
  /// behind the android system navigation.
  /// Used to prevent overlapping of android navigation with the button.
  static const bottomInsets = SizedBox(height: 38);

  /// The value for a smaller bottom padding of buttons in the app.
  /// It is measured from the bottom of the screen, that is
  /// behind the android system navigation.
  /// Used to prevent overlapping of android navigation with the button.
  static const bottomInsetsLow = SizedBox(height: 20);
}

/// A class that holds all the border radiuses used throughout
/// the entire app by things such as container, card etc.
///
@immutable
class Corners {
  const Corners._();

  /// [BorderRadius] rounded on all corners by **4**
  static const BorderRadius rounded4 = BorderRadius.all(Radius.circular(4));

  static const BorderRadius rounded5 = BorderRadius.all(Radius.circular(5));

  static const BorderRadius rounded10 = BorderRadius.all(Radius.circular(10));

  static const BorderRadius rounded15 = BorderRadius.all(Radius.circular(15));
}

/// A class that holds all the shadows used throughout
/// the entire app by things such as animations, tickers etc.
///
/// This class has no constructor and all variables are `static`.
@immutable
class Shadows {
  const Shadows._();

  static const List<BoxShadow> universal = [
    BoxShadow(
      color: Color.fromRGBO(51, 51, 51, 0.15),
      blurRadius: 10,
    ),
  ];

  static const elevated = <BoxShadow>[
    BoxShadow(
      color: Color.fromARGB(76, 158, 158, 158),
      blurRadius: 3,
      spreadRadius: -0.2,
      offset: Offset(2, 0),
    ),
    BoxShadow(
      color: Color.fromARGB(76, 158, 158, 158),
      blurRadius: 3,
      spreadRadius: -0.2,
      offset: Offset(-2, 0),
    ),
  ];

  static const List<BoxShadow> small = [
    BoxShadow(
      color: Color.fromRGBO(51, 51, 51, .15),
      blurRadius: 3,
      offset: Offset(0, 1),
    ),
  ];
}

/// A class that holds all the text specific styles used throughout
/// the entire app by things such as heading, description, input field, etc
///
/// This class has no constructor and all variables are `static`.
@immutable
class Textify {
  const Textify._();

  static final TextStyle heading1 = GoogleFonts.raleway(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.48,
    color: AppTheme.headingColor,
  );

  static final TextStyle heading2 = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );

  static final TextStyle heading3 = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppTheme.accentColor,
  );

  static final TextStyle heading4 = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppTheme.blackColor,
  );

  static final TextStyle heading5 = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppTheme.primaryColor,
  );

  static final TextStyle paragraph1 = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.none,
    letterSpacing: 0.28,
  );

  static final TextStyle paragraph2 = GoogleFonts.poppins(
      fontSize: 12,
      color: AppTheme.shadowColor
  );

  static final TextStyle paragraph3 = GoogleFonts.poppins(
      fontSize: 10,
      color: AppTheme.successColor
  );
  static final TextStyle paragraph4 = GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Colors.black
  );

  static final TextStyle hint = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  static final TextStyle boldHint = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle title1 = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );

  static final TextStyle title2 = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );
}