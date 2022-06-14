import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trivia/providers/game_page_provider.dart';

class HomePage extends StatelessWidget {
  double? _deviceHeight, _deviceWidth;
  GamePageProvider? _pageProvider;
  final String difficultylevel;

  HomePage({required this.difficultylevel});

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider(
      create: (_context) => GamePageProvider(
          context: context,
          difficultylevel:
              difficultylevel), //initiates a new instance of game object
      child: _buildUI(),
    );
  }

  Widget _buildUI() {
    return Builder(
      builder: (_context) {
        _pageProvider = _context.watch<GamePageProvider>();
        if (_pageProvider!.questions != null) {
          return Scaffold(
            body: SafeArea(
              child: Container(
                padding:
                    EdgeInsets.symmetric(horizontal: _deviceHeight! * 0.05),
                child: _gameUI(),
              ),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(color: Colors.white),
          );
        }
      },
    );
  }

  Widget _gameUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _question(),
        Column(
          children: [
            _trueButton(),
            SizedBox(
              height: 10,
            ),
            _FalseButton(),
          ],
        ),
      ],
    );
  }

  Widget _question() {
    return Text(
      _pageProvider!.getCurrentText(),
      style: const TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.w300),
    );
  }

  Widget _trueButton() {
    return MaterialButton(
      onPressed: () {
        _pageProvider?.answerQuestion("True");
      },
      color: Colors.green,
      minWidth: _deviceWidth! * 0.80,
      height: _deviceHeight! * 0.15,
      child: const Text(
        "True",
        style: TextStyle(color: Colors.white, fontSize: 25),
      ),
    );
  }

  Widget _FalseButton() {
    return MaterialButton(
      onPressed: () {
        _pageProvider?.answerQuestion("False");
      },
      color: Colors.red,
      minWidth: _deviceWidth! * 0.80,
      height: _deviceHeight! * 0.15,
      child: const Text(
        "False",
        style: TextStyle(color: Colors.white, fontSize: 25),
      ),
    );
  }
}
