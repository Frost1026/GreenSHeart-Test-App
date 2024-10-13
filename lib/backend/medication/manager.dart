import 'package:flutter/material.dart';
import 'package:greensheart_test/backend/medication/medication.dart';

class MedicationManager with ChangeNotifier {
    static final MedicationManager _instance = MedicationManager._internal();
    factory MedicationManager() => _instance;

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

    static List<int> _filteredMedicationsID = [];

    String _activeFilter = '';
    
    // Private constructor
    MedicationManager._internal();

    // ================================
    // Functional Methods
    // ================================
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

    // Populates the index of the filtered medications
    void filterMedications() {
        _filteredMedicationsID = [];
        for (int i = 0; i < _medications.length; i++) {
            // If the name, time, or dosage contains the query, add the index to the filtered list
            if (_medications[i].contains(_activeFilter)) {
                _filteredMedicationsID.add(i);
            }
        }
        notifyListeners();
    }

    // ================================
    // Getters and setters
    // ================================
    // Set the active filter and filers the medication IDs into
    // _filteredMedicationsID accordingly
    void setActiveFilter(String filter) {
        _activeFilter = filter;
        _filteredMedicationsID = [];
        filterMedications();
    }

    String get activeFilter => _activeFilter;

    // Returns the number of medications in the list
    int get medicationCount {
        // If there is an active filter, return the number of medications in the filtered list
        if(_activeFilter.isNotEmpty) {
            return _filteredMedicationsID.length;
        }

        // If there is no active filter, return the number of medications
        return _medications.length;
    }

    // Returns the medication at the given index
    Medication getMedication(int index) {
        // If there is an active filter, return the medication at index 
        // of the index in the filtered list
        if(_activeFilter.isNotEmpty && _filteredMedicationsID.isNotEmpty) {
            return _medications[_filteredMedicationsID[index]];
        }

        // Return the medication at the given index
        return _medications[index];
    }

    List<Medication> getAllMedications() {
        return _medications;
    }
}