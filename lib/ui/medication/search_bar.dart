import 'package:flutter/material.dart';
import 'package:greensheart_test/backend/medication/index.dart';
import 'package:greensheart_test/ui/medication/prefabs/search_bar.dart';

class MedicationSearchBar extends CustomSearchBar {
    MedicationSearchBar() : super(searchLabel: 'Search Medication', borderColor: Colors.white);
    
    // ================================
    // Functional Methods
    // ================================
    @override
    void search(String query) {
        MedicationManager().setActiveFilter(query);
    }
}