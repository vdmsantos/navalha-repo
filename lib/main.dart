import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:projeto_1/presenter/splash/splashscreen.dart';

// void main() {
//   initializeDateFormatting().then( (_) =>
//   runApp(const MyApp())z);
// }

void main() {
  initializeDateFormatting().then(
    (_) => runApp(const MyApp()),
  );
}

// void main() {
// runApp(DevicePreview(enabled: !kReleaseMode, builder: (context) => MyApp()));
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      title: 'Barber app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
