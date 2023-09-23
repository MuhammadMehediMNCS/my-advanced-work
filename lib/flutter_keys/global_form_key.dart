import 'package:flutter/material.dart';
import 'package:some_advanced/flutter_navigation_and_route/custom_button.dart';

class UseValidation extends StatelessWidget {
  const UseValidation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FormValidation(),
    );
  }
}

class FormValidation extends StatefulWidget {
  const FormValidation({Key? key}) : super(key: key);

  @override
  State<FormValidation> createState() => _FormValidationState();
}

class _FormValidationState extends State<FormValidation> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  String email = '';
  String username = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Global Key'),
        centerTitle: true,
      ),
      body: buildLogin(),
    );
  }
  Widget buildLogin() => Form(
    key: formKey,
    child: ListView(
      padding: const EdgeInsets.all(24),
      children: [
        TextFormField(
          controller: emailController,
          decoration: const InputDecoration(
            labelText: 'Email',
            border: OutlineInputBorder()
          ),
          validator: (value) => value != null && !value.contains('@')
            ? 'Not a Valid Email' : null,
          onSaved: (value) => email = value!,
        ),
        const SizedBox(height: 24),
        TextFormField(
          controller: nameController,
          decoration: const InputDecoration(
            labelText: 'Username',
            border: OutlineInputBorder()
          ),
          validator: (value) => value != null && value.isEmpty ? 'Enter a Name' : null,
        ),
        const SizedBox(height: 24),
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Password',
            border: OutlineInputBorder()
          ),
        ),
        const SizedBox(height: 24),
        ButtonWidget(
          text: 'Submit',
          onClicked: submit
        )
      ],
    ),
  );

  void submit() {
    final form = formKey.currentState!;

    if(form.validate()) {
      form.save();
      
      print('Form valid: $email');
    }
  }
}