import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mental_health_apps/src/screen/mental_health_main_scren.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MentalHealthApp extends StatelessWidget {
  const MentalHealthApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return MaterialApp(
      title: "Mental Health App",
      debugShowCheckedModeBanner: false,
      home: ProviderScope(child: MentalHealthMainScreen()),
    );
  }
}
