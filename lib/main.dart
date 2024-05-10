import 'package:flutter/material.dart';
import 'package:flutter_graficonovo/src/isar/moeda_database.dart';
import 'package:flutter_graficonovo/src/screens/main_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MoedaDatabase.initialize();

  runApp(
    ChangeNotifierProvider(
      create: (context) => MoedaDatabase(),
      child: const AppWidget(),
    ),
  );
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
    );
  }
}
