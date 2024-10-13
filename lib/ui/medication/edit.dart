import 'package:flutter/material.dart';
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
                                controller: TextEditingController(text: widget.medication.name),
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Medication Name',
                                ),
                            ),
                        ),
                    ],
                ),
            ),
            actions: <Widget>[
                TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'), 
                    child: const Text('Cancel')
                ),
                TextButton(
                    onPressed: () => Navigator.pop(context, 'OK'), 
                    child: const Text('OK')
                ),
            ],
        );
    }
}
    