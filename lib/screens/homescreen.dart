import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/images/makeup.jpg'),
                fit: BoxFit.cover,
              )),
            ),
          ),
          Expanded(
            child: Container(
                color: Theme.of(context).colorScheme.secondary,
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      'Transform.flip(flipY: false)',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Transform.flip(
                      flipY: true,
                      child: Text(
                        'Transform.flip(flipY: true)',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      'Transform.flip(flipX: false)',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Transform.flip(
                      flipX: true,
                      child: Text(
                        'Transform.flip(flipX: true)',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ),
                ])),
          ),
        ],
      ),
    ));
  }
}
