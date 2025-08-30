
class AudioModel {
  final String id;
  final String userId;
  final String text;
  final String name;
  final String audioUrl;
  final DateTime createdAt;
  final DateTime updatedAt;

  AudioModel({
    required this.id,
    required this.userId,
    required this.text,
    required this.name,
    required this.audioUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AudioModel.fromJson(Map<String, dynamic> json) {
    return AudioModel(
      id: json['_id'],
      userId: json['userId'],
      text: json['text'],
      name: json['name'],
      audioUrl: json['audioUrl'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}

