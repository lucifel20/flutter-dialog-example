import 'package:flutter/material.dart';

void main() => runApp(DialogExample());

class DialogExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
    const String APP_TITLE = 'Flutter Dialog Example';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: APP_TITLE,
      home: HomeRoute(),
    ); // MaterialApp()
  }
}

class HomeRoute extends StatefulWidget {
  @override
  _HomeRoute createState() => _HomeRoute();
}

class _HomeRoute extends State<HomeRoute> {
  //
  String _text = 'Answer : ?';

  Future<void> _alertDialogBtnPressed() async {
    await showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert Dialog'),
          content: Text('Alert Dialog'),
          actions: <Widget>[
            RaisedButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ), // RaisedButton()
          ], // List<Widget>[]
        ); // AlertDialog()
      },
    ); // showDialog()
  }

  Future<void> _simpleDialogBtnPressed() async {
    switch (await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('Simple Dialog'),
          children: <Widget>[
            SimpleDialogOption(
              child: Text('A'),
              onPressed: () {
                Navigator.pop(context, 'A');
              },
            ), // SimpleDialogOption()
            SimpleDialogOption(
              child: Text('B'),
              onPressed: () {
                Navigator.pop(context, 'B');
              },
            ), // SimpleDialogOption()
          ], // List<Widget>[]
        ); // SimpleDialog()
      },
    )) {
      case 'A':
        setState(() => _text = 'Answer : A');
        break;
      case 'B':
        setState(() => _text = 'Answer : B');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text('Alert Dialog'),
                color: Colors.brown,
                textColor: Colors.white,
                onPressed: _alertDialogBtnPressed,
              ), // RaisedButton()
              RaisedButton(
                child: Text('Simple Dialog'),
                color: Colors.indigo,
                textColor: Colors.white,
                onPressed: _simpleDialogBtnPressed,
              ), // RaisedButton()
              Text(_text),
            ], // List<Widget>[]
          ), // Column()
        ), // Center()
      ), // SafeArea()
    ); // Scaffold()
  }
}
