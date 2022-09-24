

class BlogPostModel {
  BlogPostModel({
    this.title,
    this.content,
    this.message,
    this.id,
  });

  final String? title;
  final String? content;
  final String? message;
  final int? id;

  factory BlogPostModel.fromJson(Map<String, dynamic> json) => BlogPostModel(
      title: json["title"] ?? '',
      content: json["content"] ?? '',
      id: json["id"]);

  Map<String, dynamic> toJson() => {
        "title": title,
        "content": content,
      };

      List<BlogPostModel> blogGetModelFromJson(List data) => List<BlogPostModel>.from(data.map((x) => BlogPostModel.fromJson(x)));

}
