import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // demonstration purposes and to simplify this example.
  final form = FormGroup(
    {'array': FormControl()},
  );

  int bubble = 0;
  int insertion = 0;
  int selection = 0;
  int heap = 0;
  String get name => this.form.control('array').value;

  List<int> a;
  void bubblesort(List a) {
    Stopwatch stopwatch1 = new Stopwatch()..start();
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
      }
      if (!swaped) break;
    }
    int stop = stopwatch1.elapsedMicroseconds;
    setState(() {
      bubble = stop;
    });
  }

  void insertionsort(List a) {
    Stopwatch stopwatch2 = new Stopwatch()..start();
    for (var i = 0; i < a.length; i++) {
      var x = a[i], j = i;

      while (j > 0 && a[j - 1] > x) {
        a[j] = a[j - 1];
        a[j - 1] = x;
        j--;
      }

      a[j] = x;
    }
    int stop = stopwatch2.elapsedMicroseconds;
    setState(() {
      insertion = stop;
    });
  }

  void selectionsort(List a) {
    Stopwatch stopwatch3 = new Stopwatch()..start();
    for (var i = a.length - 1; i >= 0; i--) {
      var first = 0, tmp;

      for (var j = 1; j <= i; j++) {
        if (a[j] > a[first]) first = j;
      }

      tmp = a[first];
      a[first] = a[i];
      a[i] = tmp;
    }
    int stop = stopwatch3.elapsedMicroseconds;
    setState(() {
      selection = stop;
    });
  }

  void heapify(List list, int n, int i) {
    int largest = i;
    int l = 2 * i + 1;
    int r = 2 * i + 2;

    if (l < n && list[l] > list[largest]) {
      largest = l;
    }

    if (r < n && list[r] > list[largest]) {
      largest = r;
    }

    if (largest != i) {
      swapList(list, i, largest);
      heapify(list, n, largest);
    }
  }

  void swapList(List list, int i, int largest) {
    int swap = list[i];
    list[i] = list[largest];
    list[largest] = swap;
  }

  void swap(List list, int i) {
    int temp = list[0];
    list[0] = list[i];
    list[i] = temp;
  }

  void heapSort(List list) {
    Stopwatch stopwatch4 = new Stopwatch()..start();
    int n = list.length;
    for (int i = (n ~/ 2); i >= 0; i--) {
      heapify(list, n, i);
    }

    for (int i = n - 1; i >= 0; i--) {
      swap(list, i);
      heapify(list, i, 0);
    }
    int stop = stopwatch4.elapsedMicroseconds;
    setState(() {
      heap = stop;
    });
  }

  
  change() {
    a = [];
    
    final values = name.split(',');
    values.forEach((element) {
      a.add(int.parse(element));
    });
  }

  @override
  Widget build(BuildContext context) {
    print(heap);
    change();
    print(a);

    return Scaffold(
      body: Container(
        child: Column(children: <Widget>[
          ReactiveForm(
            formGroup: this.form,
            child: Column(
              children: <Widget>[
                ReactiveTextField(
                  formControlName: 'array',
                ),
              ],
            ),
          ),
          SizedBox(height: 50),
          Text('Bubble sort' + bubble.toString()),
          Text('Heap sort' + heap.toString()),
          Text('Selection sort' + selection.toString()),
          Text('Insertion sort' + insertion.toString()),
          
          FlatButton.icon(
              onPressed: () {
                bubblesort(a);
                heapSort(a);
                selectionsort(a);
                insertionsort(a);
              },
              icon: Icon(Icons.crop_rotate),
              label: Text('COMPUTE NOW')),
        ]),
      ),
    );
  }
}
