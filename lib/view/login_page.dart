import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            "Login",
            style: TextStyle(fontSize: 24),
          ),
          _form(),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: MaterialButton(
              onPressed: _onSubmit,
              color: Colors.blue,
              child: const Text("Submit"),
            ),
          ),
        ]),
      ),
    );
  }

  Widget _form() => Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Form(
          key: _key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(labelText: "Email"),
                onSaved: (value) {},
                validator: (value) {
                  return value!.isEmpty ? "* This field is required" : null;
                },
              ),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: "Password"),
                onSaved: (value) {},
                validator: (value) {
                  return value!.isEmpty ? "* This field is required" : null;
                },
              ),
            ],
          ),
        ),
      );
  void _onSubmit() {
    var form = _key.currentState!;
    if (form.validate()) {
      form.save();
    }
    print(emailController.text);
    print(passwordController.text);
  }
}
