import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Spread extends StatefulWidget {
  const Spread({super.key});

  @override
  _SpreadState createState() => _SpreadState();
}

class _SpreadState extends State<Spread> {
  List<String> spreadsheetData = [];
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
                .map<String>((row) => (row as List<dynamic>).join(', '))
                .toList();
            isLoading = false;
          });
        }
      } else {
        // Handle kesalahan jika terjadi
        print('Error: ${response.statusCode}');
        setState(() {
          isLoading = false;
        });
      }
    } catch (error) {
      // Tangani kesalahan jika ada
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
        body: Center(
          child: isLoading
              ? const CircularProgressIndicator()
              : spreadsheetData.isEmpty
                  ? const Text('Tidak ada data yang ditemukan.')
                  : ListView.builder(
                      itemCount: spreadsheetData.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(spreadsheetData[index]),
                        );
                      },
                    ),
        ),
      ),
    );
  }
}
