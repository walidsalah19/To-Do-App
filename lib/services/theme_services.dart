import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeServices {
  final GetStorage _box = GetStorage();

  final _key = "isDarkMode";

  _saveThemeToBox(bool mode) {
    _box.write(_key, mode);
  }

  bool _loadThemeFromBox() {
    return _box.read<bool>(_key) ?? false;
  }

  ThemeMode get them => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  void switchTheme() {
    Get.changeThemeMode((_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark));
    _saveThemeToBox(!_loadThemeFromBox());
  }
}
