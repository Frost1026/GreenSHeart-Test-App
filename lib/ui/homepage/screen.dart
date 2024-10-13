import 'package:flutter/material.dart';
import 'package:greensheart_test/ui/loginpage/index.dart';
import 'package:greensheart_test/ui/medication/card_grid.dart';
import 'package:greensheart_test/ui/medication/index.dart';
import 'package:greensheart_test/ui/medication/search_bar.dart';

class HomeScreen extends StatefulWidget {
    final String screenTitle;

    const HomeScreen({
        super.key, 
        this.screenTitle = 'Default Title',
    });

    @override
    State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    Widget _medicationSearchBar = MedicationSearchBar();
    Widget _medicationCardGrid = MedicationCardGrid();

    bool _isLoggedIn = false;

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

    void _addMedication(BuildContext context) {
        showDialog(
            context: context, 
            builder: (context) => AddMedicationForm(),
        );
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
                        icon: const Icon(Icons.logout, 
                            color: Colors.red
                        ),
                        label: Text(
                            'Logout',
                            style: TextStyle(
                                // inverse of backgroundColor
                                color: Colors.red,
                            ),
                        ),
                    ),
                ],
            ),
            backgroundColor: Theme.of(context).colorScheme.surface,
            body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SizedBox(
                            width: 300,
                            // child: TextField(
                            //     decoration: InputDecoration(
                            //         labelText: 'Search Medication',
                            //         border: OutlineInputBorder(),
                            //     ),
                            // ),
                            child: _medicationSearchBar,
                        ),
                    ),
                    Expanded(child: _medicationCardGrid),
                ],
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: () => _addMedication(context),
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