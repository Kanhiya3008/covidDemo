import 'package:covid19app/indiaStates.dart';
import 'package:covid19app/panels/mosteffectedcountries.dart';
import 'package:covid19app/regional.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:covid19app/ModelFIle.dart';

class india extends StatefulWidget {
  @override
  _indiaState createState() => _indiaState();
  final CountryModel indiaData;

  // final StateModel StateData;

  const india({
    Key key,
    this.indiaData,
  }) : super(key: key);
}

// ignore: camel_case_types
class _indiaState extends State<india> {
  // ignore: non_constant_identifier_names
//  Map IndiaData;

  @override
  void initState() {
    super.initState();

    print(widget.indiaData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:
        Container(
          color: Colors.red,
          // height: 500,
          child: Stack(
            children: <Widget>[
              Positioned(
                child: Container(
                  color: Colors.yellow,
                  height: 150,
                ),
              ),
              Positioned(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'covid_19 Cases Overview',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
              Positioned(
                  // bottom: 0,
                  child: Padding(
                padding: const EdgeInsets.only(top: 70, left: 25, right: 25),
                child: Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(
                            0xff202c3b), //boxShadow: BoxShadow(color: Colors.black)
                      ),
                      height: 150,
                    ),
                    widget.indiaData == null
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Positioned(
                            top: 45,
                            left: 45,
                            child: Row(
                              children: <Widget>[
                                // ignore: unrelated_type_equality_checks

                                Column(
                                  children: <Widget>[
                                    Text('Confiremed',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                      "${widget.indiaData.cases}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    // Text("${widget.indiaData.todayCases}" ,style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
                                  ],
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  children: <Widget>[
                                    Text('Recovered',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                      " ${widget.indiaData.recovered}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  children: <Widget>[
                                    Text('Deceased',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                      "${widget.indiaData.deaths}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    // Text("${widget.indiaData.todayDeaths}" ,style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
                                  ],
                                ),
                              ],
                            ),
                          ),
                    Positioned(
                        left: 44,
                        top: 10,
                        child: Text('Across India',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25))),
                  ],
                ),
              )),
            ],
          ),
        ),

      ),
    );
  }
}


