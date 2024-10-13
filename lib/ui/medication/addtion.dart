import 'package:flutter/material.dart';
import 'package:greensheart_test/backend/medication/index.dart';

class AddMedicationForm extends StatefulWidget {
    final MedicationManager medicationManager;

    const AddMedicationForm({
        super.key,
        required this.medicationManager,
    });

    @override
    State<AddMedicationForm> createState() => _AddMedicationFormState();
}

class _AddMedicationFormState extends State<AddMedicationForm> {
    final _nameController = TextEditingController();
    final _timeController = TextEditingController();
    final _dosageController = TextEditingController();

    @override
    Widget build(BuildContext context) {
        return AlertDialog(
            title: Text('Add Medication'),
            content: Center(
                child: Container(
                    constraints: BoxConstraints(maxWidth: 300, maxHeight: 300),
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                        children: [
                            TextField(
                                controller: _nameController,
                                decoration: InputDecoration(
                                    labelText: 'Name'   
                                ),
                            ),
                            TextField(
                                controller: _timeController,
                                decoration: InputDecoration(
                                    labelText: 'Time'
                                ),
                            ),
                            TextField(
                                controller: _dosageController,
                                decoration: InputDecoration(
                                    labelText: 'Dosage'
                                ),
                            ),
                        ],
                    ),
                ),
            ),
            actions: [
                TextButton(
                    onPressed: () {
                        Navigator.pop(context);
                    },
                    child: Text('Cancel')
                ),
                TextButton(
                    onPressed: () {
                        Navigator.pop(context);
                    },
                    child: Text('Add')
                ),
            ],
        );
    }
}