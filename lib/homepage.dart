import 'package:final_07610426/models/animal_item.dart';
import 'package:final_07610426/models/api_animal.dart';
import 'package:final_07610426/puzzle_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';//กดหลอดไฟสีแดงตรง class stateless เอา material
import 'package:http/http.dart' as http;
import 'dart:convert';

class Homepage extends StatefulWidget {
  //พิมพ์stl ได้stateless

  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomePageState();
}

class _HomePageState extends State<Homepage> {
  //late int _puzzelIndex = 1;

  @override
  void initState() {
    super.initState();
    _handleClickButton();
  }


  @override
  Widget build(BuildContext context) {
    var animalItem = PuzzleData.list[1];

    return Scaffold(
      appBar: AppBar(
          title: Text('Flutter Food')
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [Colors.amberAccent,Colors.white],
                radius: 1.0;
              )
            ),
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 1.7,
                  child: Image.network(
                      animalItem.image_url,
                      height: 30.0,
                  ),
                ),
                Text(
                  
                  '${animalItem.choice_list}',
                )
              ],

            ),
          )
        ],
      ),
    );
  }


  _handleClickButton() async {
    final url = Uri.parse('https://cpsu-test-api.herokuapp.com/quizzes');
    var result = await http.get(url, headers: {'id': '07610426'});

    print(result.body);
    /*result.then((response) {
      print(response.body);
    });*///asynchronous programming
    var json = jsonDecode(result.body);
    var apiAnimal = ApiAnimal.fromJson(json);

    //print('Status: $status,Message: $message,Number: ${data.length}');

    setState(() {
      PuzzleData.list = apiAnimal.data
          .map<AnimalItem>((item) => AnimalItem.fromJson(item))
          .toList();

      /*for (var element in apiResult.data) {
        var foodItem = FoodItem.fromJson(element);
        _foodData.add(foodItem);
      }*/
    });
  }

}




