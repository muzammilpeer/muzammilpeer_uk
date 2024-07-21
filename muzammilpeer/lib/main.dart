import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:muzammilpeer/portfolio_page.dart';
import 'package:muzammilpeer/theme/portfolio_theme.dart';
import 'package:muzammilpeer/theme/theme_provider.dart';
import 'package:muzammilpeer/widgets/aspect_ratio_enforcer.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
          create: (_) => ThemeProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Muzammil Peer Portfolio',
      theme: PortfolioTheme.lightTheme,
      darkTheme: PortfolioTheme.darkTheme,
      themeMode: themeProvider.themeMode,
      home: PortfolioPage(),
      routes: {
        "/home": (BuildContext context) => PortfolioPage(),
        "/detail": (BuildContext context) => PortfolioPage(),
      },
    );
  }
}
