import 'package:flutter/material.dart';

class PollutionCitiesDetails extends StatelessWidget {
 var polutedState;

  PollutionCitiesDetails({Key? key, required this.polutedState}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${polutedState.country} - Polluted Cities'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(width: MediaQuery.of(context).size.width,
            child: DataTable(  headingRowColor: MaterialStateProperty.all(Color.fromARGB(255, 237, 205, 26)),
            dataRowColor: MaterialStateProperty.all(Colors.grey[200]),
            headingTextStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,),
              columns: const [
                DataColumn(label: Text('Rank')),
                DataColumn(label: Text('State')),
                DataColumn(label: Text('AQI')),
              ],
              rows: List.generate(polutedState.statemodel.length, (index) {
                final city = polutedState.statemodel[index];
                return DataRow(cells: [
                  DataCell(Text((index + 1).toString())), // Rank
                  DataCell(Text(city.state)), // State
                  DataCell(Text(city.aqi.toString())), // AQI
                ]);
              }),
            ),
          ),
        ),
      ),
    );
  }
}
