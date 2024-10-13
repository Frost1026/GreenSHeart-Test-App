class Medication {
    int id;
    String name;
    String time;
    String dosage;

    Medication({
        required this.id,
        required this.name,
        required this.time,
        required this.dosage
    });

    // ================================
    // Functional Methods
    // ================================
    // Return true if the name, time, or dosage contains the query
    bool contains(String query) {
        if (query.isEmpty) return true;

        return 
            name.toLowerCase().contains(query.toLowerCase())
            || time.toLowerCase().contains(query.toLowerCase())
            || dosage.toLowerCase().contains(query.toLowerCase());
    }

    // ================================
    // Getters and setters
    // ================================
}