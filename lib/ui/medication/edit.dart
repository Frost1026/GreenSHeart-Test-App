import 'package:flutter/material.dart';
import 'package:greensheart_test/backend/medication/manager.dart';
import 'package:greensheart_test/backend/utils/utility.dart';
import 'package:greensheart_test/ui/medication/prefabs/dialog_state.dart';

class EditMedicationDialog extends MedicationDialog {
    const EditMedicationDialog({
        super.key,
        super.title = 'Edit Medication',
        super.medication,
    });

    @override
    State<MedicationDialog> createState() => _EditMedicationFormState();
}

class _EditMedicationFormState extends MedicationDialogState {
    @override
    void initState() {
        super.initState();

        if(widget.medication != null) {
            nameController.text = widget.medication!.name;
            timeController.text = Utility().formatTimeOfDay(widget.medication!.time);
            dosageController.text = widget.medication!.dosage.toString();

            selectedTime = widget.medication!.time;
            selectedDosageUnit = widget.medication!.dosageUnit;
        }
    }

    @override
    void onSubmit() {
        super.onSubmit();

        MedicationManager().updateMedication(
            widget.medication!.id,
            nameController.text,
            selectedTime,
            int.parse(dosageController.text),
            selectedDosageUnit
        );
    }
}