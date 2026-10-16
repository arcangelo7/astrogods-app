class CavernDetails {
  final int houseNumber;
  final String title;
  final String literalMeaning;
  final String esotericMeaning;
  final String? imagePath;

  const CavernDetails({
    required this.houseNumber,
    required this.title,
    required this.literalMeaning,
    required this.esotericMeaning,
    this.imagePath,
  });

  factory CavernDetails.fromJson(Map<String, dynamic> json) {
    return CavernDetails(
      houseNumber: json['houseNumber'] as int,
      title: json['title'] as String,
      literalMeaning: json['literalMeaning'] as String,
      esotericMeaning: json['esotericMeaning'] as String,
      imagePath: json['imagePath'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'houseNumber': houseNumber,
      'title': title,
      'literalMeaning': literalMeaning,
      'esotericMeaning': esotericMeaning,
      'imagePath': imagePath,
    };
  }
}
