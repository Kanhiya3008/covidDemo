import 'dart:convert';
import 'india.dart';
import 'regional.dart';
import 'package:covid19app/panels/mosteffectedcountries.dart';
import 'package:covid19app/panels/worldwidepanel.dart';
import 'package:covid19app/datasource.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:covid19app/ApiManger.dart';
import 'dart:async';
import 'package:covid19app/ModelFIle.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  TabController _tabController;
  ApiManger _provider = ApiManger();
  ApiMangerIndiaState _state = ApiMangerIndiaState();
  CountryModel worldData;
  CountryModel IndiaData;
  CountryModel USAData;
  CountryModel StateData;



  Future indiaDataGet() async {
    var value = await _provider.fetchUsersFromGitHub("countries/India");
    setState(() {
      IndiaData = CountryModel.fromJson(value);
    });
  }

  Future worldDataGet() async {
    var value = await _provider.fetchUsersFromGitHub("countries/India");
    setState(() {
      worldData = CountryModel.fromJson(value);
    });
  }

  Future stateDataGet() async {
    var value = await _provider.fetchUsersFromGitHub("data.json");
    setState(() {
      StateData = CountryModel.fromJson(value);
    }
    );print(StateData);
  }





  @override
  void initState() {
    super.initState();
    indiaDataGet();
    worldDataGet();
    stateDataGet();




    _tabController =TabController(length:3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff202c3b),
        title: Text('COVID_19 TRACKER'),
        bottom: TabBar(
          unselectedLabelColor: Colors.white70,
          labelColor: Colors.white,
          tabs: [
            Tab(icon: new Icon(Icons.info),
              text: 'INDIA',),
            Tab(
              text: 'WORLD INFO',
              icon: FaIcon(FontAwesomeIcons.bold),
            ),
            Tab(
              text: 'All COUNTRY',
              icon: new Icon(Icons.person_pin_circle),

            )
          ],
          controller: _tabController,
        ),
      ),

      body: TabBarView(
        children: <Widget>[
          india(indiaData : IndiaData),
          SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 100,
              alignment: Alignment.center,
              color: Colors.grey[400],
              padding: EdgeInsets.all(10),
              child: Text(
                DataSource.quote, style: TextStyle(color: Colors.white,
                  fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('WorldWideInfo', style: TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),),
                ],
              ),
            ),
//            worldData == null ? CircularProgressIndicator() :
            WorldWidePanel(worldData :  worldData),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: Text('Mostaffected country',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  Text(' India',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                  // Image.network(USAcountryData['countryInfo']['flag'],height: 50,)
                ],
              ),
            ),
//            indiaCountryData == null ? CircularProgressIndicator() :
            MostEffectedPanel(USAcountryData: IndiaData,),
          ],
        ),
      ),
          CountryPage(),
      ],
        controller: _tabController,
      ),

    );
  }
}
