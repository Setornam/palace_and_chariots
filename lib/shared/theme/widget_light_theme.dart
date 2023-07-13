import 'package:flutter/material.dart';

import 'color_scheme.dart';

///theme of the app
///
///LIGHT MODE THEME

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,

  inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(12)),
        errorMaxLines: 4,
        filled: true,
        fillColor: lightColorScheme.surface,
        focusColor: lightColorScheme.primary,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: lightColorScheme.primary, width: 2),
            borderRadius: BorderRadius.circular(12)),
        contentPadding: const EdgeInsets.all(22),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: lightColorScheme.primary, width: 2),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        floatingLabelAlignment: FloatingLabelAlignment.start,
        border: OutlineInputBorder(
            borderSide: BorderSide(color: lightColorScheme.surface))),

);
