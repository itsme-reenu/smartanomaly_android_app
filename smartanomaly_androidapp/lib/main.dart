import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smartanomaly_androidapp/logic/navigationservice.dart';
//import 'package:smartanomaly_androidapp/UI/login_page/login_page.dart';
import 'package:smartanomaly_androidapp/firebase_options.dart';
import 'package:smartanomaly_androidapp/logic/usermanagement_service.dart';
import 'package:smartanomaly_androidapp/screenselector.dart';
import 'package:watch_it/watch_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  GetIt.I.registerSingleton<NavigationService>(NavigationService());
  GetIt.I.registerSingleton<UserManagementService>(UserManagementService());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget with WatchItMixin {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Brightness brightness = watchValue((NavigationService x) => x.brightness);

    return MaterialApp(
      title: 'Security App',
      home: ScreenSelector(),
      theme: ThemeData.from(
        colorScheme: brightness == Brightness.light
            ? ColorScheme.light(
                primary: const Color.fromARGB(255, 41, 5, 35),
                secondary: const Color.fromARGB(255, 41, 5, 35),
                surface: const Color.fromARGB(255, 41, 5, 35),
                background: const Color.fromARGB(
                    249, 102, 22, 102), // Changed to purple
                error: const Color(0xFFE6521F),
                onPrimary: const Color(0xFFFFFFFF),
                primaryContainer: const Color(0xFFFFFFFF),
                onPrimaryContainer: const Color(0xFF1F2128),
                onSecondary: const Color(0xFF212121),
                onSurface: const Color(0xFF212121),
                onBackground: const Color(0xFF242731),
                onError: const Color(0xFFFFFFFF),
                secondaryContainer: const Color(0xFFFFFFFF),
                onSecondaryContainer: const Color(0xFF212121),
                errorContainer: const Color(0xFFFF754C),
                onErrorContainer: const Color(0xFFFFFFFF),
                scrim: const Color(0xFF1F2128),
                shadow: const Color(0xFF1F2128),
                brightness: brightness,
              )
            : ColorScheme.dark(
                primary: const Color.fromARGB(255, 41, 2, 36),
                secondary: const Color.fromARGB(255, 41, 5, 35),
                surface: const Color.fromARGB(255, 41, 5, 35),
                background: const Color.fromARGB(
                    249, 102, 22, 102), // Changed to purple
                error: const Color.fromARGB(255, 216, 17, 17),
                onPrimary: const Color.fromARGB(255, 0, 0, 0),
                primaryContainer: const Color(0xFFC5BFED),
                onPrimaryContainer: const Color(0xFF1F2128),
                onSecondary: const Color(0xFFFFFFFF),
                onSurface: const Color(0xFFFFFFFF),
                onBackground: const Color(0xFFFFFFFF),
                onError: const Color(0xFFFFFFFF),
                secondaryContainer: const Color(0xFF242731),
                onSecondaryContainer: const Color(0xFFFFFFFF),
                errorContainer: const Color(0xFFFF754C),
                onErrorContainer: const Color(0xFFFFFFFF),
                scrim: const Color(0xFFC5BFED),
                shadow: const Color(0xFFC5BFED),
                brightness: brightness),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
