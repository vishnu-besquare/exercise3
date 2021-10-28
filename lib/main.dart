import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Pageee'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controllerName = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();

  bool buttonEnable = false;

  String dropdownValue = 'Male';

  @override
  void initState() {
    controllerName.addListener(_ifSignUpValid);
    controllerEmail.addListener(_ifSignUpValid);
    controllerPassword.addListener(_ifSignUpValid);
    super.initState();
  }

  void _ifSignUpValid() {
    setState(() {
      if (controllerName.text.isNotEmpty &&
          controllerEmail.text.isNotEmpty &&
          controllerPassword.text.isNotEmpty) {
        buttonEnable = true;
      } else {
        buttonEnable = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.only(top: 30),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Welcome',
                    style: TextStyle(
                      fontSize: 30,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.network(
                    'https://farm1.staticflickr.com/593/23119034953_319cd75283_z.jpg'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                  ),
                  controller: controllerName,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                  controller: controllerEmail,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                  controller: controllerPassword,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Container(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                        value: dropdownValue,
                        isExpanded: true,
                        icon: const Icon(Icons.arrow_drop_down),
                        iconSize: 24,
                        elevation: 16,
                        style: const TextStyle(color: Colors.black),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                        items: <String>['Male', 'Female', 'Rather not say']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList()),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.grey),
                    child: Text('Hello'),
                    onPressed: !buttonEnable
                        ? null
                        : () {
                            final snackBar =
                                SnackBar(content: const Text('SignUp Success'));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                            controllerName.clear();
                            controllerEmail.clear();
                            controllerPassword.clear();
                          }),
              ),
            ],
          ),
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
