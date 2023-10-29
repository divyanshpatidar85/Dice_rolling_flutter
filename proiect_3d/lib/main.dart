import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice Rolling',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Dice Rolling'),
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
  int _counter = 1;
  int randomDouble = 1;

  void _incrementCounter() {}

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
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              child: _counter == 0
                  ? Image.asset('assets/dice-work.webp')
                  : Container(
                      height: 20,
                      width: 30,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black,
                              width: 1.0,
                              style: BorderStyle.solid)),
                      child: Column(
                        children: [
                          randomDouble == 1
                              ? Center(child: Image.asset('assets/phase1.png'))
                              : const SizedBox(
                                  height: 0,
                                  width: 0,
                                ),
                          randomDouble == 2
                              ? Center(
                                  child: Image.asset(
                                  'assets/phase2.png',
                                  scale: 1,
                                ))
                              : const SizedBox(
                                  height: 0,
                                  width: 0,
                                ),
                          randomDouble == 3
                              ? Center(child: Image.asset('assets/phase3.png'))
                              : const SizedBox(
                                  height: 0,
                                  width: 0,
                                ),
                          randomDouble == 4
                              ? Center(child: Image.asset('assets/phase4.png'))
                              : const SizedBox(
                                  height: 0,
                                  width: 0,
                                ),
                          randomDouble == 5
                              ? Center(child: Image.asset('assets/phase5.png'))
                              : const SizedBox(
                                  height: 0,
                                  width: 0,
                                ),
                          randomDouble == 6
                              ? Center(child: Image.asset('assets/phase6.png'))
                              : const SizedBox(
                                  height: 0,
                                  width: 0,
                                )
                        ],
                      ),
                    ),
            ),
            _counter == 0
                ? ElevatedButton(
                    onPressed: () async {
                      Random random = Random();
                      randomDouble = random.nextInt(6) + 1;
                      print('Random Double: $randomDouble');
                      _counter = 1;
                      // randomDouble = 1;
                      setState(() {});
                    },
                    child: const Text('Roll'))
                : ElevatedButton(
                    onPressed: () async {
                      _counter = 0;
                      setState(() {});
                      await Future.delayed(Duration(seconds: 2));
                      _counter = 1;
                      Random random = Random();
                      randomDouble = random.nextInt(6) + 1;
                      setState(() {});
                    },
                    child: const Text('Roll'))
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
