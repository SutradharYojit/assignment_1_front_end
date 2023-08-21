import 'package:assignment_1/resources/resources.dart';
import 'package:assignment_1/router/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(StringManager.appTitle),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                StringManager.headline,
                style: TextStyle(fontSize: 25),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: ElevatedButton(
                  onPressed: () {
                    context.push(RoutesName.aboutScreen);
                  },
                  child: const Text(StringManager.homeBtn_1),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  context.push(RoutesName.apiScreen);
                },
                child: const Text(StringManager.homeBtn_2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
