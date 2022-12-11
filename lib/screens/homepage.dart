import 'package:flutter/material.dart';
import 'package:evryday/widgets/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  final String title = "Counter 7";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_counter % 2 == 0) ...[
              const Text(
                "GENAP",
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ] else ...[
              const Text(
                "GANJIL",
                style: TextStyle(
                  color: Colors.blue,
                ),
              )
            ],
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (_counter > 0)
              FloatingActionButton(
                onPressed: _decrementCounter,
                tooltip: 'Decrement',
                child: const Icon(Icons.remove),
              ),
            Expanded(child: Container()),
            FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
      drawer: const DrawerComponents(currentPage: "homepage"),
    );
  }
}
