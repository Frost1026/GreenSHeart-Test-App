import 'package:flutter/material.dart';
import 'package:greensheart_test/backend/medication/medication.dart';
import 'package:greensheart_test/ui/medication/edit.dart';

class MedicationCard extends StatefulWidget {
    final Medication medication;

    MedicationCard({required this.medication});
    
    @override
    State<StatefulWidget> createState() => _MedicationCardState();
}

class _MedicationCardState extends State<MedicationCard> {
    // ================================
    // Functional Methods
    // ================================
    void _onCardPressed(BuildContext context) {
        showDialog(
            context: context, 
            builder: (context) => EditMedicationForm(medication: widget.medication),
        );
    }

    @override
    Widget build(BuildContext context) {
        return ElevatedButton(
            onPressed: () => _onCardPressed(context),
            style: ButtonStyle(
                shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
                ),
            ),
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    children: [
                        Expanded(
                            flex: 1,
                            child: Text(
                                widget.medication.name,
                                style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold
                                ),
                                overflow: TextOverflow.fade,
                                softWrap: false,
                            )
                        ),
                        Expanded(
                            flex: 1,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                            const Text(
                                                'Dose: ',
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.bold
                                                ),
                                            ),
                                            Text(
                                                widget.medication.dosage,
                                                style: const TextStyle(
                                                    fontSize: 16.0
                                                ),
                                            ),
                                        ],
                                    ),
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                            const Text(
                                                'Time: ',
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.bold
                                                ),
                                            ),
                                            Text(
                                                widget.medication.time,
                                                style: const TextStyle(
                                                    fontSize: 16.0
                                                ),
                                            ),
                                        ],
                                    )
                                ],
                            ),
                        ),
                    ],
                ),
            ),
        );
    }
}