import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'theme/fluid_background.dart';
import 'theme/glass_container.dart';
import 'screens/calculator_screen.dart';
import 'screens/reference_table_screen.dart';
import 'screens/history_screen.dart';
import 'screens/settings_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'services/settings_provider.dart';
import 'services/history_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SettingsProvider()),
        ChangeNotifierProvider(create: (_) => HistoryProvider()),
      ],
      child: const MyBmiApp(),
    ),
  );
}

class MyBmiApp extends StatelessWidget {
  const MyBmiApp({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);

    return MaterialApp(
      title: 'myBMI',
      onGenerateTitle: (context) => AppLocalizations.of(context)?.appTitle ?? 'myBMI',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('zh'),
        Locale('es'),
        Locale('ar'),
        Locale('id'),
        Locale('pt'),
        Locale('fr'),
        Locale('ja'),
        Locale('ru'),
        Locale('de'),
      ],
      locale: settingsProvider.locale,
      home: const MainShell(),
    );
  }
}

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _currentIndex = 0;

  final _screens = const <Widget>[
    CalculatorScreen(),
    ReferenceTableScreen(),
    HistoryScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return FluidBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: IndexedStack(index: _currentIndex, children: _screens),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
          child: GlassContainer(
            borderRadius: 20,
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (i) => setState(() => _currentIndex = i),
              items: [
                BottomNavigationBarItem(
                  icon: const Icon(Icons.calculate_rounded),
                  label: l10n.calculator,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.analytics_rounded),
                  label: l10n.reference,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.history_rounded),
                  label: l10n.history,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.settings_rounded),
                  label: l10n.settings,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
