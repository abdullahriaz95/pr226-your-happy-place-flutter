import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData getTheme(BuildContext context) {
    return ThemeData.light().copyWith(
      primaryColor: const Color(0xFF9B8AFE),
      scaffoldBackgroundColor: const Color(0xFFFBFBFB),
      appBarTheme: Theme.of(context).appBarTheme.copyWith(
            color: Colors.white,
            foregroundColor: Colors.black87,
            iconTheme: Theme.of(context).iconTheme.copyWith(
                  color: const Color(0xFF9987FE),
                ),
            titleTextStyle:
                Theme.of(context).appBarTheme.titleTextStyle?.copyWith(
                      color: Colors.black87,
                    ),
            toolbarTextStyle:
                Theme.of(context).appBarTheme.toolbarTextStyle?.copyWith(
                      color: Colors.black87,
                    ),
          ),
      colorScheme: Theme.of(context).colorScheme.copyWith(
            primary: const Color(0xFF9987FE),
            onBackground: Colors.white, // using this for input background color
          ),
    );
  }
}
