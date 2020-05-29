import 'package:covid19app/HomePageDetail.dart';
import 'package:covid19app/ModelFIle.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:covid19app/india.dart';
class CountryPage extends StatefulWidget {
  @override
  _countryPageState createState() => _countryPageState();
}

class _countryPageState extends State<CountryPage> {



  List<CountryModel> countryData = [];

  fetchCountryData() async {
    http.Response response = await http.get(
        "https://corona.lmao.ninja/v2/countries");
    final data = jsonDecode(response.body);
    setState(() {
      for(Map i in data){
        countryData.add(CountryModel.fromJson(i));
      }

    });
  }
   @override
  void initState() {
    fetchCountryData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
//      appBar: AppBar(
//        backgroundColor: Colors.black,
//        centerTitle: true,
//        title: Text('COUNTRY'),
//      ),
      body:



      countryData == null?Center(child: CircularProgressIndicator(),):
       ListView.builder(itemBuilder: (context,index){
         final modelObj = countryData[index];
        return

          InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePageDetail(
              modelObj: modelObj,
            )));
          },
          child: Container(
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(modelObj.country,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                     // Image.network(modelObj.)
                      Image.network(modelObj.cinfoModel.flag,height: 40,width: 50,)
                    ],
                  ),
                ),
                Expanded(
                  child: Card(
                    color: Color(0xff202c3b),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Confiremed   ' + modelObj.cases.toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
                        SizedBox(width: 10,),
                        Text('Active   ' + modelObj.active.toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),),
                        SizedBox(width: 10,),
                        Text('RECOVERED   ' + modelObj.recovered.toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),),
                        SizedBox(width: 10,),
                        Text('DEATHS   ' + modelObj.deaths.toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red[900]),),
                      ],
                    ),
                  ),

                )

              ],
            ),

          ),
        );

      },
      itemCount: countryData == null?0:countryData.length,
      ),
    );
  }
}
