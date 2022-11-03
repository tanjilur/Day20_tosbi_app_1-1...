import 'package:day20/secondpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  String img =
      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60";
  int value = 0;

  SharedPreferences? preferences;
  Future increment() async {
    preferences = await SharedPreferences.getInstance();
    setState(() {
      value++;
      preferences!.setInt("naamDilam", value);
      preferences!.setString("name", "Tanju");
      print("The Value is ${preferences!.getInt("naamdilam")}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //return increment();
          increment();
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Image.network(
              "${img}",
              height: 250,
              width: 250,
            ),
            Text("The value is $value"),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: (() {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: ((context) => SecondPage())));
              }),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.pink),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Text(
                  "Go page 2",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
