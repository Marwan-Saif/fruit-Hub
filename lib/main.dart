import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruits/core/helper-functions/app_router.dart';
import 'package:fruits/core/services/prefs.dart';
import 'package:fruits/core/utils/app_colors.dart';
import 'package:fruits/generated/l10n.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; 

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  Prefs.init();
  runApp( const Fruits());
}
class Fruits extends StatelessWidget {
  const Fruits({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        fontFamily: 'Cairo',
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white
        ),
        colorScheme: ColorScheme.fromSeed  (
          seedColor: AppColors.primaryColor,
        )
      ),
      localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            locale: const Locale('ar'),
    routerConfig: AppRouter.roter,
    debugShowCheckedModeBanner: false,
    );
  }
}