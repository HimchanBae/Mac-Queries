import 'package:flutter/material.dart';
import 'package:mac_queries/component/style.dart' as mq_theme;
import 'package:mac_queries/component/dark_style.dart' as mq_dark_theme;
import 'package:mac_queries/screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(App(theme: mq_theme.theme));
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

class App extends StatelessWidget {
  const App({super.key, required this.theme});
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: mq_theme.theme,
      darkTheme: mq_dark_theme.darkTheme,
      themeMode: ThemeMode.system,
      home: const SplashScreen(),
    );
  }
}
