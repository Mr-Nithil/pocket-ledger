import 'package:flutter/material.dart';

void main() {
  runApp(const PocketLedgerApp());
}

class PocketLedgerApp extends StatelessWidget {
  const PocketLedgerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pocket Ledger',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(title: Text('Pocket Ledger')),
        body: Center(child: Text('Welcome to Pocket Ledger!')),
      ),
    );
  }
}
