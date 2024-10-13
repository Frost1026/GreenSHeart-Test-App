import 'package:flutter/material.dart';
import 'package:greensheart_test/backend/medication/index.dart';
import 'package:greensheart_test/ui/abstracts/search_bar.dart';

class MedicationSearchBar extends CustomSearchBar {
    MedicationSearchBar() : super(searchLabel: 'Search Medication', borderColor: Colors.white);
    
    @override
    void search(String query) {
        print(MedicationManager().getMedicationsCount());
    }
}