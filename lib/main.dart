import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'presenter/ui/splash/splashscreen.dart';

void main() {
  runApp(
    ProviderScope(
      child: DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // initializeDateFormatting();
    return ProviderScope(
        child: GetMaterialApp(
      useInheritedMediaQuery: true,
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      title: 'Barber app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    ));
    //    )
    // ProviderScope(
    //   child: GetMaterialApp(
    //     // useInheritedMediaQuery: true,
    //     // builder: DevicePreview.appBuilder,
    //     debugShowCheckedModeBanner: false,
    //     title: 'Barber app',
    //     theme: ThemeData(
    //       primarySwatch: Colors.blue,
    //     ),
    //     home: const SplashScreen(),
    //   ),
    // );
  }
}
