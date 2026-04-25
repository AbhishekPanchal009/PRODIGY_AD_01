import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController c1 = TextEditingController();
  TextEditingController c2 = TextEditingController();
  var v1 , v2 , ans = '' , res;
  
  add(){
    setState(() {
      v1 = int.tryParse(c1.text) ?? 0;
      v2 = int.tryParse(c2.text) ?? 0;
      res = v1 + v2 ;
      ans = res.toString();
    });
  }

  sub(){
    setState(() {
      v1 = int.tryParse(c1.text) ?? 0;
      v2 = int.tryParse(c2.text) ?? 0;
      res = v1 - v2 ;
      ans = res.toString();
    });
  }

  mul(){
    setState(() {
      v1 = int.tryParse(c1.text) ?? 0;
      v2 = int.tryParse(c2.text) ?? 0;
      res = v1 * v2 ;
      ans = res.toString();
    });
  }

  div(){
    setState(() {
      v1 = int.tryParse(c1.text) ?? 0;
      v2 = int.tryParse(c2.text) ?? 0;

      if (v2 == 0) {
        ans = "Cannot divide by 0";
      } else {
        res = v1 / v2;
        ans = res.toString();
      }
    });
  }
  clearAll() {
    setState(() {
      c1.clear();
      c2.clear();
      ans = '';
      res = 0;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: c1,
                decoration: InputDecoration(
                  labelText: 'Enter value 1',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                  )
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: c2,
                decoration: InputDecoration(
                  labelText: 'Enter value 2',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                  )
                ),
              ),
            ),
            SizedBox(height: 15),
            Text('Result: $ans',
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.red)
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){add();},
                    child: Text('+',style: TextStyle(fontSize: 30))),
                ElevatedButton(onPressed: (){sub();},
                    child: Text('-',style: TextStyle(fontSize: 30))),
                ElevatedButton(onPressed: (){mul();},
                    child: Text('*',style: TextStyle(fontSize: 30))),
                ElevatedButton(onPressed: (){div();},
                    child: Text('/',style: TextStyle(fontSize: 30)))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(onPressed: (){clearAll();},
                      child: Text('Clear',style: TextStyle(fontSize: 30),)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
