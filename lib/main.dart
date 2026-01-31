  import 'package:ecommerce_app/Screen/login_page.dart';
import 'package:flutter/material.dart';
  import 'package:flutter_localizations/flutter_localizations.dart';
  import 'package:provider/provider.dart';
  import 'provider/cart_provider.dart';
  import 'theme/theme_provider.dart';
  import 'localization/local_provider.dart';
  import 'localization/app_localizations.dart';
  import 'provider/Home_provider.dart';
  import 'package:firebase_core/firebase_core.dart';
  import 'firebase/firebase_options.dart';
  void main()async {

    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
          ChangeNotifierProvider(create: (_) => LocaleProvider()),
          ChangeNotifierProvider(create: (_) => HomeProvider()),
          ChangeNotifierProvider(create: (_) => CartProvider()),
        ],
        child: const MyApp(),
      ),
    );
  }

  class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
      final themeProvider = Provider.of<ThemeProvider>(context);
      final localeProvider = Provider.of<LocaleProvider>(context);
      

      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "E-Commerce",

        locale: localeProvider.locale,

        supportedLocales: const [
          Locale('en'),
          Locale('ar'),
        ],

        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],

      
        theme: themeProvider.lightTheme,
        darkTheme: themeProvider.darkTheme,
        themeMode: themeProvider.themeMode,

        home:  LoginPage(),
      );
    }
  }
