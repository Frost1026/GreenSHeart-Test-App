import 'package:greensheart_test/backend/medication/medication.dart';

class PrescriptionMedication extends Medication {
    String prescriber;

    PrescriptionMedication({
        required super.id, 
        required super.name, 
        required super.time, 
        required super.dosage,
        required this.prescriber 
    });
}