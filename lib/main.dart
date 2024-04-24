import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(ColorGameApp());
}

class ColorGameApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Game',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[300], // Gray background color
        appBarTheme: AppBarTheme(backgroundColor: Colors.black), // Black app bar color
        primarySwatch: Colors.blue,
      ),
      home: ColorGameScreen(),
    );
  }
}

class ColorGameScreen extends StatefulWidget {
  @override
  _ColorGameScreenState createState() => _ColorGameScreenState();
}

class _ColorGameScreenState extends State<ColorGameScreen> {
  final List<Color> _colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.pink,
    Colors.teal,
    Colors.cyan,
    Colors.amber,
    Colors.indigo,
    Colors.brown,
    Colors.grey,
    Colors.lime,
    Colors.deepOrange,
    Colors.lightBlue,
    Colors.deepPurple,
    Colors.lightGreen,
    Colors.black,
    Colors.white,
    Colors.lightBlueAccent,
    Colors.purpleAccent,
    Colors.greenAccent,
    Colors.pinkAccent,
    Colors.yellowAccent,
    Colors.redAccent,
    Colors.orangeAccent,
    Colors.blueAccent,
    Colors.tealAccent,
    Colors.cyanAccent,
    Colors.amberAccent,
    Colors.deepPurpleAccent,
    Colors.lightGreenAccent,
  ];
  final List<String> _colorNames = [
    'Red',
    'Green',
    'Blue',
    'Yellow',
    'Orange',
    'Purple',
    'Pink',
    'Teal',
    'Cyan',
    'Amber',
    'Indigo',
    'Brown',
    'Grey',
    'Lime',
    'Deep Orange',
    'Light Blue',
    'Deep Purple',
    'Light Green',
    'Black',
    'White',
    'Light Blue Accent',
    'Purple Accent',
    'Green Accent',
    'Pink Accent',
    'Yellow Accent',
    'Red Accent',
    'Orange Accent',
    'Blue Accent',
    'Teal Accent',
    'Cyan Accent',
    'Amber Accent',
    'Deep Purple Accent',
    'Light Green Accent',
  ];
  Color _currentColor = Colors.black;
  String _currentColorName = '';
  int _score = 0;

  @override
  void initState() {
    super.initState();
    _generateNewColor();
  }

  void _generateNewColor() {
    final Random _random = Random();
    int index = _random.nextInt(_colors.length);
    setState(() {
      _currentColor = _colors[index];
      _currentColorName = _colorNames[index];
    });
  }

  void _checkAnswer(Color color) {
    if (color == _currentColor) {
      setState(() {
        _score++;
      });
      _generateNewColor();
    } else {
      // Game Over
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Game Over'),
            content: Text('Your score: $_score'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    _score = 0;
                  });
                  _generateNewColor();
                },
                child: Text('Play Again'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learn Colors', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Tap the color:',
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'Roboto', // Example of using a custom font family
                fontWeight: FontWeight.bold, // Bold text
                fontStyle: FontStyle.italic, // Italic text
                color: Colors.black87, // Text color
              ),
            ),
            SizedBox(height: 20),
            Text(
              _currentColorName,
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: _currentColor,
              ),
            ),
            SizedBox(height: 20),
            Wrap(
              alignment: WrapAlignment.center,
              children: _colors
                  .map(
                    (color) => GestureDetector(
                      onTap: () => _checkAnswer(color),
                      child: Container(
                        width: 50,
                        height: 50,
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            SizedBox(height: 20),
            Text(
              'Score: $_score',
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}