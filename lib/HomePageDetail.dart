import 'package:covid19app/ModelFIle.dart';
import 'package:flutter/material.dart';
class HomePageDetail extends StatefulWidget {

  CountryModel  modelObj;
  HomePageDetail({this.modelObj});
  @override
  _HomePageDetailState createState() => _HomePageDetailState();
}

class _HomePageDetailState extends State<HomePageDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('COUNTRY FULL DETAILS'),
        backgroundColor: Color(0xff202c3b),
      ),
      body: ListView(
        children: <Widget>[
          Container(
//            color: Colors.grey[900],
            padding: EdgeInsets.all(16),
            child: Card(
              color: Color(0xff202c3b),
              child: Padding(
                  padding: EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: Text('All details of country',
                            style: TextStyle(
                              fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white
                            ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Container(
                            child: Column(
                              children: <Widget>[
                                //Image.network(widget.flag),
                                Text(
                                  "${widget.modelObj.country}",style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold
                                )
                                ),
                                Text(
                                    "Confiremed: ${widget.modelObj.cases}",style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold
                                )
                                ),
                                Text(
                                    "Active: ${widget.modelObj.active}",style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold
                                )
                                ),
                                Text(
                                    "Recovered: ${widget.modelObj.recovered}",style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold
                                )
                                ),
                                Text(
                                    "Deaths: ${widget.modelObj.deaths}",style: TextStyle(
                                    color: Colors.red[900],
                                    fontWeight: FontWeight.bold
                                )
                                ),

                              ],

                            ),
                          ),

                        ],
                      ),
              ),
            ),
          ),
          SizedBox(height: 40,),
             Container(
               color: Color(0xff202c3b),
               child: Padding(
                 padding: const EdgeInsets.all(16.0),
                 child: Row(
                   children: <Widget>[
                     Expanded(child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: <Widget>[
                         Text(
                           "Country info -",style: TextStyle(
                             fontWeight: FontWeight.bold,
                             color: Colors.white,
                             fontSize: 24),
                         ),
                         Text("${widget.modelObj.country}",style: TextStyle(
                             fontWeight: FontWeight.bold,
                             color: Colors.white,
                             fontSize: 24),),
                         Text("TODAY CASES     =    ${widget.modelObj.todayCases}",style: TextStyle(
                             color: Colors.white,
                             fontSize: 15),),
                         Text("TODAY DEATHS  =   ${widget.modelObj.todayDeaths}",style: TextStyle(
                             color: Colors.white,
                             fontSize: 15),),
                         BagianIcon()

                       ],
                     ))

                   ],
                 ),
               ),
             )
        ],
      ),
    );
  }
}
class BagianIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          IconText(iconData: Icons.camera, text: "Camera",),

          IconText(iconData: Icons.phone, text: "Phone",),

          IconText(iconData: Icons.message, text: "Message",),
        ],
      ),
    );
  }
}

class IconText extends StatelessWidget {
  IconText({this.iconData, this.text});
  final IconData iconData;
  final String text;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
      child: Column(
        children: <Widget>[
          Icon(
            iconData,
            size: 20,
            color: Colors.white,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
