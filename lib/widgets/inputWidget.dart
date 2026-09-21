import 'package:flutter/material.dart';

class inputWidget extends StatefulWidget {
  const inputWidget({super.key});

  @override
  State<inputWidget> createState() => _inputWidgetState();
}

class _inputWidgetState extends State<inputWidget> {
  // Khai báo các biến trạng thái cho các input control
  double _sliderValue = 20.0;
  bool _switchValue = false;
  int? _selectedRadio = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 2 - Input Controls Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // 1. Slider Demo
            const Text(
              'Slider Control:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: _sliderValue,
              min: 0,
              max: 100,
              divisions: 10,
              label: _sliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _sliderValue = value;
                });
              },
            ),
            Text('Giá trị Slider: ${_sliderValue.round()}'),
            const Divider(height: 30),

            // 2. Switch Demo
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Switch Control (Bật/Tắt):',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Switch(
                  value: _switchValue,
                  onChanged: (bool value) {
                    setState(() {
                      _switchValue = value;
                    });
                  },
                ),
              ],
            ),
            Text('Trạng thái Switch: ${_switchValue ? "Đang bật" : "Đang tắt"}'),
            const Divider(height: 30),

            // 3. RadioListTile Demo
            const Text(
              'RadioListTile Control (Lựa chọn):',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            RadioListTile<int>(
              title: const Text('Lựa chọn 1 (Standard)'),
              value: 1,
              groupValue: _selectedRadio,
              onChanged: (int? value) {
                setState(() {
                  _selectedRadio = value;
                });
              },
            ),
            RadioListTile<int>(
              title: const Text('Lựa chọn 2 (Express)'),
              value: 2,
              groupValue: _selectedRadio,
              onChanged: (int? value) {
                setState(() {
                  _selectedRadio = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}