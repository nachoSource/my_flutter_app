import 'dart:convert';

import 'package:flutter/material.dart';
import 'api/api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _responseOk = false;
  Api api = Api();

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  Future<dynamic> _fetchAlbums() async {
    final response =
        await api.get('https://jsonplaceholder.typicode.com/albums/1');

    _setResponseOk(response.statusCode >= 200);
    print(response);
    print(response.statusCode);
    print(response.reasonPhrase);
    print(response.body);
    return response;
  }

  void _setResponseOk(bool value) {
    setState(() {
      _responseOk = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Response Ok: ',
            ),
            Text(
              '$_responseOk',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            // const Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: <Widget>[Text("Row2")],
            // )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _fetchAlbums,
        tooltip: 'Fetch Albums',
        child: const Text("Fetch Albums"),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
