import 'package:flutter/material.dart';
import './transaction.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 69.99, date: DateTime.now()),
    Transaction(
        id: 't2',
        title: 'Weekly Groceries',
        amount: 16.53,
        date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter App!'),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            // width: double.infinity,
            child: const Card(
              child: Text('CHART!'),
              elevation: 5,
              color: Colors.blue,
            ),
          ),
          Card(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                  ),
                  const TextField(
                      decoration: InputDecoration(labelText: 'Amount')),
                  TextButton(
                      onPressed: () {},
                      child: const Text('Add Transaction'),
                      style: TextButton.styleFrom(primary: Colors.purple))
                ],
              ),
            ),
          ),
          Column(
            children: transactions.map((tx) {
              return Card(
                  child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.purple, width: 2)),
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      '\$${tx.amount}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tx.title,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(DateFormat.yMMMMd().format(tx.date),
                          style: const TextStyle(color: Colors.grey))
                    ],
                  )
                ],
              ));
            }).toList(),
          ),
        ],
      ),
    );
  }
}
