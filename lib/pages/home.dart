import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _stars = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Titulo qualquer'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: buildIconV2(5),
          ),
          SizedBox(
            height: 10,
          ),
          _stars > 0
              ? Text(
                  'Você tem $_stars estrelas',
                  style: TextStyle(fontSize: 24),
                )
              : Text(
                  'Você não tem nenhuma estrela',
                  style: TextStyle(fontSize: 24),
                ),
          SizedBox(
            height: 10,
          ),
          FaIcon(
            reaction(),
            size: 35,
          ),
        ],
      ),
    );
  }

  IconData reaction() {
    switch (_stars) {
      case 1:
        return FontAwesomeIcons.angry;
      case 2:
        return FontAwesomeIcons.frown;
      case 3:
        return FontAwesomeIcons.meh;
      case 4:
        return FontAwesomeIcons.smile;
      case 5:
        return FontAwesomeIcons.grinHearts;
      default:
        return FontAwesomeIcons.questionCircle;
    }
  }

  Widget buildIcon(int valor) {
    var preenchida = _stars >= valor;
    return InkWell(
      onTap: () {
        setState(() => _stars = valor);
      },
      child: Icon(
        preenchida ? Icons.star : Icons.star_border,
        size: 35,
        color: preenchida ? Colors.red : Colors.grey,
      ),
    );
  }

  List<Widget> buildIconV2(int stars) {
    var widgets = <Widget>[];
    for (var i = 1; i <= stars; i++) {
      var preenchida = _stars >= i;

      widgets.add(
        InkWell(
          onTap: () {
            setState(
              () {
                if (i == 1 && _stars == 1) {
                  _stars = 0;
                } else {
                  _stars = i;
                }
              },
            );
          },
          child: Icon(
            preenchida ? Icons.star : Icons.star_border,
            size: 35,
            color: preenchida ? Colors.red : Colors.grey,
          ),
        ),
      );
    }

    return widgets;
  }
}
