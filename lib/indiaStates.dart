import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:covid19app/ModelFIle.dart';
import 'package:http/http.dart' as http;

class IndiaStates extends StatefulWidget {
  StateModel obj;
  IndiaStates({this.obj});
  @override
  _IndiaStatesState createState() => _IndiaStatesState();
}

class _IndiaStatesState extends State<IndiaStates> {

  List<StateModel> stateData = [];

  fetchCountryData() async {
    http.Response response = await http.get(
        "https://api.covid19india.org/data.json");
    final data = jsonDecode(response.body);
    setState(() {
      for(Map i in data){
        stateData.add(StateModel.fromJson(i));
      }

    });
  }
  @override
  void initState() {
    fetchCountryData();
    super.initState();
    print(stateData);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: stateData == null?Center(child: CircularProgressIndicator(),):
          ListView.builder(itemBuilder: (context,index){
            final obj = stateData[index];
            return
                Container(
                   height: 130,
                    margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Color(0xff202c3b),
                        boxShadow: [BoxShadow(
                          //color: Colors.grey[100],
                          // blurRadius: 10,
                          // offset: Offset(0,10)
                        )]
                    ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: <Widget>[
                            Text(obj.state)
                          ],
                        ),
                      )
                    ],
                  ),
                );

          },
          itemCount: stateData == null?0:stateData.length,)
    );
  }
}
