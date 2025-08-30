class SubtitledVideoModel {
  final String id;
  final String userId;
  final String name;
  final String videoUrl;
  final DateTime createdAt;
  final DateTime updatedAt;

  SubtitledVideoModel({
    required this.id,
    required this.userId,
    required this.name,
    required this.videoUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SubtitledVideoModel.fromJson(Map<String, dynamic> json) {
    return SubtitledVideoModel(
      id: json['_id'],
      userId: json['userId'],
      name: json['name'],
      videoUrl: json['videoUrl'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}
