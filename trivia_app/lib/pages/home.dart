import 'package:flutter/material.dart';
import 'package:trivia/pages/home_page.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double? _deviceHeight, _deviceWidth;

  double _currentDifficultyLevel = 0;

  final List<String> _difficultyTexts = ["Easy", "Medium", "Hard"];

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: _deviceWidth! * 0.10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              _appTitle(),
              _diffSlider(),
              _startbutton(),
            ],
          ),
        ),
      )),
    );
  }

  Widget _appTitle() {
    return Column(
      children: [
        const Text(
          "Trivia",
          style: TextStyle(
              fontSize: 50, color: Colors.yellow, fontWeight: FontWeight.w400),
        ),
        Text(
          _difficultyTexts[_currentDifficultyLevel.toInt()],
          style: const TextStyle(
              fontSize: 22, color: Colors.black87, fontWeight: FontWeight.w200),
        ),
      ],
    );
  }

  Widget _diffSlider() {
    return Slider(
        label: "Difficulty",
        min: 0,
        max: 2,
        divisions: 2,
        value: _currentDifficultyLevel,
        onChanged: (_value) {
          setState(() {
            _currentDifficultyLevel = _value;
            //print(_currentDifficultyLevel);
          });
        });
  }

  Widget _startbutton() {
    return MaterialButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext _context) {
              return HomePage(
                difficultylevel:
                    _difficultyTexts[_currentDifficultyLevel.toInt()]
                        .toLowerCase(),
              );
            },
          ),
        );
      },
      color: Colors.amberAccent,
      minWidth: _deviceWidth! * 0.80,
      height: _deviceHeight! * 0.10,
      child: const Text(
        "START",
        style: TextStyle(
            color: Colors.black54, fontWeight: FontWeight.w600, fontSize: 35),
      ),
    );
  }
}
