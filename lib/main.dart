import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(title: "Contador de Pessoas", home: Home()));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int people = 0;
  String text = "Pode entrar!";

  void changePeople(int num) {
    setState(() {
      people += num;
      if (people < 0)
        text = "Eita...";
      else if (people == 0)
      {
        text = "Vazio!";
      }
      else if (people > 50)
      {
        text = "Olha o covid!";
      }
      else
        text = "Pode entrar de boa!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/imagem.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Text("Pessoas: $people",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: FlatButton(
                  child: Text("+1",
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                      )),
                  onPressed: () {
                    changePeople(1);
                    debugPrint("+1");
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: FlatButton(
                  child: Text("-1",
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                      )),
                  onPressed: () {
                    changePeople(-1);
                    debugPrint("-1");
                  },
                ),
              ),
            ],
          ),
          Text(text,
              style: TextStyle(
                  color: Colors.blue,
                  fontStyle: FontStyle.italic,
                  fontSize: 40))
        ])
      ],
    );
  }
}
