import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  int? x;
  String? name;
  SharedPreferences? preferences;
  getSharedPrefenenceData() async {
    preferences = await SharedPreferences.getInstance();
    setState(() {
      x = preferences!.getInt("naamDilam");
      name = preferences?.getString("name");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getSharedPrefenenceData();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("$x $name")),
    );
  }
}
