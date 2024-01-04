import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return _buildNavigation();
  }

  Widget _buildNavigation() {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      // Cupertino Design für iOS
      return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings),
              label: 'Settings',
            ),
          ],
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        tabBuilder: (context, index) {
          return CupertinoTabView(
            builder: (context) {
              // Hier kannst du die Inhalte für jede Tab-Ansicht erstellen
              return _buildContent(index);
            },
          );
        },
      );
    } else {
      // Material Design für andere Plattformen (Android)
      return Scaffold(
        appBar: AppBar(
          title: const Text('Bottom Navigation Bar'),
        ),
        body: _buildContent(_currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      );
    }
  }

  Widget _buildContent(int index) {
    // Hier kannst du den Inhalt für jede Tab-Ansicht erstellen
    switch (index) {
      case 0:
        return const Center(child: Text('Home Page'));
      case 1:
        return const Center(child: Text('Search Page'));
      case 2:
        return const Center(child: Text('Settings Page'));
      default:
        return const Center(child: Text('Unknown Page'));
    }
  }
}
