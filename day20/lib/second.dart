import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Secondpagee extends StatefulWidget {
  const Secondpagee({Key? key}) : super(key: key);

  @override
  State<Secondpagee> createState() => _SecondpageeState();
}

class _SecondpageeState extends State<Secondpagee> {
  int? x;
  SharedPreferences? preferences;
  getsharedPrefenanceData() async {
    preferences = await SharedPreferences.getInstance();
    setState(() {
      x = preferences!.getInt("value");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getsharedPrefenanceData();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("$x")),
    );
  }
}
