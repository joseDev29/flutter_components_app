import 'package:flutter/material.dart';

class ListViewSeparatedView extends StatelessWidget {
  final options = ['Option 1', 'Option 2', 'Option 3', 'Option 4', 'Option 5'];

  ListViewSeparatedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listview Separated'),
        // backgroundColor: Colors.pinkAccent.shade400,
        // elevation: 0,
      ),
      //Con ListView.separated los elementos se renderizan bajo demanda
      body: ListView.separated(
        itemCount: options.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(options[index]),
          leading: const Icon(Icons.person_outlined),
          trailing: const Icon(Icons.arrow_forward_ios_outlined),
          onTap: () {
            final option = options[index];
            debugPrint('Tapped option: $option');
          },
        ),
        separatorBuilder: (context, index) => const Divider(),
      ),
    );
  }
}
