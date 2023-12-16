import 'package:covid_tracker/View/world_details.dart';
import 'package:covid_tracker/services/api_call.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

import '../model/world_states_model.dart';
class worldscreen extends StatefulWidget{
  @override
  State<worldscreen> createState() => _worldscreenState();
}
class _worldscreenState extends State<worldscreen> with TickerProviderStateMixin{
  late AnimationController _animationController=AnimationController(vsync: this,duration: Duration(seconds: 3))..repeat();
  final color=[
    Colors.red,
    Colors.green,
    Colors.blue
  ];
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    apicall call=apicall();
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
            future: call.getdata(),
            builder: (context,AsyncSnapshot<WorldStatesModel> snapsort){
              if(snapsort.hasData){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 300,
                        width: MediaQuery.of(context).size.width,
                        child: PieChart(dataMap: {
                          "Death": double.parse(snapsort.data!.deaths.toString()),
                          "Recoverd":double.parse(snapsort.data!.recovered.toString()),
                          "Total":double.parse(snapsort.data!.cases.toString()),
                        },
                          animationDuration: Duration(seconds: 2),
                          chartType: ChartType.ring,
                          chartValuesOptions: ChartValuesOptions(
                            showChartValuesInPercentage: true,
                          ),
                          legendOptions: LegendOptions(
                            legendPosition: LegendPosition.left,
                            legendShape: BoxShape.rectangle,
                            legendTextStyle: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          colorList: color,),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 360,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              box(title: "Updated", value: snapsort.data!.updated.toString()),
                              box(title: "Cases", value: snapsort.data!.cases.toString()),
                              box(title: "Today Cases", value: snapsort.data!.todayCases.toString()),
                              box(title: "Deaths", value: snapsort.data!.deaths.toString()),
                              box(title: "Today Deaths", value: snapsort.data!.todayDeaths.toString()),
                              box(title: "Recovered", value: snapsort.data!.recovered.toString()),
                              box(title: "Today Recovered", value: snapsort.data!.todayRecovered.toString()),
                              box(title: "Active", value: snapsort.data!.active.toString()),
                              box(title: "Critical", value: snapsort.data!.critical.toString()),
                              box(title: "Cases Per-One Million", value: snapsort.data!.casesPerOneMillion.toString()),
                              box(title: "Deaths Per-One Million", value: snapsort.data!.deathsPerOneMillion.toString()),
                              box(title: "Tests", value: snapsort.data!.tests.toString()),
                              box(title: "Tests Per-One Million", value: snapsort.data!.testsPerOneMillion.toString()),
                              box(title: "Population", value: snapsort.data!.population.toString()),
                              box(title: "One Case Per People", value: snapsort.data!.oneCasePerPeople.toString()),
                              box(title: "One Death Per People", value: snapsort.data!.oneDeathPerPeople.toString()),
                              box(title: "One Test Per People", value: snapsort.data!.oneTestPerPeople.toString()),
                              box(title: "Active Per One Million", value: snapsort.data!.activePerOneMillion.toString()),
                              box(title: "Recovered Per One Million", value: snapsort.data!.recoveredPerOneMillion.toString()),
                              box(title: "Critical Per One Million", value: snapsort.data!.criticalPerOneMillion.toString()),
                              box(title: "Affected Countries", value:snapsort.data!.affectedCountries.toString()),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 40,
                        child: ElevatedButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>world_scroll()));
                            },
                            child:Text("Track Countries"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            )
                        ),
                      )
                    ],
                  ),
                );
              }
              else{
                return Center(
                  child: SpinKitRotatingPlain(
                    color: Colors.lightGreenAccent,
                    size: 50,
                  ),
                );
              }
        })/*Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 400,
                width: MediaQuery.of(context).size.width,
                child: PieChart(dataMap: {
                  "Death": 50,
                  "Recoverd":10,
                  "Total":60,
                },
                animationDuration: Duration(seconds: 2),
                chartType: ChartType.ring,
                  legendOptions: LegendOptions(
                    legendPosition: LegendPosition.left,
                    legendShape: BoxShape.rectangle,
                    legendTextStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                colorList: color,),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      box(title: "title", value: 200),
                      box(title: "title", value: 200),
                      box(title: "title", value: 200),
                      box(title: "title", value: 200),
                      box(title: "title", value: 200),
                      box(title: "title", value: 200),
                      box(title: "title", value: 200),
                      box(title: "title", value: 200),
                      box(title: "title", value: 200),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 40,
                child: ElevatedButton(
                    onPressed: (){},
                    child:Text("Track Countries"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  )
                ),
              )
            ],
          ),
        ),*/
      ),
    );
  }
}
class box extends StatelessWidget{
  final String title;
  final String value;
  box({required this.title,required this.value});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
        //color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title.toString(),style: TextStyle(color: Colors.white),),
              Text(value.toString(),style: TextStyle(color: Colors.white))
            ],
          ),
        ),
      );
  }
}