import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  void opneUrl() async {
    Uri url = Uri.parse('https://geniepi-hiroba.com/');
    if (await canLaunchUrl(url)) {
      //mode: LaunchMode.externalApplicationにするとアプリ内ではなくブラウザを起動して表示するようにできる
      await launchUrl(url);
    } else {
      throw 'このURLにはアクセスできません';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
      Expanded(
          child: Row(
        children: [
          Expanded(child: myWidget(Theme.of(context).primaryColor, "green")),
          Expanded(child: myWidget(Theme.of(context).primaryColor, "green")),
          Expanded(child: myWidget(Theme.of(context).primaryColor, "green"))
        ],
      )),
      Expanded(
          child: Row(
        children: [
          Expanded(child: myWidget(Theme.of(context).primaryColor, "green")),
          Expanded(child: myWidget(Theme.of(context).primaryColor, "green")),
          Expanded(child: myWidget(Theme.of(context).primaryColor, "green"))
        ],
      )),
      Expanded(
          child: Row(
        children: [
          Expanded(child: myWidget(Theme.of(context).primaryColor, "green")),
          Expanded(child: myWidget(Theme.of(context).primaryColor, "green")),
          Expanded(child: myWidget(Theme.of(context).primaryColor, "green"))
        ],
      ))
    ]);
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
