import 'package:covid19app/ModelFIle.dart';
import 'package:flutter/material.dart';

class MostEffectedPanel extends StatelessWidget {
  final CountryModel USAcountryData;

  const MostEffectedPanel({Key key, this.USAcountryData,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,childAspectRatio: 2),
          children: <Widget>[
            USAPanel(
              title: 'TOTAL CASES',
              panelColor: Colors.red[800],
              textColor: Colors.white,
              count: "${USAcountryData.cases}",
            ),
            USAPanel(
              title: 'RECOVERED',
              panelColor: Colors.green,
              textColor: Colors.white,
              count: "${USAcountryData.recovered}",
            ),
            USAPanel(
              title: 'DEATHS',
              panelColor: Color(0xff202c3b),
              textColor: Colors.white,
              count: "${USAcountryData.deaths}",
            ),
            USAPanel(title: 'ACTIVE',
              panelColor: Colors.red[900],
              textColor: Colors.white,
              count: "${USAcountryData.active}",
            ),
            USAPanel(
              title: 'TODAY CASES',
              panelColor: Color(0xff202c3b),
              textColor: Colors.white,
              count:"${USAcountryData.cases}",
            ),
            USAPanel(title: 'TODAY DEATHS',
              panelColor: Color(0xff202c3b),
              textColor: Colors.white,
              count:"${USAcountryData.cases}",
            ),

          ]
      )
    );




  }
}
class USAPanel extends StatelessWidget {
  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

  const USAPanel({Key key, this.panelColor, this.textColor, this.title, this.count}) : super(key: key);
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