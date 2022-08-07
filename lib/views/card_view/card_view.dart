import 'package:flutter/material.dart';

import 'widgets/custom_card_type_1.dart';

class CardView extends StatelessWidget {
  const CardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Card')),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: const [CustomCardType1()],
      ),
    );
  }
}
