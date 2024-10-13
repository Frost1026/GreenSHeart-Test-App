import 'package:flutter/material.dart';
import 'package:greensheart_test/backend/medication/manager.dart';
import 'package:greensheart_test/ui/medication/card.dart';

class MedicationCardGrid extends StatelessWidget {
    const MedicationCardGrid({super.key});

    @override
    Widget build(BuildContext context) {
        return ListenableBuilder(
            listenable: MedicationManager(), 
            builder: (BuildContext context, Widget? child) => GridView.builder(
                padding: const EdgeInsets.all(8.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: (MediaQuery.of(context).size.width / 300).floor(),
                    crossAxisSpacing: MediaQuery.of(context).size.width * 0.02,
                    mainAxisSpacing: MediaQuery.of(context).size.height * 0.02,
                    childAspectRatio: 3
                ),
                itemCount: MedicationManager().medicationCount,
                itemBuilder: (BuildContext context, int index) {
                    return MedicationCard(medication: MedicationManager().getMedication(index),);
                }
            ),
        );
    }
}