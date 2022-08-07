import 'package:flutter/material.dart';

class ListViewBasicView extends StatelessWidget {
  final options = ['Option 1', 'Option 2', 'Option 3', 'Option 4', 'Option 5'];

  ListViewBasicView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Basic'),
      ),
      body: ListView(
        children: options
            .map((option) => ListTile(
                  title: Text(option),
                  leading: const Icon(Icons.person_outlined),
                  trailing: const Icon(Icons.arrow_forward_ios_outlined),
                ))
            .toList(),
      ),
    );
  }
}
