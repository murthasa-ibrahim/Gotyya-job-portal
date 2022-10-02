
class JobListGetModel {
  JobListGetModel({
    this.id,
    this.category,
    this.jobTitle,
    this.jobDescription,
    this.message
  });

  final int? id;
  final List<Category>? category;
  final String? jobTitle;
  final String? jobDescription;
  final String? message;

  factory JobListGetModel.fromJson(Map<String, dynamic> json) =>
      JobListGetModel(
        id: json["id"],
        category: List<Category>.from(
            json["category"].map((x) => Category.fromJson(x))),
        jobTitle: json["job_title"],
        jobDescription: json["job_description"],
      );

  static List<JobListGetModel> jobListGetModelFromJson(List list) =>
      List<JobListGetModel>.from(
        list.map((x) => JobListGetModel.fromJson(x)));
  @override
  String toString() {
     return 'id:$id \n category:$category \n jobtitle:$jobTitle' ;
  }
}

class Category {
  Category({
    required this.categoryName,
  });

  final String categoryName;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        categoryName: json["category_name"],
      );
   
}
