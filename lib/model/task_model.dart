class TaskModel {
  final String title;
  final String description;
  final String image;

  TaskModel(
      {required this.title, required this.description, required this.image});

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      title: json['title'],
      description: json['description'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'image': image,
    };
  }
}
