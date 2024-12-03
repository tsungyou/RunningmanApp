import 'package:flutter/material.dart';
import 'episode_data.dart';
import 'instruction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Running Man App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _mainPageIndex = 0;
  bool _initPage = true;
  int _episodeIndex = 0;

  final Map<String, Map<String, Widget>> _episodes = episodeData;
  void _onBottomNavTapped(int index) {
    setState(() {
      _mainPageIndex = index;
      _initPage = false;
    });
  }

  void _onSidebarTapped(String episodeTitle) {
    setState(() {
      _episodeIndex = _episodes.keys.toList().indexOf(episodeTitle);
      _initPage = false;
    });
  }

  Widget _getCurrentPage() {
      final episodeTitle = _episodes.keys.elementAt(_episodeIndex);
      final episodeData = _episodes[episodeTitle]!;
      if (_initPage) {
        return const InstructionPage();
      }
      switch (_mainPageIndex) {
        case 0:
          return episodeData['map']!;
        case 1:
          return episodeData['episode']!;
        case 2:
          return episodeData['dictionary']!;
        default:
          return const InstructionPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Running Man'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Episodes',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ..._episodes.keys.map((episodeTitle) => ListTile(
              title: Text(episodeTitle),
              onTap: () {
                _onSidebarTapped(episodeTitle);
                Navigator.pop(context);
              },
            )).toList(),
          ],
        ),
      ),
      body: Center(
        child: _getCurrentPage(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            label: 'Episodes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Dictionary',
          ),
        ],
        currentIndex: _mainPageIndex,
        onTap: _onBottomNavTapped,
      ),
    );
  }
}