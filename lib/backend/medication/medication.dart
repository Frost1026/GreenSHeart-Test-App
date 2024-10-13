import 'package:flutter/material.dart';
import 'package:greensheart_test/backend/medication/manager.dart';

class Medication {
    late int id;
    String name;
    TimeOfDay time;
    int dosage;
    String dosageUnit;

    Medication({
        required this.name,
        required this.time,
        required this.dosage,
        required this.dosageUnit
    }) {
        id = MedicationManager().getNewMedicationID();
    }

    // ================================
    // Functional Methods
    // ================================
    // Return true if the name, time, or dosage contains the query
    bool contains(String query) {
        if (query.isEmpty) return true;

        return name.toLowerCase().contains(query.toLowerCase());
    }

    @override
    String toString() {
        return 'Medication(id: $id, name: $name, time: $time, dosage: $dosage)';
    }
}