import 'package:flutter/material.dart';
import 'package:helloworld1/warning.dart';



// Global Variables
String finalIcao;
String finalIata;
String finalName;
String finalCity;
String finalDomSqk;
String finalIntSqk;
String finalVfrSqk;
String finalInitialClimb;
String finalFinalDescend;
int domSqkCode;
int intSqkCode;
int vfrSqkCode;
//String finalVfrSqkCode;
void main() => runApp(MaterialApp(
   initialRoute: '/home',
   routes: {
    '/home':  (context) => MyApp(),
    '/airport':(context) => Airport(),
    '/warning': (context) => Warning(),
    

  },
  ),

);
void _reset(){
  
  if(finalIata == 'DMM'){
    domSqkCode = 5201;
    intSqkCode = 5301;
    vfrSqkCode = 1701;
  }else if (finalIata == 'JED'){
    domSqkCode = 4300;
    intSqkCode = 3100;
    vfrSqkCode = 0570;
  }else if (finalIata == 'RUH'){
    domSqkCode = 6301;
    intSqkCode = 6131;
    vfrSqkCode = 0371;
  }else if (finalIata == 'MED'){
    domSqkCode = 4600;
    intSqkCode = 3500;
    vfrSqkCode = 0570;
  }
  
}


class AirportsList {
  String icao;
  String iata;
  String name;
  String city;
  String domSqk;
  String intSqk;
  String vfrSqk;
  String initialClimb;
  String finalDescend;
  AirportsList({this.name , this.icao ,this.iata ,this.city, this.domSqk,this.intSqk,this.vfrSqk,this.initialClimb,this.finalDescend});
}


List<AirportsList> airports = [
  AirportsList(name: 'King Fahd International Airport'     ,icao: 'OEDF',iata: 'DMM',city:'Dammam',domSqk: '5201-5217 \n5220-5277',intSqk: '5301-5377 \n5401-5477',vfrSqk: '1701-1707',initialClimb: '4000ft',finalDescend: '1700ft'),
  AirportsList(name: 'King Abdulaziz International Airport',icao: 'OEJN',iata: 'JED',city:'Jeddah',domSqk: '4300-4377 \n4500-4577 \n4600-4677',intSqk: '3100-3177 \n3500-3577',vfrSqk: '0570-0577',initialClimb: '4000ft',finalDescend: '2000ft'),
  AirportsList(name: 'King Khalid International Airport'   ,icao: 'OERK',iata: 'RUH',city:'Riyadh',domSqk: '6301-6377',intSqk: '6131-6177 \n6231-6277',vfrSqk: '0371-0377',initialClimb: 'Runway 15R/L     Runway 33R/L \n4000                    6000',finalDescend: '5000ft'),
  AirportsList(name: 'King Abdulaziz International Airport',icao: 'OEMA',iata: 'MED',city:'Madina',domSqk: '4600-4677',intSqk: '3500-3577',vfrSqk: '0570-0577',initialClimb: '8000ft',finalDescend: '6000ft'),
];



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      title: 'KSA ATC Helper',
      home: Scaffold(
        appBar: AppBar(
          title: Text('KSA ATC Helper'),
          backgroundColor: Colors.blueGrey[700],
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.builder(
            itemCount: airports.length,
            itemBuilder: (context,index){
              return Column(
                children: [
                  Card(
                    color: Colors.green[600],
                    
                    child: ListTile(
                      title: Text(airports[index].city ,
                      
                      style: TextStyle(
                        color:Colors.white,
                        fontSize: 20.0,

                      ),
                      textAlign: TextAlign.center,
                      ),
                      //leading: Icon(Icons.flight),
                      onTap: () {
                        
                        //print(airports[index].icao + ' ' + '$index' + ' ' + airports[index].initialClimb);
                        finalIcao = airports[index].icao;
                        finalIata = airports[index].iata;
                        finalName = airports[index].name;
                        finalCity = airports[index].city;
                        finalDomSqk = airports[index].domSqk;
                        finalIntSqk = airports[index].intSqk;
                        finalVfrSqk = airports[index].vfrSqk;
                        finalInitialClimb= airports[index].initialClimb;
                        finalFinalDescend = airports[index].finalDescend;
                         /*if(finalIcao == 'OEDF'){
                            domSqkCode = 5201;
                          }else if(finalIcao == 'OEJN'){
                            domSqkCode = 4300;
                          }else if(finalIcao == 'OERK'){
                            domSqkCode = 6301;
                          }else if(finalIcao == 'OEMA'){
                            domSqkCode = 4600;
                          }*/
                          _reset();
                         Navigator.push(context,MaterialPageRoute(builder: (context) => Airport()),);
                       },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        floatingActionButton: 
            FloatingActionButton(onPressed: (){
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
  
  void _incrementCounterDom() {
    setState(() {
      domSqkCode++;
    });
    if(finalIcao == 'OEDF'&& domSqkCode == 5218){
      domSqkCode = 5220;
    }else if(finalIcao == 'OEDF'&& domSqkCode == 5278){
      domSqkCode = 5201;
    }else if(finalIcao == 'OEJN'&& domSqkCode == 4378){
      domSqkCode = 4500;
    }else if(finalIcao == 'OEJN'&& domSqkCode == 4578){
      domSqkCode = 4600;
    }else if(finalIcao == 'OEJN'&& domSqkCode == 4678){
      domSqkCode = 4300;
    }else if(finalIcao == 'OERK'&& domSqkCode == 6378){
      domSqkCode = 6301;
    }else if(finalIcao == 'OEMA'&& domSqkCode == 4678){
      domSqkCode = 4600;
    }
    
  }
  void _incrementCounterInt() {
    setState(() {
      intSqkCode++;
    });
    if(finalIcao == 'OEDF'&& intSqkCode == 5378){
      intSqkCode = 5401;
    }else if(finalIcao == 'OEDF'&& intSqkCode == 5478){
      intSqkCode = 5301;
    }else if(finalIcao == 'OEJN'&& intSqkCode == 3178){
      intSqkCode = 3500;
    }else if(finalIcao == 'OEJN'&& intSqkCode == 3578){
      intSqkCode = 3100;
    }else if(finalIcao == 'OERK'&& intSqkCode == 6178){
      intSqkCode = 6231;
    }else if(finalIcao == 'OERK'&& intSqkCode == 6278){
      intSqkCode = 6131;
    }else if(finalIcao == 'OEMA'&& intSqkCode == 3578){
      intSqkCode = 3500;
    }
    
  }
  void _incrementCounterVfr() {
    
    setState(() {
      vfrSqkCode++;
    });
    if(finalIata == 'DMM' && vfrSqkCode == 1708 ){
      vfrSqkCode = 1701;
    }else if(finalIata == 'JED' && vfrSqkCode == 0578 ){
      vfrSqkCode = 0570;
    }else if(finalIata == 'RUH' && vfrSqkCode == 0378 ){
      vfrSqkCode = 0371;
    }else if(finalIata == 'MED' && vfrSqkCode == 0578 ){
      vfrSqkCode = 0570;
    }
    
    
  }
  @override
  Widget build(BuildContext context) {
    
    String finalVfrSqkCode = '0$vfrSqkCode';
    if(finalVfrSqkCode.length >= 5) {finalVfrSqkCode = finalVfrSqkCode.substring(1);}
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(finalIata),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[700],
      ),
       body: Center(
         child: ListView(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.airplanemode_active),
                title: Text(finalName , style: TextStyle(color:Colors.black),),
              ),
              ListTile(
                leading: Icon(Icons.photo_album),
                title: Text(finalIcao , style: TextStyle(color:Colors.black),),
              ),Divider(),
              ListTile(
                leading: Icon(Icons.radio),
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text('Domestic' , style: TextStyle(color:Colors.black),),
                        RaisedButton(color: Colors.green[600],child: Text('$domSqkCode' , style: TextStyle(color:Colors.white),),onPressed: (){
                           _incrementCounterDom();
                          print("$finalIata Dom $domSqkCode");
                        },),
                      ],
                    ),
                    SizedBox(width:40),
                    Column(
                      children: [
                        Text('International' , style: TextStyle(color:Colors.black),),
                        RaisedButton(color: Colors.green[600],child: Text('$intSqkCode' , style: TextStyle(color:Colors.white),),onPressed: (){
                          _incrementCounterInt();
                          print("Int $intSqkCode");
                          
                        },),
                      ],
                    ),
                    SizedBox(width:40),
                    Column(
                      children: [
                        Text('VFR' , style: TextStyle(color:Colors.black),),
                        RaisedButton(color: Colors.green[600],child: Text('$finalVfrSqkCode',style: TextStyle(color:Colors.white),),onPressed: (){
                          _incrementCounterVfr();
                          print('VFR $vfrSqkCode');
                        },),
                      ],
                    ),
                    SizedBox(width:40),
                    //RaisedButton(onPressed: (){_reset();})
                  ],
                ),
              ),Divider(),
              ListTile(
                leading: Icon(Icons.flight_takeoff),
                title: Text('Initial Climb \n$finalInitialClimb' , style: TextStyle(color:Colors.black),),
              ),
               ListTile(
                leading: Icon(Icons.flight_land),
                title: Text('Final Descend \n$finalFinalDescend' , style: TextStyle(color:Colors.black),),
              ),
            ],
          ),
       ),
      
    
    );
  }
}