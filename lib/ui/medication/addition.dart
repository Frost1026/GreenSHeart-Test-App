import 'package:flutter/material.dart';
import 'package:greensheart_test/backend/medication/manager.dart';

class AddMedicationForm extends StatefulWidget {
    const AddMedicationForm({super.key,});

    @override
    State<AddMedicationForm> createState() => _AddMedicationFormState();
}

class _AddMedicationFormState extends State<AddMedicationForm> {
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _timeController = TextEditingController();
    final TextEditingController _dosageController = TextEditingController();

    // ================================
    // Functional Methods
    // ================================
    void _addNewMedication() {
        MedicationManager().addMedication(
            _nameController.text,
            _timeController.text,
            _dosageController.text,
        );
        Navigator.pop(context, 'Done');
    }

    @override
    Widget build(BuildContext context) {
        return AlertDialog(
            // set width and heigh of the dialog
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
            ),
            title: Text('Add Medication'),
            content: SingleChildScrollView(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: TextField(
                                controller: _nameController,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    errorText: null,
                                    labelText: 'Medication Name',
                                ),
                                textInputAction: TextInputAction.next,
                                onSubmitted: (_) => _addNewMedication(),
                            ),
                        ),  
                        Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: TextField(
                                controller: _timeController,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    errorText: null,
                                    labelText: 'Medication Time',
                                ),
                                textInputAction: TextInputAction.next,
                                onSubmitted: (_) => _addNewMedication(),
                            ),
                        ),  
                        Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: TextField(
                                controller: _dosageController,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    errorText: null,
                                    labelText: 'Medication Dosage',
                                ),
                                textInputAction: TextInputAction.done,
                                onSubmitted: (_) => _addNewMedication(),
                            ),
                        ),
                    ],
                ),
            ),
            actions: <Widget>[
                TextButton(
                    onPressed: () {
                        Navigator.pop(context, 'Cancel');
                    },
                    child: const Text('Cancel'),
                ),
                TextButton(
                    onPressed: () {
                        _addNewMedication();
                        Navigator.pop(context, 'Done');
                    },
                    child: const Text('Add'),
                ),
            ],
        );
    }
}