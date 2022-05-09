import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
          child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/counter');
              },
              child: const Text('go to counter page'))),
    );
  }
}
