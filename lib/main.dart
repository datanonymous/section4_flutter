import 'package:flutter/material.dart';
import 'package:section4_flutter/widgets/new_transaction.dart';
import 'package:section4_flutter/widgets/transaction_list.dart';
import './widgets/transaction_list.dart';
import './widgets/new_transaction.dart';
import './models/transaction.dart';
import './widgets/chart.dart';

//flare_flutter RIVE
//import 'package:flare_flutter/asset_provider.dart';
//import 'package:flare_flutter/cache.dart';
//import 'package:flare_flutter/cache_asset.dart';
//import 'package:flare_flutter/flare.dart';
//import 'package:flare_flutter/flare_actor.dart';
//import 'package:flare_flutter/flare_cache.dart';
//import 'package:flare_flutter/flare_cache_asset.dart';
//import 'package:flare_flutter/flare_cache_builder.dart';
//import 'package:flare_flutter/flare_controller.dart';
//import 'package:flare_flutter/flare_controls.dart';
//import 'package:flare_flutter/flare_render_box.dart';
//import 'package:flare_flutter/flare_testing.dart';
//import 'package:flare_flutter/provider/asset_flare.dart';
//import 'package:flare_flutter/provider/memory_flare.dart';
//import 'package:flare_flutter/trim_path.dart';

// ctrl + b = open widget properties in new screen
// ctrl + shift + i = view widget properties on screen
// ctrl + w = select widget
// ctrl + space = see what can be modified in a widget

//https://medium.com/rive/building-a-water-tracking-app-with-flare-flutter-f03de436dba3

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal expenses app',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final List<Transaction> _userTransactions = [
//    Transaction(
//      id: 't1',
//      title: 'New shoes',
//      amount: 34.43,
//      date: DateTime.now(),
//    ),
//    Transaction(
//      id: 't2',
//      title: 'Groceries',
//      amount: 90.31,
//      date: DateTime.now(),
//    ),
//    Transaction(
//      id: 't3',
//      title: 'Drone',
//      amount: 534.43,
//      date: DateTime.now(),
//    ),
//    Transaction(
//      id: 't4',
//      title: 'Amazon',
//      amount: 50.12,
//      date: DateTime.now(),
//    ),
//    Transaction(
//      id: 't5',
//      title: 'Disney',
//      amount: 50.21,
//      date: DateTime.now(),
//    ),
//    Transaction(
//      id: 't6',
//      title: 'Desktop computer',
//      amount: 80.56,
//      date: DateTime.now(),
//    ),
  ];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where(
      (tx) {
        return tx.date.isAfter(
          DateTime.now().subtract(
            Duration(days: 7),
          ),
        );
      },
    ).toList(); //every list has default function/method called where
  }

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTransaction = Transaction(
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );
    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (bCtx) {
        return GestureDetector(
          onTap: () {
//            Navigator.of(context).pop(); //to make modal sheet disappear
          },
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Personal expenses app'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Chart(_recentTransactions),
//            Card(
//              child: Container(
//                width: double.infinity,
//                child: Text('chart'),
//              ),
//              elevation: 20,
//            ),
            TransactionList(_userTransactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}

//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//
//    //Trying a notched app bar
//    return MaterialApp(
//      home: Scaffold(
//        appBar: AppBar(
//          title: Text('widget.title'),
//        ),
//        body: Center(
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//              Text(
//                'You have pushed the button this many times:',
//              ),
//              Text(
//                'You have pushed the button this many times:',
//              ),
//            ],
//          ),
//        ),
//        floatingActionButton: FloatingActionButton(
//          onPressed: null,
//          tooltip: 'Increment',
//          child: Icon(Icons.add),
//        ),
//        bottomNavigationBar: BottomAppBar(
//          shape: CircularNotchedRectangle(),
//          color: Colors.blueGrey,
//          notchMargin: 2.0,
//          clipBehavior: Clip.antiAlias,
//          child: BottomNavigationBar(
//            items: [
//              BottomNavigationBarItem(
//                  icon: Icon(Icons.cancel), title: Text("Title")),
//              BottomNavigationBarItem(
//                  icon: Icon(Icons.cancel), title: Text("Title")),
//            ],
//          ),
//        ),
//        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//      ),
//    );
//  }
//}

//import 'package:flutter/material.dart';
//
//void main() {
//  runApp(MyApp());
//}
//
//class MyApp extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Flutter Demo',
//      theme: ThemeData(
//        // This is the theme of your application.
//        //
//        // Try running your application with "flutter run". You'll see the
//        // application has a blue toolbar. Then, without quitting the app, try
//        // changing the primarySwatch below to Colors.green and then invoke
//        // "hot reload" (press "r" in the console where you ran "flutter run",
//        // or simply save your changes to "hot reload" in a Flutter IDE).
//        // Notice that the counter didn't reset back to zero; the application
//        // is not restarted.
//        primarySwatch: Colors.blue,
//        // This makes the visual density adapt to the platform that you run
//        // the app on. For desktop platforms, the controls will be smaller and
//        // closer together (more dense) than on mobile platforms.
//        visualDensity: VisualDensity.adaptivePlatformDensity,
//      ),
//      home: MyHomePage(title: 'Flutter Demo Home Page'),
//    );
//  }
//}
//
//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//
//  // This widget is the home page of your application. It is stateful, meaning
//  // that it has a State object (defined below) that contains fields that affect
//  // how it looks.
//
//  // This class is the configuration for the state. It holds the values (in this
//  // case the title) provided by the parent (in this case the App widget) and
//  // used by the build method of the State. Fields in a Widget subclass are
//  // always marked "final".
//
//  final String title;
//
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//  int _counter = 0;
//
//  void _incrementCounter() {
//    setState(() {
//      // This call to setState tells the Flutter framework that something has
//      // changed in this State, which causes it to rerun the build method below
//      // so that the display can reflect the updated values. If we changed
//      // _counter without calling setState(), then the build method would not be
//      // called again, and so nothing would appear to happen.
//      _counter++;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // This method is rerun every time setState is called, for instance as done
//    // by the _incrementCounter method above.
//    //
//    // The Flutter framework has been optimized to make rerunning build methods
//    // fast, so that you can just rebuild anything that needs updating rather
//    // than having to individually change instances of widgets.
//    return Scaffold(
//      appBar: AppBar(
//        // Here we take the value from the MyHomePage object that was created by
//        // the App.build method, and use it to set our appbar title.
//        title: Text(widget.title),
//      ),
//      body: Center(
//        // Center is a layout widget. It takes a single child and positions it
//        // in the middle of the parent.
//        child: Column(
//          // Column is also a layout widget. It takes a list of children and
//          // arranges them vertically. By default, it sizes itself to fit its
//          // children horizontally, and tries to be as tall as its parent.
//          //
//          // Invoke "debug painting" (press "p" in the console, choose the
//          // "Toggle Debug Paint" action from the Flutter Inspector in Android
//          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//          // to see the wireframe for each widget.
//          //
//          // Column has various properties to control how it sizes itself and
//          // how it positions its children. Here we use mainAxisAlignment to
//          // center the children vertically; the main axis here is the vertical
//          // axis because Columns are vertical (the cross axis would be
//          // horizontal).
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Text(
//              'You have pushed the button this many times:',
//            ),
//            Text(
//              '$_counter',
//              style: Theme.of(context).textTheme.headline4,
//            ),
//          ],
//        ),
//      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: _incrementCounter,
//        tooltip: 'Increment',
//        child: Icon(Icons.add),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
//    );
//  }
//}
