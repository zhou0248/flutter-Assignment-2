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
              primary: const Color.fromARGB(255, 59, 41, 41),
              secondary: const Color.fromARGB(255, 206, 255, 225)),
          textTheme: Theme.of(context).textTheme.copyWith(
              bodyLarge: TextStyle(
                  fontFamily: 'Exo',
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: const Color.fromARGB(255, 0, 53, 111)),
              titleSmall: TextStyle(
                  fontFamily: 'Exo',
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  color: const Color.fromARGB(255, 2, 45, 0)),
              titleLarge: TextStyle(
                fontFamily: 'Exo',
                fontSize: 36,
                fontWeight: FontWeight.w700,
              ),
              bodySmall: TextStyle(
                  fontFamily: 'Exo',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromARGB(255, 37, 37, 0)))),
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
  List _screens = [HomePage(), DataPage(), ContactPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        destinations: [
          NavigationDestination(icon: (Icon(Icons.home)), label: 'Home'),
          NavigationDestination(icon: (Icon(Icons.list)), label: 'Data'),
          NavigationDestination(
              icon: (Icon(Icons.contact_mail)), label: 'Contact')
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
