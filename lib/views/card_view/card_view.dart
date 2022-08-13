import 'package:flutter/material.dart';

import 'package:components_app/views/card_view/widgets/custom_card_type_1.dart';
import 'package:components_app/views/card_view/widgets/custom_card_type_2.dart';

class CardView extends StatelessWidget {
  const CardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Card')),
      body: ListView(
        padding: const EdgeInsets.only(top: 8, right: 8, left: 8, bottom: 32),
        children: const [
          CustomCardType1(),
          SizedBox(height: 16),
          CustomCardType2(
            imageUrl:
                'https://images.unsplash.com/photo-1660308985375-bf5984ff786e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2400&h=1697&q=80',
            text: 'A beautiful night',
          ),
          SizedBox(height: 16),
          CustomCardType2(
            imageUrl:
                'https://images.unsplash.com/photo-1657299170950-9da95993c9ad?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
          )
        ],
      ),
    );
  }
}
