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
    final textParts = text.split(' - ');
    final title = textParts.isNotEmpty ? textParts[0] : text;
    final description = textParts.length > 1 ? textParts[1] : '';
    final imageUrl = json['Icon']['URL'] as String;

    return CharacterModel(
      image: imageUrl.isEmpty ? '' : 'https://duckduckgo.com/$imageUrl',
      description: description,
      title: title,
    );
  }
}
