import 'package:covid19app/ModelFIle.dart';
import 'package:covid19app/indiaStates.dart';
import 'package:flutter/material.dart';
class WorldWidePanel extends StatelessWidget {

  final CountryModel worldData;
 // final CountryModel usaData;
  const WorldWidePanel({Key key, this.worldData, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,childAspectRatio: 2),
        children: <Widget>[
          GestureDetector( onTap: ()
          { Navigator.push(context, MaterialPageRoute(builder: (context)=> IndiaStates()));},
            child: StatusPanel(
              title: 'CRITICAL',
              panelColor: Colors.red,
              textColor: Colors.white,
              count: "${worldData.deaths}",
            ),
          ),
          StatusPanel(
            title: 'CONFIRMED',
            panelColor: Colors.red[800],
            textColor: Colors.white,
            count: "${worldData.deaths}",
          ),
          StatusPanel(
            title: 'TODAY CASES',
            panelColor: Colors.grey[400],
            textColor: Colors.white,
            count: "${worldData.deaths}",
          ),
          StatusPanel(
            title: 'RECOVERED',
            panelColor: Colors.green,
            textColor: Colors.white,
            count: "${worldData.deaths}",
          ),
          StatusPanel(
            title: 'DEATHS',
            panelColor: Colors.red[900],
            textColor: Colors.white,
            count: "${worldData.deaths}",
          ),
          StatusPanel(
            title: 'TODAY DEATHS',
            panelColor: Colors.redAccent,
            textColor: Colors.white,
            count: "${worldData.deaths}",
          ),
          StatusPanel(
            title: 'ACTIVE',
            panelColor: Colors.orangeAccent,
            textColor: Colors.white,
            count:"${worldData.deaths}",
          ),
          StatusPanel(
            title: 'DEATHS PER 1 MILL.',
            panelColor: Colors.indigo,
            textColor: Colors.white,
            count: "${worldData.deaths}",
          ),

        ],
      ),
    );
  }
}
class StatusPanel extends StatelessWidget {
  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

  const StatusPanel({Key key, this.panelColor, this.textColor, this.title, this.count}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width  = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15 ),
        color: panelColor,
      ),

      height: 80,
      width: width/2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: textColor),),
          Text(count,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: textColor),)
        ],
      ),
    );
  }
}

