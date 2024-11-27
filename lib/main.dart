import 'package:flutter/material.dart';
import 'screens/homescreen.dart';
import 'screens/datascreen.dart';
import 'screens/contactscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Navigation App',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.white,
              primary: const Color.fromARGB(255, 255, 232, 232)),
          textTheme: Theme.of(context).textTheme.copyWith(
              bodyLarge: TextStyle(
                  fontFamily: 'Exo',
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: const Color.fromARGB(255, 0, 53, 111)))),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MainScreen> {
  int _currentIndex = 0;
  List _screens = [HomePage(), DataPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        destinations: [
          NavigationDestination(icon: (Icon(Icons.home)), label: 'Home'),
          NavigationDestination(icon: (Icon(Icons.list)), label: 'Data')
        ],
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
