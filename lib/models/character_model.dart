class CharacterModel {
  final String image;
  final String description;
  final String title;

  CharacterModel({
    required this.image,
    required this.description,
    required this.title,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    final text = json['Text'] as String;
    final title = text.split(' - ')[0];
    final description = text.split(' - ')[1];
    final imageUrl = json['Icon']['URL'] as String;

    return CharacterModel(
      image: imageUrl,
      description: description,
      title: title,
    );
  }
}
