import 'package:flutter/material.dart';
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
  //int _counter = 0;

  /*void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }*/
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
    return ConstrainedBox(
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
        child: Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
              backgroundColor: Theme.of(context).backgroundColor,
            ),
            body: Center(
              child: Column(children: [
                const Text(
                  'U L U',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 50),
                ),
                Image.asset('images/biyouin_sample.png'),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(8.0),
                  color: Theme.of(context).primaryColor,
                  child: SizedBox(
                    width: double.infinity,
                    height: 100,
                    child: ElevatedButton(
                      onPressed: opneUrl,
                      child: const Text(
                        '''
ONLINE SHOP
オンラインショップ
                ''',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                /*Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                        child: Container(
                            alignment: Alignment.center,
                            color: Theme.of(context).primaryColor,
                            child: Text("green"))),
                    Expanded(
                        child: Container(
                            alignment: Alignment.center,
                            color: Theme.of(context).primaryColor,
                            child: Text("green"))),
                  ],
                ))*/
                Expanded(
                    child: Row(
                  children: [
                    Expanded(
                        child:
                            myWidget(Theme.of(context).primaryColor, "green")),
                    Expanded(
                        child:
                            myWidget(Theme.of(context).primaryColor, "green")),
                    Expanded(
                        child:
                            myWidget(Theme.of(context).primaryColor, "green"))
                  ],
                )),
                Expanded(
                    child: Row(
                  children: [
                    Expanded(
                        child:
                            myWidget(Theme.of(context).primaryColor, "green")),
                    Expanded(
                        child:
                            myWidget(Theme.of(context).primaryColor, "green")),
                    Expanded(
                        child:
                            myWidget(Theme.of(context).primaryColor, "green"))
                  ],
                )),
                Expanded(
                    child: Row(
                  children: [
                    Expanded(
                        child:
                            myWidget(Theme.of(context).primaryColor, "green")),
                    Expanded(
                        child:
                            myWidget(Theme.of(context).primaryColor, "green")),
                    Expanded(
                        child:
                            myWidget(Theme.of(context).primaryColor, "green"))
                  ],
                ))
                /*mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],*/
              ]),
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
            /*floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), */ // This trailing comma makes auto-formatting nicer for build methods.
            ));
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
