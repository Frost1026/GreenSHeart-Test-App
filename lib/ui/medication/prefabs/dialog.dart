import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:greensheart_test/backend/medication/manager.dart';
import 'package:greensheart_test/backend/medication/medication.dart';
import 'package:greensheart_test/backend/utils/utility.dart';

class MedicationDialog extends StatefulWidget {
    final String title;
    final Medication? medication;

    const MedicationDialog({
        super.key,
        required this.title,
        this.medication,
    });

    @override
    State<MedicationDialog> createState() => MedicationDialogState();
}

class MedicationDialogState extends State<MedicationDialog> {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController timeController = TextEditingController();
    final TextEditingController dosageController = TextEditingController();
    final TextEditingController prescriberController = TextEditingController();

    TimeOfDay selectedTime = TimeOfDay.now();
    String selectedDosageUnit = MedicationManager().getDosageUnits()[0];

    bool nameEmpty = false;
    bool timeEmpty = false;
    bool dosageEmpty = false;
    bool prescriberEmpty = false;

    @override
    void dispose() {
        nameController.dispose();
        timeController.dispose();
        dosageController.dispose();
        prescriberController.dispose();
        super.dispose();
    }

    // ================================
    // Functional Methods
    // ================================
    void onSubmit() {
        setState(() {
            nameEmpty = false;
            timeEmpty = false;
            dosageEmpty = false;
        });

        if (nameController.text.isEmpty) {
            setState(() {
                nameEmpty = true;
            });
            return;
        }

        if (timeController.text.isEmpty) {
            setState(() {
                timeEmpty = true;
            });
            return;
        }

        if (dosageController.text.isEmpty) {
            setState(() {
                dosageEmpty = true;
            });
            return;
        }

        Navigator.pop(context, 'Done');
    }

    void _selectTime(BuildContext context) async {
        final TimeOfDay? timeOfDay = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
        );

        if (timeOfDay != null) {
            setState(() {
                selectedTime = timeOfDay;
                timeController.text = Utility().formatTimeOfDay(selectedTime);
            });
        }
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
                                controller: nameController,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    errorText: nameEmpty ? 'Please enter a medication name' : null,
                                    labelText: 'Medication Name',
                                ),
                                textInputAction: TextInputAction.next,
                                onSubmitted: (_) => onSubmit(),
                            ),
                        ),  
                        Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: TextField(
                                controller: timeController,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    errorText: timeEmpty ? 'Please enter a medication time' : null,
                                    labelText: 'Medication Time',
                                    suffixIcon: IconButton(
                                        icon: const Icon(Icons.access_time),
                                        onPressed: () => _selectTime(context),
                                    )
                                ),
                                readOnly: true,
                                onTap: () => _selectTime(context),
                            )
                        ),  
                        Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                                children: [
                                    Expanded(
                                        child: TextField(
                                            controller: dosageController,
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                errorText: dosageEmpty ? 'Please enter a medication dosage' : null,
                                                labelText: 'Medication Dosage',
                                            ),
                                            keyboardType: TextInputType.number,
                                            inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                                            textInputAction: TextInputAction.done,
                                            onSubmitted: (_) => onSubmit(),
                                        ),
                                    ),
                                    const SizedBox(width: 8.0),
                                    DropdownButton<String>(
                                        value: selectedDosageUnit,
                                        items: MedicationManager().getDosageUnits().map((String value) {
                                            return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                            );
                                        }).toList(), 
                                        onChanged: (String? value) {
                                            setState(() {
                                                selectedDosageUnit = value!;
                                            });
                                        },
                                    )
                                ],
                            )
                        ),
                        Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: TextField(
                                controller: prescriberController,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Medication Prescriber',
                                ),
                                textInputAction: TextInputAction.next,
                                onSubmitted: (_) => onSubmit(),
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
                    onPressed: onSubmit,
                    child: const Text('Done'),
                ),
            ],
        );
    }
}