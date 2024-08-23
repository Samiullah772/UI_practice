import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:property_app/models/personModel.dart';
import 'package:property_app/models/userData.dart';
import 'package:http/http.dart' as http;
class detai_Screen extends StatefulWidget {
  const detai_Screen({Key? key}) : super(key: key);

  @override
  State<detai_Screen> createState() => _detai_ScreenState();
}




class _detai_ScreenState extends State<detai_Screen> {
  List<PersonModel> personData = [];
  //List<UserData> userdata = [];

  Future<List<PersonModel>> getDate()async{
    final response = await http.get(Uri.parse('http://localhost:3003/person'));
    var data = jsonDecode(response.body.toString());

    if(response.statusCode == 200){;
      for(Map<String,dynamic> i in data){
        personData.add(PersonModel.fromJson(i));
      }
      return personData;
    }
    return personData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Hello")
      ),
      body: Column(
        children: [
           Expanded(
             child: FutureBuilder(
                          future: getDate(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return const Center(child: Text("Loading"),);
                            } else {
                              return ListView.builder(itemCount: personData.length,
                                  itemBuilder: (context,index) {
                                    return ListTile(
                                      title: Text(personData[index].name.toString()),
                                      subtitle: Text(personData[index].department.toString()),
                                    );
                                  });
                            }
                          }
                   
                      ),
           ),
        ],
      ),
    );
  }
}