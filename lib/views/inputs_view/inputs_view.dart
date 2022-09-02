import 'package:flutter/material.dart';

import 'package:components_app/views/inputs_view/widgets/custom_input_field.dart';

class InputsView extends StatelessWidget {
  const InputsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    final Map<String, String> formValues = {
      'name': 'Eren',
      'lastname': 'Jaeger',
      'email': 'eren.jaeger@mail.com',
      'password': 'pass123',
      'role': 'client',
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inputs and Forms'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                CustomInputField(
                  labelText: 'Name',
                  hintText: 'Name',
                  helperText: 'Only words',
                  counterText: 'Max 20 characters',
                  icon: Icons.group_outlined,
                  prefixIcon: Icons.person,
                  sufixIcon: Icons.people_alt_outlined,
                  formValues: formValues,
                  formProperty: 'name',
                ),
                const SizedBox(height: 32),
                CustomInputField(
                  labelText: 'Lastname',
                  hintText: 'Lastname',
                  helperText: 'Only words',
                  counterText: 'Max 20 characters',
                  icon: Icons.group_outlined,
                  prefixIcon: Icons.person,
                  sufixIcon: Icons.people_alt_outlined,
                  formValues: formValues,
                  formProperty: 'lastname',
                ),
                const SizedBox(height: 32),
                CustomInputField(
                  labelText: 'Email',
                  hintText: 'Email',
                  helperText: 'Only words',
                  counterText: 'Max 20 characters',
                  icon: Icons.email_outlined,
                  prefixIcon: Icons.mark_email_unread_outlined,
                  sufixIcon: Icons.mark_email_read_outlined,
                  keyboardType: TextInputType.emailAddress,
                  formValues: formValues,
                  formProperty: 'email',
                ),
                const SizedBox(height: 32),
                CustomInputField(
                  labelText: 'Password',
                  hintText: 'Password',
                  counterText: 'Max 20 characters',
                  icon: Icons.password_outlined,
                  prefixIcon: Icons.wifi_password_outlined,
                  sufixIcon: Icons.security_outlined,
                  obscureText: true,
                  formValues: formValues,
                  formProperty: 'password',
                ),
                const SizedBox(height: 32),
                DropdownButtonFormField<String>(
                    items: const [
                      DropdownMenuItem(
                        value: 'client',
                        child: Text('Client'),
                      ),
                      DropdownMenuItem(
                        value: 'seller',
                        child: Text('Seller'),
                      ),
                      DropdownMenuItem(
                        value: 'admin',
                        child: Text('Admin'),
                      ),
                    ],
                    onChanged: (value) {
                      formValues['role'] = value ?? 'client';
                    }),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    if (!formKey.currentState!.validate()) return;
                    debugPrint(formValues.toString());
                  },
                  child: const SizedBox(
                    width: double.infinity,
                    child: Center(
                      child: Text('Save'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
