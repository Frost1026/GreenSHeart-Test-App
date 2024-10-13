import 'package:flutter/material.dart';
import 'package:greensheart_test/backend/medication/manager.dart';
import 'package:greensheart_test/ui/medication/prefabs/dialog_state.dart';

class AddMedicationDialog extends MedicationDialog {
    const AddMedicationDialog({
        super.key, 
        super.title = 'Add Medication',
    });

    @override
    State<MedicationDialog> createState() => _AddMedicationFormState();
}

class _AddMedicationFormState extends MedicationDialogState {
    // ================================
    // Functional Methods
    // ================================
    @override
    void onSubmit() {
        super.onSubmit();

        MedicationManager().addMedication(
            nameController.text,
            selectedTime,
            int.parse(dosageController.text),
            selectedDosageUnit
        );
    }
}