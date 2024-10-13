import 'package:flutter/material.dart';
import 'package:greensheart_test/backend/medication/medication.dart';

class MedicationManager with ChangeNotifier {
    static final MedicationManager _instance = MedicationManager._internal();

    // Just a static list to act as a database that has the pre existing medications
    static List<Medication> _medications = [
        Medication(
            id: 0,
            name: 'Aspirin',
            time: '12:00',
            dosage: '5mg'
        ),
        Medication(
            id: 1,
            name: 'Paracetamol',
            time: '12:00',
            dosage: '10mg'
        ),
        Medication(
            id: 2,
            name: 'Ibuprofen',
            time: '12:00',
            dosage: '10mg'
        ),
        Medication(
            id: 3,
            name: 'Cetirizine',
            time: '12:00',
            dosage: '10mg'
        ),
        Medication(
            id: 4,
            name: 'Acetaminophen',
            time: '12:00',
            dosage: '10mg'
        ),
        Medication(
            id: 5,
            name: 'Codeine',
            time: '12:00',
            dosage: '10mg'
        ),
    ];
    
    // Private constructor
    MedicationManager._internal();

    // Private constructor
    factory MedicationManager() => _instance;

    // Returns the number of medications in the list
    int getMedicationsCount() {
        return _medications.length;
    }

    // Returns the medication at the given index
    Medication getMedication(int index) {
        return _medications[index];
    }

    // Removes the medication at the given index
    void removeMedication(int index) {
        _medications.removeAt(index);
        notifyListeners();
    }

    // Updates the medication at the given index
    void updateMedication(int index, String name, String time, String dosage) {
        _medications[index].name = name;
        _medications[index].time = time;
        _medications[index].dosage = dosage;
        notifyListeners();
    }

    // Adds a new medication to the list through Medication class parameters
    void addMedication(String name, String time, String dosage) {
        _medications.add(Medication(
            id: _medications.length,
            name: name,
            time: time,
            dosage: dosage
        ));
        notifyListeners();
    }
}