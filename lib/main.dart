import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'home.dart';
import 'settings.dart' as dialyNews;

void main() async {
  await Settings.init(cacheProvider: SharePreferenceCache());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueChangeObserver<bool>(
      cacheKey: dialyNews.Settings.keyDarkMode,
      defaultValue: true,
      builder: (cache, isDark, builder) => MaterialApp(
        title: 'Daily News',
        debugShowCheckedModeBanner: false,
        theme: isDark ? ThemeData.dark() : ThemeData.light(),
        home: Home(),
      ),
    );
  }
}
