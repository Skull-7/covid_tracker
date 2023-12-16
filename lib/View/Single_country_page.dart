import 'package:covid_tracker/View/world_screen.dart';
import 'package:flutter/material.dart';
class seperate_country_page extends StatelessWidget{
  String updated;
  String flag;
  String country;
  String shortForm;
  String lat;
  String long;
  String cases;
  String todayCases;
  String deaths;
  String todayDeaths;
  String recovered;
  String todayRecovered;
  String active;
  String critical;
  String casesPerOneMillion;
  String deathsPerOneMillion;
  String tests;
  String testsPerOneMillion;
  String population;
  String continent;
  String oneCasePerPeople;
  String oneDeathPerPeople;
  String oneTestPerPeople;
  String activePerOneMillion;
  String recoveredPerOneMillion;
  String criticalPerOneMillion;
  seperate_country_page({
    required this.updated,
    required this.country,
    required this.flag,
    required this.shortForm,
    required this.lat,
    required this.long,
    required this.cases,
    required this.todayCases,
    required this.deaths,
    required this.todayDeaths,
    required this.recovered,
    required this.todayRecovered,
    required this.active,
    required this.critical,
    required this.casesPerOneMillion,
    required this.deathsPerOneMillion,
    required this.tests,
    required this.testsPerOneMillion,
    required this.population,
    required this.continent,
    required this.oneCasePerPeople,
    required this.oneDeathPerPeople,
    required this.oneTestPerPeople,
    required this.activePerOneMillion,
    required this.recoveredPerOneMillion,
    required this.criticalPerOneMillion});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(country),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Image(image: NetworkImage(flag.toString()),
                  height: 250,
                  width: 300,),
          ),
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  box(title:"Updated" , value: updated.toString()),
                  box(title:"Country" , value: country.toString()),
                  box(title:"ShortForm" , value: shortForm.toString()),
                  box(title:"LAT" , value: lat.toString()),
                  box(title:"LONG" , value: long.toString()),
                  box(title:"Cases" , value: cases.toString()),
                  box(title:"Today Cases" , value: todayCases.toString()),
                  box(title:"Deaths" , value: deaths.toString()),
                  box(title:"Today Deaths" , value: todayDeaths.toString()),
                  box(title:"Recovered" , value: recovered.toString()),
                  box(title:"Today Recovered" , value: todayRecovered.toString()),
                  box(title:"Active" , value: active.toString()),
                  box(title:"Cases Per One Million" , value: casesPerOneMillion.toString()),
                  box(title:"Deaths Per One Million" , value: deathsPerOneMillion.toString()),
                  box(title:"Tests" , value: tests.toString()),
                  box(title:"Tests Per One Million" , value: testsPerOneMillion.toString()),
                  box(title:"Population" , value: population.toString()),
                  box(title:"Continent" , value: continent.toString()),
                  box(title:"One Case Per People" , value: oneCasePerPeople.toString()),
                  box(title:"Tests Per One Million" , value: testsPerOneMillion.toString()),
                  box(title:"One Death Per People" , value: oneDeathPerPeople.toString()),
                  box(title:"One Test Per People" , value: oneTestPerPeople.toString()),
                  box(title:"Active Per One Million" , value: activePerOneMillion.toString()),
                  box(title:"Recovered Per One Million" , value: recoveredPerOneMillion.toString()),
                  box(title:"Critical Per One Million" , value: criticalPerOneMillion.toString()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}