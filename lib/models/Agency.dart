class Agency {
  final String name;
  final String description;
  final String
      adresse; // Change this line to match the field name in the Spring Boot model

  Agency({
    required this.name,
    required this.description,
    required this.adresse,
  });

  factory Agency.fromJson(Map<String, dynamic> json) {
    return Agency(
      name: json['name'],
      description: json['description'],
      adresse: json['adresse'],
    );
  }
}
