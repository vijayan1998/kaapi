import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kappi/src/views/utilies/colors.dart';

class AppTheme {
  static var lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
       backgroundColor: Appcolors.appColors.shade50),
        scaffoldBackgroundColor:Appcolors.appColors.shade50,
      brightness: Brightness.light,
      canvasColor:const Color(0xFFE9B32F),
      splashColor: const Color(0xff515151),
      hintColor: const Color(0xFFCFB88C),
      dividerColor: const Color(0xFFF8F8F8),
      focusColor:const Color(0xffFFFFFF),
      shadowColor: const Color(0xff0D0D0D),
      hoverColor: const Color(0xff171412),
      textTheme: TextTheme(
            headlineMedium: GoogleFonts.publicSans(
            color:Appcolors.appColors.shade100,
            fontSize: 28,
            fontWeight: FontWeight.w600,
          ),
             headlineSmall: GoogleFonts.publicSans(
            color: Color(0xffFFFFFF),
            fontSize: 26,
            fontWeight: FontWeight.w600,
          ),
          titleLarge: GoogleFonts.publicSans(
            color: Appcolors.appColors.shade100,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),  
          titleMedium: GoogleFonts.publicSans(
            color: Appcolors.appColors.shade100,
            fontSize:22,
            fontWeight:FontWeight.w500,
            ),
            titleSmall: GoogleFonts.publicSans(
            color: Appcolors.appColors.shade100,
            fontSize:20,
            fontWeight:FontWeight.w500,
            ),
            bodyLarge: GoogleFonts.publicSans(
              color: Appcolors.appColors.shade100,
            fontSize:18,
            fontWeight:FontWeight.w400,
            ),
             bodyMedium: GoogleFonts.publicSans(
              color:  Appcolors.appColors.shade100,
            fontSize:16,
            fontWeight:FontWeight.w400,
            ),
             bodySmall: GoogleFonts.publicSans(
              color:Appcolors.appColors.shade100,
            fontSize:14,
            fontWeight:FontWeight.w400,
            ),
            labelLarge: GoogleFonts.publicSans(
              color: Appcolors.appColors.shade100,
              fontSize:20,
              fontWeight: FontWeight.w400,
            ),
          ),

    
    );
    
}