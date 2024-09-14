import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  void updateTheme(ThemeMode themeMode) => emit(themeMode);

  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    final themeIndex = json['theme'] as int?;
    if (themeIndex != null) {
      return ThemeMode
          .values[themeIndex]; // Kembalikan ThemeMode yang sesuai dengan index
    }
    return null;
  }

  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    return {
      'theme': state.index
    }; // Simpan index dari ThemeMode sebagai integer
  }
}
