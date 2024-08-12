import 'package:flutter/material.dart';
import 'package:mystery/features/create/screens/start_screen.dart';
import 'package:mystery/l10n/l10n.dart';
import 'package:mystery/utils/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme().darkTheme(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      home: const StartScreen(),
      title: 'Evolving Mystery',
    );
  }
}
