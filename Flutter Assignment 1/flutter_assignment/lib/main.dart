import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('First Assignemnt'),
        ),
        body: const TextOutput(),
      ),
    );
  }
}

class TextOutput extends StatefulWidget {
  const TextOutput({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TextControl();
  }
}

class _TextControl extends State<TextOutput> {
  String _title = 'Darko First Test';

  changeText() {
    setState(() {
      _title = 'It got changed BOY';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: ElevatedButton(
              onPressed: changeText,
              child: const Text('Text of my choise changed dammit')),
        ),
        TextOutPut(_title)
      ],
    );
  }
}

class TextOutPut extends StatelessWidget {
  final String text;

  const TextOutPut(this.text);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(text));
  }
}
