import 'package:crypto_app/config/router/app_router.dart';
import 'package:crypto_app/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter,
        locale: Locale('en', 'US'),
        supportedLocales: const [Locale('en', 'US')],
        theme: AppTheme.lightTheme,
      ),
    );
  }
}
