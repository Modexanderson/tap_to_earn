import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';
import 'screens/screens.dart';

// flutter build web --web-renderer html --release
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tap to Earn: Telegram Game',
      debugShowCheckedModeBanner: false,
      routes: const {
        // '/homePage': (context) => const HomePage()
      },
      theme: ThemeData(
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: kPrimaryLightColor,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
        ),
        textSelectionTheme: const TextSelectionThemeData(
          selectionHandleColor: kPrimaryColor,
          cursorColor: kPrimaryColor,
          selectionColor: kPrimaryColor,
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: const TextStyle(color: kPrimaryLightColor),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(width: 1.5, color: kPrimaryLightColor),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
                color: kPrimaryLightColor), // Set your border color here
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: kPrimaryDarkColor,
        ),
        listTileTheme: ListTileThemeData(
          iconColor: kPrimaryLightColor,
          textColor: kPrimaryLightColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.0),
          ),
        ),
        expansionTileTheme: ExpansionTileThemeData(
          iconColor: kPrimaryLightColor,
          textColor: kPrimaryLightColor,
          collapsedTextColor: kPrimaryLightColor,
          collapsedIconColor: kPrimaryLightColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.0),
          ),
        ),
        popupMenuTheme: PopupMenuThemeData(
            color: kPrimaryDarkColor,
            textStyle: const TextStyle(color: kPrimaryLightColor),
            labelTextStyle: WidgetStateProperty.resolveWith((states) {
              // Default TextStyle
              return const TextStyle(color: kPrimaryLightColor);
            })),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.dark,
        snackBarTheme:
            SnackBarThemeData(backgroundColor: Theme.of(context).hintColor),
        appBarTheme: AppBarTheme(
          elevation: 0,
          centerTitle: true,
          titleTextStyle: GoogleFonts.poppins(
            color: kPrimaryLightColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          backgroundColor: kPrimaryBackgroundColor,
          foregroundColor: kPrimaryLightColor,
        ),
        canvasColor: kPrimaryDarkColor,
        scaffoldBackgroundColor: kPrimaryDarkColor,
        textTheme: Typography.whiteCupertino,
        drawerTheme: const DrawerThemeData(
          backgroundColor: kPrimaryDarkColor,
        ),
        cardColor: kPrimaryDarkColor,
        cardTheme: CardTheme(
          color: kPrimaryDarkColor,
          clipBehavior: Clip.antiAlias,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.0),
          ),
        ),
        dialogBackgroundColor: kPrimaryDarkColor,
        progressIndicatorTheme:
            const ProgressIndicatorThemeData().copyWith(color: kPrimaryColor),
        iconTheme: const IconThemeData(
          color: kPrimaryLightColor,
          opacity: 1.0,
          size: 24.0,
        ),
        indicatorColor: kPrimaryColor,
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: kPrimaryLightColor,
              secondary: kPrimaryColor,
              brightness: Brightness.dark,
            ),
      ),
      home: const Screens(),
    );
  }
}
