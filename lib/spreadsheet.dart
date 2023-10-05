import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Spread extends StatefulWidget {
  const Spread({super.key});

  @override
  _SpreadState createState() => _SpreadState();
}

class _SpreadState extends State<Spread> {
  List<List<String>> spreadsheetData = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchDataFromSpreadsheet();
  }

  Future<void> fetchDataFromSpreadsheet() async {
    try {
      final response = await http.get(Uri.parse(
          'https://sheets.googleapis.com/v4/spreadsheets/1LiE4jy_3LPpxbpggx-NW_m6QTIJaMa-JTyQv5B7qEcY/values/Sheet1?key=AIzaSyCBlQM4MrWl5eV_MaEX7zaUckAdX_V4uXs'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['values'] != null && data['values'] is List) {
          final values = data['values'];
          setState(() {
            spreadsheetData = values
                .map<List<String>>((row) => (row as List<dynamic>).map((cell) => cell.toString()).toList())
                .toList();
            isLoading = false;
          });
        }
      } else {
        // Handle error if it occurs
        print('Error: ${response.statusCode}');
        setState(() {
          isLoading = false;
        });
      }
    } catch (error) {
      // Handle error if any
      print('Error: $error');
      setState(() {
        isLoading = false;
      });
    }
  }
@override
Widget build(BuildContext context) {
  return MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Data dari Spreadsheet'),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : spreadsheetData.isEmpty
              ? Center(
                  child: Text('Tidak ada data yang ditemukan.'),
                )
              : Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: List<DataColumn>.generate(
                          spreadsheetData[0].length,
                          (index) => DataColumn(
                            label: Text('Column ${index + 1}'),
                          ),
                        ),
                        rows: spreadsheetData.map((rowData) {
                          return DataRow(
                            cells: rowData.map((cellData) {
                              return DataCell(
                                Text(cellData),
                              );
                            }).toList(),
                          );
                        }).toList(),
                      ),
                    ),
                    // Add other widgets below the table if needed
                  ],
                ),
    ),
  );
}

}
