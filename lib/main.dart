import 'package:deixei_aqui/models/object_item.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: AnimatedSplashScreen(
            duration: 3000,
            splash: Image.asset(
              "assets/icon/playstore.jpg",
              fit: BoxFit.cover,
            ),
            nextScreen: MyHomePage(title: "Deixei aqui!"),
            splashTransition: SplashTransition.fadeTransition,
            //pageTransitionType: PageTransitionType.scale,
            backgroundColor: Colors.white));
    //const MyHomePage(title: 'Deixei aqui!'),
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final _formKey = GlobalKey<FormState>();
  List<object_item> listObject  =  List.empty();
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Scrollbar(
        child: ListView(
          restorationId: 'list_demo_list_view',
          padding: const EdgeInsets.symmetric(vertical: 8),
          children: [
            for (int index = 1; index < 3; index++)
              ListTile(
                  leading: ExcludeSemantics(
                    child: CircleAvatar(child: Text('$index')),
                  ),
                  title: Text("teste 1"),
                  subtitle: Text("teste 2")),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        //onPressed: _incrementCounter,
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Stack(
                    overflow: Overflow.visible,
                    children: <Widget>[
                      Positioned(
                        right: -40.0,
                        top: -40.0,
                        child: InkResponse(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: CircleAvatar(
                            child: Icon(Icons.close),
                            backgroundColor: Colors.red,
                          ),
                        ),
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  icon: Icon(Icons.emoji_objects),
                                  hintText: 'Objeto que quer guardar',
                                  labelText: 'Nome Objeto *',
                                ),
                                onSaved: (String? value) {
                                  // This optional block of code can be used to run
                                  // code when the user saves the form.
                                },
                                validator: (String? value) {
                                  return (value != null && value.contains('@'))
                                      ? 'Do not use the @ char.'
                                      : null;
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  icon: Icon(Icons.search),
                                  hintText: 'Dica para lembrar',
                                  labelText: 'Onde está?',
                                ),
                                onSaved: (String? value) {
                                  // This optional block of code can be used to run
                                  // code when the user saves the form.
                                },
                                validator: (String? value) {
                                  return (value != null && value.contains('@'))
                                      ? 'Do not use the @ char.'
                                      : null;
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextFormField(
                                obscureText: true,
                                decoration: const InputDecoration(
                                  icon: Icon(Icons.search),
                                  hintText: 'Sua senha padrão',
                                  labelText: 'Senha',
                                ),
                                onSaved: (String? value) {
                                  // This optional block of code can be used to run
                                  // code when the user saves the form.
                                },
                                validator: (String? value) {
                                  return (value != null && value.contains('@'))
                                      ? 'Do not use the @ char.'
                                      : null;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RaisedButton(
                                child: Text("Submitß"),
                                onPressed: () {
                                  final form = _formKey.currentState;
                                  if (form != null && !form.validate()) {
                                    form.save();
                                  }
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              });
        },
        tooltip: 'Adicionar Objeto',
        child: const Icon(Icons.add),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
