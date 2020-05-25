import 'package:flutter/material.dart';
import 'package:helloworld1/warning.dart';



//variables
String finalIcao;
String finalName;
String finalCity;
String finalDomSqk;
String finalIntSqk;
String finalVfrSqk;
String finalInitialClimb;
String finalFinalDescend;

void main() => runApp(MaterialApp(
   initialRoute: '/home',
   routes: {
    '/home':  (context) => MyApp(),
    '/airport':(context) => Airport(),
    '/warning': (context) => Warning(),
    

  },
));


class AirportsList {
  String icao;
  String name;
  String city;
  String domSqk;
  String intSqk;
  String vfrSqk;
  String initialClimb;
  String finalDescend;
  AirportsList({this.name , this.icao ,this.city, this.domSqk,this.intSqk,this.vfrSqk,this.initialClimb,this.finalDescend});
}


List<AirportsList> airports = [
  AirportsList(name: 'King Fahd International Airport'     ,icao: 'OEDF',city:'Dammam',domSqk: '5201-5217 \n5220-5277',intSqk: '5301-5377 \n5401-5477',vfrSqk: '1701-1707',initialClimb: '4000ft',finalDescend: '1700ft'),
  AirportsList(name: 'King Abdulaziz International Airport',icao: 'OEJN',city:'Jeddah',domSqk: '4300-4377 \n4500-4577 \n4600-4677',intSqk: '3100-3177 \n3500-3577',vfrSqk: '0570-0577',initialClimb: '4000ft',finalDescend: '2000ft'),
  AirportsList(name: 'King Khalid International Airport'   ,icao: 'OERK',city:'Riyadh',domSqk: '6301-6377',intSqk: '6131-6177 \n6231-6277',vfrSqk: '0371-0377',initialClimb: 'Runway 15R/L     Runway 33R/L \n4000                    6000',finalDescend: '5000ft'),
  AirportsList(name: 'King Abdulaziz International Airport',icao: 'OEMA',city:'Madina',domSqk: '4600-4677',intSqk: '3500-3577 \n3500-3577',vfrSqk: '0570-0577',initialClimb: '8000ft',finalDescend: '6000ft'),
];



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      title: 'KSA ATC Helper',
      home: Scaffold(
        appBar: AppBar(
          title: Text('KSA  ATC'),
          backgroundColor: Colors.green[900],
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.builder(
            itemCount: airports.length,
            itemBuilder: (context,index){
              return Column(
                children: [
                  Card(
                    color: Colors.blue[900],
                    
                    child: ListTile(
                      title: Text(airports[index].city ,
                      
                      style: TextStyle(
                        color:Colors.white,
                        fontSize: 20.0,

                      ),
                      textAlign: TextAlign.center,
                      ),
                      leading: Icon(Icons.flight),
                      onTap: () {
                        
                        //print(airports[index].icao + ' ' + '$index' + ' ' + airports[index].initialClimb);
                        finalIcao = airports[index].icao;
                        finalName = airports[index].name;
                        finalCity = airports[index].city;
                        finalDomSqk = airports[index].domSqk;
                        finalIntSqk = airports[index].intSqk;
                        finalVfrSqk = airports[index].vfrSqk;
                        finalInitialClimb= airports[index].initialClimb;
                        finalFinalDescend = airports[index].finalDescend;
                        
                         
                         Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Airport()),);
                       },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){
          Navigator.pushNamed(context,'/warning');
          print('Warning Button Pressed');
        },
        backgroundColor: Colors.redAccent[700],
          child: Icon(
            Icons.warning,
            
          ),
        ),
      ),
    );
  }
}





class Airport extends StatefulWidget {
  @override
  _AirportState createState() => _AirportState();
}

class _AirportState extends State<Airport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text(finalCity),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
       body: Center(
         child: ListView(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.airplanemode_active),
                title: Text(finalName),
              ),
              ListTile(
                leading: Icon(Icons.photo_album),
                title: Text(finalIcao),
              ),
              ListTile(
                leading: Icon(Icons.radio),
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Domestic \n$finalDomSqk'),
                    SizedBox(width:40),
                    Text('International \n$finalIntSqk'),
                    SizedBox(width:40),
                    Text('VFR \n$finalVfrSqk'),

                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.flight_takeoff),
                title: Text('Initial Climb \n$finalInitialClimb'),
              ),
               ListTile(
                leading: Icon(Icons.flight_land),
                title: Text('Final Descend \n$finalFinalDescend'),
              ),
            ],
          ),
       ),
      
    
    );
  }
}