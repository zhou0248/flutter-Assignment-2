import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
                key: _formKey,
                child: Column(children: [
                  Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Text('Contact Us',
                          style: Theme.of(context).textTheme.titleLarge)),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'First Name',
                          hintText: 'First Name',
                          border: OutlineInputBorder()),
                    ),
                  )
                ]))));
  }
}
