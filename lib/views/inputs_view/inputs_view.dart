import 'package:flutter/material.dart';

import 'package:components_app/views/inputs_view/widgets/custom_input_field.dart';

class InputsView extends StatelessWidget {
  const InputsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inputs and Forms'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            children: const [
              CustomInputField(
                labelText: 'Name',
                hintText: 'Name',
                helperText: 'Only words',
                counterText: 'Max 20 characters',
                icon: Icons.group_outlined,
                prefixIcon: Icons.person,
                sufixIcon: Icons.people_alt_outlined,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
