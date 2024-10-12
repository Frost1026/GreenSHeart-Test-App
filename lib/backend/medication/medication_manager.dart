import 'package:greensheart_test/backend/medication/medication.dart';

class MedicationManager {
    static List<Medication> medications = [
        Medication(
            id: 0,
            name: 'Aspirin',
            time: DateTime(2024, 10, 13, 12, 0, 0),
            dosage: '5mg'
        ),
        Medication(
            id: 1,
            name: 'Paracetamol',
            time: DateTime(2024, 10, 13, 12, 0, 0),
            dosage: '10mg'
        ),
    ];

    int getMedicationsCount() {
        return medications.length;
    }

    Medication getMedication(int index) {
        return medications[index];
    }
}