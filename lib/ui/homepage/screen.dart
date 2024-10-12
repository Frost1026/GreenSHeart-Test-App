import 'package:flutter/material.dart';
import 'package:greensheart_test/backend/medication/index.dart';
import 'package:greensheart_test/ui/loginpage/index.dart';
import 'package:greensheart_test/ui/medication/card.dart';

class HomeScreen extends StatefulWidget{
    final String screenTitle;

    const HomeScreen({
        super.key, 
        this.screenTitle = 'Default Title',
    });

    @override
    State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    bool _isLoggedIn = false;
    MedicationManager _medicationManager = MedicationManager();

    void _login() {
        setState(() {
            _isLoggedIn = true;
        });
    }

    void _logout() {
        setState(() {
            _isLoggedIn = false;
        });
    }

    @override
    Widget build(BuildContext context) {
        return _isLoggedIn ? _buildMainContent(context) : LoginScreen(screenTitle: 'GreenSHeart Login', loginTitle: 'User Login', onLogin: _login);
    }

    Widget _buildMainContent(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                title: Text(widget.screenTitle),
                actions: [
                    TextButton.icon(
                        onPressed: _logout,
                        icon: const Icon(Icons.logout),
                        label: Text(
                            'Logout',
                            style: TextStyle(
                                // inverse of backgroundColor
                                color: Theme.of(context).colorScheme.primary,
                            ),
                        ),
                    ),
                ],
            ),
            body: GridView.builder(
                padding: const EdgeInsets.all(8.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: (MediaQuery.of(context).size.width / 150).floor(),
                    crossAxisSpacing: MediaQuery.of(context).size.width * 0.02,
                    mainAxisSpacing: MediaQuery.of(context).size.height * 0.02,
                ),
                itemCount: _medicationManager.getMedicationsCount(),
                itemBuilder: (BuildContext context, int index) {
                    return MedicationCard(medication: _medicationManager.getMedication(index),);
                }
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