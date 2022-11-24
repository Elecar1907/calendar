import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _emailForm = GlobalKey<FormState>();
  var _codeForm = GlobalKey<FormState>();
  var authCode = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("yoyoyoyo"),
      ),
      body: authCode > 0 ? codeForm() : emailForm(),
    );
  }

  Form emailForm() {
    return Form(
      key: _emailForm,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                width: 300,
                child: TextFormField(
                  validator: (value) => value!.isEmpty
                      ? "correoooo"
                      : EmailValidator.validate(value)
                          ? null
                          : "correo incorrecto",
                  decoration: InputDecoration(labelText: "email"),
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                  onPressed: () {
                    if (_emailForm.currentState!.validate()) {
                      setState(() {
                        authCode = 3333;
                      });
                    }
                  },
                  child: Text("entrar")),
            )
          ],
        ),
      ),
    );
  }

  Form codeForm() {
    return Form(
      key: _codeForm,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "checa tu correo",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
                width: 100,
                child: TextFormField(
                  validator: (value) =>
                      authCode > 0 && int.tryParse(value!) == authCode
                          ? null
                          : "incorrecto",
                  keyboardType: TextInputType.number,
                  maxLength: 4,
                  decoration: InputDecoration(labelText: "codigo"),
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                  onPressed: () {
                    if (_codeForm.currentState!.validate()) {
                      print("amonos");
                    }
                  },
                  child: Text("entrar")),
            )
          ],
        ),
      ),
    );
  }
}
/* 
class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
 */