import 'package:flutter/material.dart';

class Utility {
    static final Utility _instance = Utility._internal();
    factory Utility() => _instance;

    // private constructor
    Utility._internal();

    String formatTimeOfDay(TimeOfDay time) {
        // Convert TimeOfDay to a string (e.g., "2:30 PM")
        final hours = time.hour % 12 == 0 ? 12 : time.hour % 12; // Convert to 12-hour format
        final minutes = time.minute.toString().padLeft(2, '0'); // Pad minutes with leading zero
        final period = time.hour >= 12 ? 'PM' : 'AM'; // Determine AM/PM
        return '$hours:$minutes $period'; // Return formatted string
    }
} 