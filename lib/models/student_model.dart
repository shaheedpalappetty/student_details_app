class StudentModel {
  final int? id;
  final String name;
  final int age;
  final String batch;
  final int regnum;
  final String image;

  StudentModel(
      {this.id,
      required this.name,
      required this.age,
      required this.batch,
      required this.regnum,
      required this.image});
  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      id: json['id'],
      name: json['name'],
      age: json['age'],
      batch: json['batch'],
      regnum: json['regnum'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'batch': batch,
      'regnum': regnum,
      'image': image
    };
  }
}