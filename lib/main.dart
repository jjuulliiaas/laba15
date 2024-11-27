import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class FunctionCalculator {
  double calculate(double x) {
    return 16 - x + x * x * x;
  }
}

class MyApp extends StatelessWidget {
  final String group = "KN-32";
  final String name = "Julia";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(
        title: '$group: $name\'s last Flutter App',
      ),
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink)),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final FunctionCalculator _calculator = FunctionCalculator();
  final TextEditingController _controller = TextEditingController();
  String _result = '';

  void _calculate() {
    final input = double.tryParse(_controller.text);
    if (input != null) {
      setState(() {
        _result = 'y = ${_calculator.calculate(input).toStringAsFixed(2)}';
      });
    } else {
      setState(() {
        _result = 'Invalid input';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(widget.title, style: TextStyle(fontWeight: FontWeight.w900, color: Colors.white, fontSize: 17),),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(45.0),
                ),
                labelText: 'Enter x',
                labelStyle: TextStyle(
                  fontSize: 12
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _calculate,
              child: Text('Calculate y'),
            ),
            SizedBox(height: 16),
            Text(
              _result,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.mouse),
      ),
    );
  }
}
