import 'package:flutter/material.dart';

class Medication {
    int id;
    String name;
    TimeOfDay time;
    int dosage;
    String dosageUnit;

    Medication({
        required this.id,
        required this.name,
        required this.time,
        required this.dosage,
        required this.dosageUnit
    });

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