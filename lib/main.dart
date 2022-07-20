import 'package:flutter/material.dart';
import 'package:test_flutter_application/home.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: Colors.white,
        primarySwatch: Colors.lightGreen,
      ),
      home: const MyHomePage(title: 'ulu'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  // 表示する Widget の一覧
  static final List<Widget> _pageList = [
    const Home(),
    const Text("2tab")
  ];

  void opneUrl() async {
    Uri url = Uri.parse('https://geniepi-hiroba.com/');
    if (await canLaunchUrl(url)) {
      //mode: LaunchMode.externalApplicationにするとアプリ内ではなくブラウザを起動して表示するようにできる
      await launchUrl(url);
    } else {
      throw 'このURLにはアクセスできません';
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Theme.of(context).backgroundColor,
        ),
        body: Center(
          child: _pageList[_selectedIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
            selectedLabelStyle: const TextStyle(color: Colors.black),
            unselectedLabelStyle: const TextStyle(color: Colors.black),
            showUnselectedLabels: true, //選択されていないタブのラベルも表示する
            selectedItemColor: Colors.blue,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            type: BottomNavigationBarType
                .fixed, //４つ以上だとラベルが非表示になるためこのオプションを指定して解消
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  activeIcon: Icon(Icons.home),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  activeIcon: Icon(Icons.home, color: Colors.blue),
                  label: '予約'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  activeIcon: Icon(Icons.home, color: Colors.blue),
                  label: '店舗情報'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  activeIcon: Icon(Icons.home, color: Colors.blue),
                  label: 'マイページ')
            ])
        );
  }

  Widget myWidget(Color color, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.center,
        color: color,
        child: Text(text),
      ),
    );
  }
}
