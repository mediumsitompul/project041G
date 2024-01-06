
class DataModel {
  String student_id1, student_name1, major1, phone1;

  DataModel({
    this.student_id1 = "",
    this.student_name1 = "",
    this.major1 = "",
    this.phone1 = "",
  });

  //DataModel.fromJSON1
  factory DataModel.fromJSON1(Map<String, dynamic> convertJson) {
    return DataModel(
        student_id1: convertJson["student_id"].toString(),
        student_name1: convertJson["student_name"],
        major1: convertJson["major"],
        phone1: convertJson["phone"]);
  }
}
