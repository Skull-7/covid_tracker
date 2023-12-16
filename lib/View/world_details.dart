import 'dart:convert';

import 'package:covid_tracker/View/Single_country_page.dart';
import 'package:covid_tracker/services/api_call.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:covid_tracker/services/utlities/app_url.dart';
import 'package:shimmer/shimmer.dart';

import '../model/country_detail_model.dart';

class world_scroll extends StatefulWidget{
  @override
  State<world_scroll> createState() => _world_scrollState();
}

class _world_scrollState extends State<world_scroll> {
  TextEditingController countryName=TextEditingController();
  @override
  Widget build(BuildContext context) {
    apiCountrycall countrydata=apiCountrycall();
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: countryName ,
                        onChanged: (value){
                          setState(() {

                          });
                        },
                        decoration: InputDecoration(
                          hintText: "Search Country by Name",
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(21),
                            borderSide: BorderSide(
                              color: Colors.white
                            )
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(21),
                          )
                        ),
                      ),
                    ),

                    FutureBuilder(
                      future: countrydata.getcountrydata(),
                      builder: (context,AsyncSnapshot<List<dynamic>> snapshot) {
                        if(snapshot.hasData){
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 600,
                              child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Container(
                                    height: 900,
                                    child: ListView.builder(
                                        itemCount: snapshot.data!.length,
                                        itemBuilder: (context,item){
                                          String country_name=snapshot.data![item]['country'];
                                          if(countryName.text.isEmpty){
                                            return ListTile(
                                              onTap: (){
                                                Navigator.push(context, MaterialPageRoute(
                                                    builder: (context)=>seperate_country_page(
                                                        updated: snapshot.data![item]['updated'].toString(),
                                                        country: snapshot.data![item]['country'].toString(),
                                                        flag: snapshot.data![item]['countryInfo']['flag'].toString(),
                                                        shortForm: snapshot.data![item]['countryInfo']['iso3'].toString(),
                                                        lat: snapshot.data![item]['countryInfo']['lat'].toString(),
                                                        long: snapshot.data![item]['countryInfo']['long'].toString(),
                                                        cases: snapshot.data![item]['cases'].toString(),
                                                        todayCases: snapshot.data![item]['todayCases'].toString(),
                                                        deaths: snapshot.data![item]['deaths'].toString(),
                                                        todayDeaths: snapshot.data![item]['todayDeaths'].toString(),
                                                        recovered: snapshot.data![item]['recovered'].toString(),
                                                        todayRecovered: snapshot.data![item]['todayRecovered'].toString(),
                                                        active: snapshot.data![item]['active'].toString(),
                                                        critical: snapshot.data![item]['critical'].toString(),
                                                        casesPerOneMillion: snapshot.data![item]['casesPerOneMillion'].toString(),
                                                        deathsPerOneMillion: snapshot.data![item]['deathsPerOneMillion'].toString(),
                                                        tests: snapshot.data![item]['tests'].toString(),
                                                        testsPerOneMillion: snapshot.data![item]['testsPerOneMillion'].toString(),
                                                        population: snapshot.data![item]['population'].toString(),
                                                        continent: snapshot.data![item]['continent'].toString(),
                                                        oneCasePerPeople: snapshot.data![item]['oneCasePerPeople'].toString(),
                                                        oneDeathPerPeople: snapshot.data![item]['oneDeathPerPeople'].toString(),
                                                        oneTestPerPeople: snapshot.data![item]['oneTestPerPeople'].toString(),
                                                        activePerOneMillion: snapshot.data![item]['activePerOneMillion'].toString(),
                                                        recoveredPerOneMillion: snapshot.data![item]['recoveredPerOneMillion'].toString(),
                                                        criticalPerOneMillion: snapshot.data![item]['criticalPerOneMillion'].toString())));
                                              },
                                              leading: Image(
                                                image: NetworkImage(snapshot.data![item]['countryInfo']['flag'].toString()),
                                                height: 50,
                                                width: 75,
                                                fit: BoxFit.fill,
                                              ),
                                              title: Text(snapshot.data![item]['country'].toString()),
                                              subtitle: Text(snapshot.data![item]['continent'].toString()),
                                              trailing: Icon(Icons.arrow_forward),
                                            );
                                          }else if(country_name.toLowerCase().contains(countryName.text.toLowerCase())){
                                            return ListTile(
                                              onTap: (){
                                                Navigator.push(context, MaterialPageRoute(
                                                    builder: (context)=>seperate_country_page(
                                                        updated: snapshot.data![item]['updated'].toString(),
                                                        country: snapshot.data![item]['country'].toString(),
                                                        flag: snapshot.data![item]['countryInfo']['flag'].toString(),
                                                        shortForm: snapshot.data![item]['countryInfo']['iso3'].toString(),
                                                        lat: snapshot.data![item]['countryInfo']['lat'].toString(),
                                                        long: snapshot.data![item]['countryInfo']['long'].toString(),
                                                        cases: snapshot.data![item]['cases'].toString(),
                                                        todayCases: snapshot.data![item]['todayCases'].toString(),
                                                        deaths: snapshot.data![item]['deaths'].toString(),
                                                        todayDeaths: snapshot.data![item]['todayDeaths'].toString(),
                                                        recovered: snapshot.data![item]['recovered'].toString(),
                                                        todayRecovered: snapshot.data![item]['todayRecovered'].toString(),
                                                        active: snapshot.data![item]['active'].toString(),
                                                        critical: snapshot.data![item]['critical'].toString(),
                                                        casesPerOneMillion: snapshot.data![item]['casesPerOneMillion'].toString(),
                                                        deathsPerOneMillion: snapshot.data![item]['deathsPerOneMillion'].toString(),
                                                        tests: snapshot.data![item]['tests'].toString(),
                                                        testsPerOneMillion: snapshot.data![item]['testsPerOneMillion'].toString(),
                                                        population: snapshot.data![item]['population'].toString(),
                                                        continent: snapshot.data![item]['continent'].toString(),
                                                        oneCasePerPeople: snapshot.data![item]['oneCasePerPeople'].toString(),
                                                        oneDeathPerPeople: snapshot.data![item]['oneDeathPerPeople'].toString(),
                                                        oneTestPerPeople: snapshot.data![item]['oneTestPerPeople'].toString(),
                                                        activePerOneMillion: snapshot.data![item]['activePerOneMillion'].toString(),
                                                        recoveredPerOneMillion: snapshot.data![item]['recoveredPerOneMillion'].toString(),
                                                        criticalPerOneMillion: snapshot.data![item]['criticalPerOneMillion'].toString())));
                                              },
                                              leading: Image(
                                                image: NetworkImage(snapshot.data![item]['countryInfo']['flag'].toString()),
                                                height: 50,
                                                width: 75,
                                                fit: BoxFit.fill,
                                              ),
                                              title: Text(snapshot.data![item]['country'].toString()),
                                              subtitle: Text(snapshot.data![item]['continent'].toString()),
                                              trailing: Icon(Icons.arrow_forward),
                                            );
                                          }else{
                                            return Container();
                                          }
                                        }),
                                  )),
                            ),
                          );
                        }else{
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 560,
                              child: ListView.builder(
                                  itemCount: 9,
                                  itemBuilder: (context,item){
                                    return Shimmer.fromColors(
                                      baseColor: Colors.grey.shade100,
                                      highlightColor: Colors.grey.shade700,
                                      child: ListTile(
                                        leading: Container(
                                          height: 50,
                                          width: 75,
                                          color: Colors.white,
                                        ),
                                        title: Container(
                                          height: 10,
                                          width: 75,
                                          color: Colors.white,
                                        ),
                                        subtitle: Container(
                                          height: 10,
                                          width: 75,
                                          color: Colors.white,
                                        ),
                                        trailing: Icon(
                                          Icons.arrow_forward
                                        ),
                                      ),
                                    );}
    ),
                            )
                          );

                        }
                      },
                    ),
                    ],
                ),
        )
          )
      );
  }
}