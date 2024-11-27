import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

//TODO: onSave function + validation function for each TextformField
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
                      padding: const EdgeInsets.symmetric(vertical: 40),
                      child: Text('Contact Us',
                          style: Theme.of(context).textTheme.titleLarge)),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      autofocus: true,
                      decoration: const InputDecoration(
                          labelText: 'First Name',
                          hintText: 'John',
                          icon: Icon(Icons.person),
                          border: OutlineInputBorder()),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Last Name',
                          hintText: 'Smith',
                          icon: Icon(Icons.person),
                          border: OutlineInputBorder()),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Email',
                          hintText: 'abc123@mail.com',
                          icon: Icon(Icons.email),
                          border: OutlineInputBorder()),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Message',
                          hintText: 'Message',
                          icon: Icon(Icons.message),
                          border: OutlineInputBorder()),
                    ),
                  ),
                ]))));
  }
}
