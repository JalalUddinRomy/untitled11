import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

enum ButtonState { S, M, L, XL, XXL, XXXL }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  ButtonState _selectedButton = ButtonState.S;

  void _showSnackBarWithSizeText(ButtonState buttonState) {
    String sizeText;
    switch (buttonState) {
      case ButtonState.S:
        sizeText = "S";
        break;
      case ButtonState.M:
        sizeText = "M";
        break;
      case ButtonState.L:
        sizeText = "L";
        break;
      case ButtonState.XL:
        sizeText = "XL";
        break;
      case ButtonState.XXL:
        sizeText = "XXL";
        break;
      case ButtonState.XXXL:
        sizeText = "XXXL";
        break;
    }

    final snackBar = SnackBar(
      content: Text("Selected Size: $sizeText"),
      duration: Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _onButtonPressed(ButtonState buttonState) {
    setState(() {
      _selectedButton = buttonState;
    });

    _showSnackBarWithSizeText(buttonState);
  }

  ElevatedButton _buildSizeButton(ButtonState buttonState) {
    final isSelected = _selectedButton == buttonState;

    return ElevatedButton(
      onPressed: () => _onButtonPressed(buttonState),
      child: Text(
        buttonState.toString().split('.').last,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: isSelected ? Colors.blue : Colors.grey,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Size Selector"),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                _buildSizeButton(ButtonState.S),
                _buildSizeButton(ButtonState.M),
                _buildSizeButton(ButtonState.L),
                _buildSizeButton(ButtonState.XL),
              ],
            ),
            Row(
              children: [
                _buildSizeButton(ButtonState.XXL),
                _buildSizeButton(ButtonState.XXXL),
              ],
            )
          ],
        ),
      ),
    );
  }
}
