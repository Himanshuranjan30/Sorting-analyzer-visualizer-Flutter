import 'package:flutter/material.dart';

class Visual extends StatefulWidget {
  @override
  _VisualState createState() => _VisualState();
}

class _VisualState extends State<Visual> {
  var a = [100, 90, 30, 1, 4, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  Future<void> bubblesort() async {
    //var a = [5,4,3,2,1];
    for (var i = 0; i < a.length; i++) {
      bool swaped = false;
      for (var j = i + 1; j < a.length; j++) {
        if (a[i] > a[j]) {
          var tmp = a[i];
          a[i] = a[j];
          a[j] = tmp;
          swaped = true;
        }
        await Future.delayed(const Duration(microseconds: 5000), () {
          setState(() {
            a = a;
          });
        });
      }
      if (!swaped) break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: a.map((val) => _widget(val.toDouble())).toList()),
          ),
          FlatButton.icon(
              onPressed: () => bubblesort(),
              icon: Icon(Icons.ac_unit),
              label: Text('Visualize')),
        ],
      ),
    ));
  }
}

Widget _widget(double h) {
  return Container(
      height: h, width: 10, decoration: BoxDecoration(color: Colors.black));
}
