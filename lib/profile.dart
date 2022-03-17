import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:parsing/_json.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final List<String> numbers = [
    "Article",
    "Article",
    "Article",
  ];

  late String _nama = "";
  late String _umur = "";
  late String _github = "";
  List _hobi = [];

  Future _loadSampleJson() async {
    String jsonString = await rootBundle.loadString("assets/sample.json");
    final jsonData = json.decode(jsonString);
    Sample sample = Sample.fromJson(jsonData);
    setState(() {
      _nama = sample.name.toString();
      _umur = sample.age.toString();
      _github = sample.github!.username.toString();
      _hobi = sample.hobi!.toList();
    });
  }

  void initState() {
    _loadSampleJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Profile Akbar Ginanjar")),
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 460,
                    height: 70,
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(0, 1), // changes position of shadow
                          )
                        ],
                        gradient:
                            LinearGradient(colors: [Colors.black, Colors.blue]),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text("Nama : " + _nama,
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                  ),
                  Container(
                    width: 450,
                    height: 70,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(0, 1), // changes position of shadow
                          )
                        ],
                        gradient:
                            LinearGradient(colors: [Colors.black, Colors.blue]),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text("Umur : " + _umur,
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                  ),
                  Container(
                    width: 460,
                    height: 170,
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(0, 1), // changes position of shadow
                          )
                        ],
                        gradient:
                            LinearGradient(colors: [Colors.black, Colors.blue]),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text("Github : " + _github + "\nRepository : 100",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          )),
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 17.0, vertical: 30.0),
                    height: MediaQuery.of(context).size.height * 0.30,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: numbers.length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Card(
                              color: Colors.blue,
                              child: Container(
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey,
                                        spreadRadius: 1,
                                        blurRadius: 5,
                                        offset: Offset(
                                            0, 1), // changes position of shadow
                                      )
                                    ],
                                    gradient: LinearGradient(
                                        colors: [Colors.black, Colors.blue]),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Center(
                                    child: Text(
                                  _hobi[index].toString(),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 30.0),
                                )),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
