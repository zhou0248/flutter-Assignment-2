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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text('Contact Us',
                          style: Theme.of(context).textTheme.titleLarge)),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      autofocus: true,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                          labelText: 'First and Last Name',
                          hintText: 'John Smith',
                          icon: Icon(Icons.person),
                          border: OutlineInputBorder()),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                          labelText: 'Email',
                          hintText: 'abc123@mymail.com',
                          icon: Icon(Icons.email),
                          border: OutlineInputBorder()),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.done,
                      minLines: 2,
                      maxLines: 4,
                      decoration: const InputDecoration(
                          labelText: 'Message',
                          hintText: 'Enter your Message here',
                          icon: Icon(Icons.message),
                          border: OutlineInputBorder()),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: OutlinedButton(
                      onPressed: () {
                        const AlertDialog(
                          title: Text("Message Sent!"),
                          content: Text("Thank you for contacting us!"),
                        );
                      },
                      child: Text('Send Message',
                          style: Theme.of(context).textTheme.titleSmall),
                      style: OutlinedButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        padding: const EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22)),
                        side: BorderSide(
                            width: 2,
                            color: Theme.of(context).colorScheme.primary),
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
