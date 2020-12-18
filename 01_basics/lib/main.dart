import 'package:flutter/material.dart';

void main() {
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigoAccent,
        appBar: AppBar(
          title: Text("First stateless app"),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  Text("Tap \"+\" to increment",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      )),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(6),
                    ),
                    width: 128,
                    height: 48,
                    margin: EdgeInsets.all(8),
                    child: CounterWidget(),
                  ),
                  Text("Tap \"-\" to decrement",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      )),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              )),
        ),
      ),
    );
  }
}

// Statfull
class CounterWidget extends StatefulWidget {
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter;

  @override
  void initState() {
    _counter = 50;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: () {
            _updateCounter(-1);
          },
        ),
        Expanded(
            child: Center(
                child: Text("$_counter", style: TextStyle(fontSize: 24)))),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            _updateCounter(1);
          },
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }

  void _updateCounter(int diff) {
    setState(() => _counter += diff);
  }
}
