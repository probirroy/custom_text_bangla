import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Future<String> loadAsset() async {
    return await rootBundle.loadString('assets/ntext.txt');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Scrollable Text View'),
        ),
        body: FutureBuilder(
          future: loadAsset(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Center(
                  child: Text(
                    snapshot.data!,
                    style: const TextStyle(fontSize: 20.0, fontFamily: 'Bangla'), textAlign: TextAlign.justify,
                  ),
                ),
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
