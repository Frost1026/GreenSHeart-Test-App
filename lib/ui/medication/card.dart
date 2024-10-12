import 'package:flutter/material.dart';
import 'package:greensheart_test/backend/medication/medication.dart';

class MedicationCard extends StatefulWidget {
    final Medication medication;

    MedicationCard({required this.medication});
    
    @override
    State<StatefulWidget> createState() => _MedicationCardState();
}

class _MedicationCardState extends State<MedicationCard> {
    @override
    Widget build(BuildContext context) {
        return Card(
            child: Column(
                children: [
                    Text(widget.medication.name),
                    Text(widget.medication.dosage),
                ],
            ),
        );
    }
}