import 'package:estore/presentation/styles/colors.dart';
import 'package:flutter/material.dart';
extension BuildContextExtension on BuildContext
{
Color get scaffoldBackgroundColor =>Theme.of(this).scaffoldBackgroundColor;
Color get primaryTextColor =>Theme.of(this).textTheme.headlineLarge!.color!;
Color get secondaryTextColor =>Theme.of(this).textTheme.bodyLarge!.color!;
Color get tertiaryTextColor =>Theme.of(this).textTheme.labelSmall!.color!;
Color get fillColor =>Theme.of(this).inputDecorationTheme.fillColor!;
Color get hintColor =>Theme.of(this).inputDecorationTheme.hintStyle!.color!;
Color get primaryColor =>Theme.of(this).primaryColor;
WidgetStateProperty<Color?> get socialMediaButtonColor =>Theme.of(this).elevatedButtonTheme.style!.backgroundColor!;
WidgetStateProperty<Color?> get dropDownMenuColor =>Theme.of(this).dropdownMenuTheme.menuStyle!.backgroundColor!;
Color get dropDownMenuFillColor =>Theme.of(this).dropdownMenuTheme.inputDecorationTheme!.fillColor!;
Color get bottomNavigationBarColor =>Theme.of(this).bottomNavigationBarTheme.backgroundColor!;
}
class Themes
{
  static ThemeData lightTheme =ThemeData(
    primaryColor: AppColors.primary,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightBackground,
    textTheme:  TextTheme(
      headlineLarge: const TextStyle(
        color: AppColors.lightPrimaryText,
      ),
      bodyLarge: const TextStyle(
        color: AppColors.lightBackground
      ),
      labelSmall: TextStyle(
        color: AppColors.lightSecondaryText,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.lightSecondary,
      hintStyle: TextStyle(
        color: AppColors.lightSecondaryText,
      ),
    ),
    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(AppColors.lightSecondary),
      ),
    ),
    dropdownMenuTheme: const DropdownMenuThemeData(
      menuStyle: MenuStyle(
        backgroundColor: WidgetStatePropertyAll(AppColors.lightSecondary)
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: AppColors.lightSecondary
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.lightBackground,
      unselectedIconTheme: IconThemeData(
        color: AppColors.lightSecondaryText,
      ),
        selectedIconTheme: const IconThemeData(
            color: AppColors.primary
        ),
    )
  );



  static ThemeData darkTheme =ThemeData(
    primaryColor: AppColors.primary,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkBackground,
    textTheme: TextTheme(
      headlineLarge: const TextStyle(
        color: AppColors.darkPrimaryText,
      ),
        bodyLarge: const TextStyle(
            color: AppColors.lightBackground
        ),
        labelSmall: TextStyle(
          color: AppColors.darkSecondaryText,
        ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.darkSecondary,
      hintStyle: TextStyle(
        color: AppColors.darkSecondaryText,
      ),
    ),
    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(AppColors.darkSecondary),
      ),
    ),
      dropdownMenuTheme: const DropdownMenuThemeData(
          menuStyle: MenuStyle(
              backgroundColor: WidgetStatePropertyAll(AppColors.darkSecondary)
          ),
          inputDecorationTheme: InputDecorationTheme(
              fillColor: AppColors.darkSecondary
          ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.darkBackground,
        unselectedIconTheme: IconThemeData(
          color: AppColors.darkSecondaryText,
        ),
        selectedIconTheme: const IconThemeData(
          color: AppColors.primary
        )
      )
  );
}