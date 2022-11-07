// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import './widgets/transcation_list.dart';
import './widgets/new_transcation.dart';
import './models/transcation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Color.fromARGB(255, 255, 45, 45) ,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transcation> _userTranscations = [
    Transcation(
      id: 'T1',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transcation(
      id: 'T2',
      title: 'New Shirt',
      amount: 19.99,
      date: DateTime.now(),
    ),
  ];
  void _addNewTranscation(String txTitle, double txAmount) {
    final newTx = Transcation(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: DateTime.now());
    setState(() {
      _userTranscations.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (bCtx) {
        return GestureDetector(
          onTap: (() {}),
          behavior: HitTestBehavior.opaque,
          child: NewTranscation(_addNewTranscation),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 94, 228, 255),
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () => _startAddNewTransaction(context),
            icon: Icon(Icons.add),
          ),
        ],
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('𝔼𝕩𝕡𝕖𝕟𝕤𝕖 𝕞𝕖𝕥𝕖𝕣'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 50,
              width: double.infinity,
              child: Card(
                elevation: 15,
                color: Color.fromARGB(255, 77, 255, 151),
                child: Center(
                  child: Text('CHART 1'),
                ),
              ),
            ),
            TranscationList(_userTranscations),
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
