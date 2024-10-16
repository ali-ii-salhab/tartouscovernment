class CountryCityModel {
  String? name;

  List<String>? cities;

  CountryCityModel({this.name, this.cities});

  CountryCityModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    cities = json['cities'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['cities'] = this.cities;

    return data;
  }
}
