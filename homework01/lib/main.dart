import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Homework1',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: MyHomePage(title: 'PV239 Homework 1'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Container _buildContainer({required Color color, required String text}) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(color: color),
      child: Center(
        child: Text(text, style: TextStyle(fontSize: 30)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildContainer(text: "1", color: Colors.redAccent),
              _buildContainer(text: "2", color: Colors.lightBlueAccent),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildContainer(text: "3", color: Colors.lightBlueAccent),
              _buildContainer(text: "4", color: Colors.redAccent),
            ],
          )
        ],
      ),
    );
  }
}
