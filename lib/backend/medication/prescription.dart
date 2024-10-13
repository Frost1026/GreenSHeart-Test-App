import 'package:greensheart_test/backend/medication/medication.dart';

class PrescriptionMedication extends Medication {
    String prescriber;

    PrescriptionMedication({
        required super.name, 
        required super.time, 
        required super.dosage,
        required super.dosageUnit,
        required this.prescriber 
    });

    // ================================
    // Functional Methods
    // ================================
    @override
    String toString() {
        return 'PrescriptionMedication(id: $id, name: $name, time: $time, dosage: $dosage, prescriber: $prescriber)';
    }
}