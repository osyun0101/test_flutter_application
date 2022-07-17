import 'package:flutter/material.dart';

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
  //int _counter = 0;

  /*void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              'U L U',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 50),
            ),
            Image.asset('images/biyouin_sample.png'),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(8.0),
              width: double.infinity,
              height: 100,
              color: Theme.of(context).primaryColor,
              child: const Text('''
ONLINE SHOP
オンラインショップ
                ''', textAlign: TextAlign.center,),
            ),
            Table(
              children: [
                TableRow(children: [
                  myWidget(Theme.of(context).primaryColor, "green", 100.0),
                  myWidget(Theme.of(context).primaryColor, "green", 100.0),
                  myWidget(Theme.of(context).primaryColor, "green", 100.0),
                ])
              ],
            )
          ],

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
        ),
      ),
      /*bottomNavigationBar: NavigationBar(
          destinations: const [
            Text(
              'U L U',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 50),
            ),
            Text(
              'U L U',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 50),
            ),
          ],
        )*/
      /*floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), */ // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget myWidget(Color color, String text, double height) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.center,
        height: height,
        color: color,
        child: Text(text),
      ),
    );
  }
}
