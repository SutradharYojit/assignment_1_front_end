class AboutModel {
  String? appDescription;
  List<Routes>? routes;

  AboutModel({this.appDescription, this.routes});

  AboutModel.fromJson(Map<String, dynamic> json) {
    appDescription = json['appDescription'];
    if (json['routes'] != null) {
      routes = <Routes>[];
      json['routes'].forEach((v) {
        routes!.add(new Routes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appDescription'] = this.appDescription;
    if (this.routes != null) {
      data['routes'] = this.routes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Routes {
  String? name;
  String? description;

  Routes({this.name, this.description});

  Routes.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }
}