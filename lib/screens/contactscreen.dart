import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();

  String? name;
  String? email;
  String? message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  //Form Title
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text('Contact Us',
                          style: Theme.of(context).textTheme.titleLarge)),
                  //Name Input Field
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      autofocus: true,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      onSaved: (value) {
                        name = value;
                      },
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length < 2) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          labelText: 'First and Last Name',
                          hintText: 'John Smith',
                          icon: Icon(Icons.person),
                          border: OutlineInputBorder()),
                    ),
                  ),
                  //Email Input Field
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      onSaved: (value) {
                        email = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        } else if (!value.contains('@') ||
                            !value.contains('.')) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          labelText: 'Email',
                          hintText: 'abc123@mymail.com',
                          icon: Icon(Icons.email),
                          border: OutlineInputBorder()),
                    ),
                  ),
                  //Message Input Field
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.done,
                      onSaved: (value) {
                        message = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your message';
                        } else if (value.length < 10) {
                          return 'Message should be longer than 10 characters';
                        }
                        return null;
                      },
                      minLines: 2,
                      maxLines: 4,
                      decoration: const InputDecoration(
                          labelText: 'Message',
                          hintText: 'Enter your Message here',
                          icon: Icon(Icons.message),
                          border: OutlineInputBorder()),
                    ),
                  ),
                  //Submit Button
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text("Message Sent!",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium),
                                    content: Text(
                                        "Thank you very much for contacting us! 😊 \nWe will get back to you as soon as possible.",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium),
                                  ));
                        }
                      },
                      child: Text('Send Message',
                          style: Theme.of(context).textTheme.titleSmall),
                      style: OutlinedButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        padding: const EdgeInsets.all(10),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
