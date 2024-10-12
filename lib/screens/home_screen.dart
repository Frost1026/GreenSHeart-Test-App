import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
    final String appTitle;

    const HomeScreen({
        super.key, required this.appTitle
    });

    @override
    State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                title: Text(widget.appTitle),
            ),
            body: Center(
                
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: () {},
                tooltip: 'New Medication',
                shape: const CircleBorder(),
                backgroundColor: Colors.green,
                child: const Icon(
                    Icons.add,
                    color: Colors.white,
                ),
            ),
        );
    }
}