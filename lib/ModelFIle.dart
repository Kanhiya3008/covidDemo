import 'package:http/http.dart' as http;

class CountryModel {
  String country;

  int cases;
  int active;
  int recovered;
  int deaths;
  int todayCases;
  int todayDeaths;
  CInfoModel cinfoModel;

  CountryModel({
    this.country,
    this.cases,
    this.active,
    this.recovered,
    this.deaths,
    this.cinfoModel,
    this.todayCases,
    this.todayDeaths,

  });

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
      country: json["country"],
      cases: json["cases"],
      active: json["active"],
      recovered: json["recovered"],
      deaths: json["deaths"],
      todayCases: json['todayCases'],
      todayDeaths: json["todayDeaths"],

      cinfoModel: CInfoModel.fromJson(json["countryInfo"]));

  Map<String, dynamic> toJson() => {
        "country": country,
        "cases": cases,
        "active": active,
        "recovered": recovered,
        "deaths": deaths,
        "cinfoModel": cinfoModel,
    "todayCases":todayCases,

      };
}

class CInfoModel {
  int id;
  String iso2;
  String flag;

  CInfoModel({this.id, this.iso2, this.flag});

  factory CInfoModel.fromJson(Map<String, dynamic> json) => CInfoModel(
          id: json["_id"],
          flag: json["flag"],
          iso2: json["iso2"]
  );
  Map<String, dynamic> toJson() => {"id": id, "flag": flag, "iso2": iso2};
}


class StateModel {
  int active;
  int confirmed;
  int deaths;
  int recovered;
  String state;


  StateModel({
    this.active,
    this.confirmed,
    this.deaths,
    this.recovered,
    this.state});

  factory StateModel.fromJson(Map<String, dynamic> json) =>
      StateModel(
          active: json["active"]

      );

  Map<String, dynamic> toJson() =>
      {
        "active": active,
        "confirmed": confirmed,
        "deaths": deaths,
        "recovered": recovered,
        "state": state,

      };
}