import 'package:crypto_app/config/router/app_router.dart';
import 'package:crypto_app/config/theme/app_theme.dart';
import 'package:crypto_app/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto_app/features/home/presentation/bloc/home_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // for dependency injection
  await setup();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => locator<HomeBloc>(),
      ),
    ],
    child: const MyApp(),
  ));
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
