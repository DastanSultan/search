import 'dart:async';

import 'package:bool/main.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

TextEditingController name_city = TextEditingController();
List<String> citys = ['Mannheim', 'Hamburg', 'Leipzig'];
List<String> filter = [];
String names_city = '';
int num = 0;
Timer? timer;

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Искать твой город'),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              child: TextField(
                controller: name_city,
                onChanged: (value) {
                  setState(() {
                    names_city = name_city.text.toLowerCase();
                    filter = citys
                        .where(
                            (city) => city.toLowerCase().contains(names_city))
                        .toList();
                    print("$names_city");
                  });
                },
              ),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: filter.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyDev()));
                            });
                          },
                          child: Text(
                            '${filter[index]}',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      );
                    })),
      
         
          ],
        ),
      ),
    );
  }
}
