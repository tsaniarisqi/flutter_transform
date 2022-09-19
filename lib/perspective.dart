import 'package:flutter/material.dart';

class PerspectiveHomePage extends StatefulWidget {
  const PerspectiveHomePage({Key? key}) : super(key: key);

  @override
  _PerspectiveHomePage createState() => _PerspectiveHomePage();
}

class _PerspectiveHomePage extends State<PerspectiveHomePage> {
  int _counter = 0;
  final Offset _offset = const Offset(0.4, 0.7);

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Transform(
      // Transform widget
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001) // perspective
        ..rotateX(_offset.dy)
        ..rotateY(_offset.dx),
      alignment: FractionalOffset.center,
      child: _defaultApp(context),
    );
  }

  _defaultApp(BuildContext context) {
    // new
    return Scaffold(
      appBar: AppBar(
        title: const Text('The Matrix 3D'), // changed
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
