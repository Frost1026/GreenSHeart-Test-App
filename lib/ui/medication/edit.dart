import 'package:flutter/material.dart';
import 'package:greensheart_test/backend/medication/manager.dart';
import 'package:greensheart_test/backend/medication/medication.dart';

class EditMedicationForm extends StatefulWidget {
    final Medication medication;

    const EditMedicationForm({
        super.key, 
        required this.medication
    });

    @override
    State<StatefulWidget> createState() => _EditMedicationFormState();
}

class _EditMedicationFormState extends State<EditMedicationForm> {
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _timeController = TextEditingController();
    final TextEditingController _dosageController = TextEditingController();

    // initialization call after the widget has been allocated memory
    @override
    void initState() {
        super.initState();
        _nameController.text = widget.medication.name;
        _timeController.text = widget.medication.time;
        _dosageController.text = widget.medication.dosage;
    }

    @override
    void dispose() {
        _nameController.dispose();
        _timeController.dispose();
        _dosageController.dispose();
        super.dispose();
    }

    // ================================
    // Functional Methods
    // ================================
    void _updateMedication() {
        MedicationManager().updateMedication(
            widget.medication.id,
            _nameController.text,
            _timeController.text,
            _dosageController.text
        );
    }

    @override
    Widget build(BuildContext context) {
        return AlertDialog(
            title: const Text('Edit Medication'),
            content: SingleChildScrollView(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: TextField(
                                controller: _nameController,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Medication Name',
                                ),
                                textInputAction: TextInputAction.next,
                                onSubmitted: (_) {
                                    _updateMedication();
                                    Navigator.pop(context, 'OK');
                                },
                            ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: TextField(
                                controller: _timeController,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Time',
                                ),
                                textInputAction: TextInputAction.next,
                                onSubmitted: (_) {
                                    _updateMedication();
                                    Navigator.pop(context, 'OK');
                                },
                            ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: TextField(
                                controller: _dosageController,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Dosage',
                                ),
                                textInputAction: TextInputAction.done,
                                onSubmitted: (_) {
                                    _updateMedication();
                                    Navigator.pop(context, 'OK');
                                },
                            )
                        ),
                    ],
                ),
            ),
            actions: <Widget>[
                TextButton(
                    // Return to the previous screen and pass 'Cancel' as the result
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Cancel')
                ),
                TextButton(
                    // Return to the previous screen and pass 'OK' as the result
                    onPressed: () {
                        _updateMedication();
                        Navigator.pop(context, 'OK');
                    }, 
                    child: const Text('OK')
                ),
            ],
        );
    }

    // ================================
    // Getters and setters
    // ================================
}
    