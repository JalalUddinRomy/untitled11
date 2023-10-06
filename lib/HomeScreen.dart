import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomescreenState();
  }
}

class _HomescreenState extends State<HomeScreen> {
  String _selectedsize = '';

  ElevatedButton _buildSizeButton(String size) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _selectedsize = size;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Selected Size: $size'),
            duration: Duration(seconds: 1),
          ),
        );
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            if (_selectedsize == size) {
              return Colors.blue;
            }
            return Colors.grey;
          },
        ),
      ),
      child: Text(size),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('"Size Selector"'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Row(
                children: [
                  Container(
                    width: 95,
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 7),
                      child: _buildSizeButton("S"),
                    ),
                  ),
                  Container(
                    width: 95,
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 7),
                      child: _buildSizeButton("M"),
                    ),
                  ),
                  Container(
                    width: 95,
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 7),
                      child: _buildSizeButton("L"),
                    ),
                  ),
                  Container(
                    width: 95,
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 7),
                      child: _buildSizeButton("XL"),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Row(
                children: [
                  Container(
                    width: 95,
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 7,
                      ),
                      child: _buildSizeButton("XXL"),
                    ),
                  ),
                  Container(
                    width: 95,
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 7),
                      child: _buildSizeButton("XXXL"),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
