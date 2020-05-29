import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:covid19app/ModelFIle.dart';

import 'ModelFIle.dart';


class ApiManger {

  final String _baseUrl = "https://corona.lmao.ninja/v2/";

  Future<Map> fetchUsersFromGitHub(String path) async {

    final response = await http.get(_baseUrl + path);
    Map valueMap = json.decode(response.body);
    return valueMap;
  }



}


class ApiMangerIndiaState {

  final String _baseUrl = "https://api.covid19india.org/";

  Future<Map> fetchUsersFromGitHub(String path) async {

    final response = await http.get(_baseUrl + path);
    Map valueMap = json.decode(response.body);
    return valueMap;
  }



}


