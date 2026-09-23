import 'package:flutter/material.dart';

class InputWidget extends StatefulWidget {
  const InputWidget({super.key});

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  double _ratingValue = 50;
  bool _isActive = false;
  String? _selectedGenre = 'None';
  DateTime? _selectedDate;

  // Hàm mở DatePicker (Xử lý lỗi context chuẩn Exercise 5)
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Rating (Slider)', style: TextStyle(fontWeight: FontWeight.bold)),
            Slider(
              value: _ratingValue,
              min: 0,
              max: 100,
              divisions: 10,
              label: _ratingValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _ratingValue = value; // Sửa lỗi state update bằng setState()
                });
              },
            ),
            Text('Current value: ${_ratingValue.round()}'),
            const Divider(),

            const Text('Active (Switch)', style: TextStyle(fontWeight: FontWeight.bold)),
            SwitchListTile(
              title: const Text('Is movie active?'),
              value: _isActive,
              onChanged: (bool value) {
                setState(() {
                  _isActive = value;
                });
              },
            ),
            const Divider(),

            const Text('Genre (RadioListTile)', style: TextStyle(fontWeight: FontWeight.bold)),
            RadioListTile<String>(
              title: const Text('Action'),
              value: 'Action',
              groupValue: _selectedGenre,
              onChanged: (String? value) {
                setState(() {
                  _selectedGenre = value;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('Comedy'),
              value: 'Comedy',
              groupValue: _selectedGenre,
              onChanged: (String? value) {
                setState(() {
                  _selectedGenre = value;
                });
              },
            ),
            Text('Selected genre: $_selectedGenre'),
            const Divider(),

            Center(
              child: ElevatedButton(
                onPressed: () => _selectDate(context),
                child: const Text('Open Date Picker'),
              ),
            ),
            if (_selectedDate != null)
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text('Selected Date: ${_selectedDate?.toLocal().toString().split(' ')[0]}'),                ),
              ),
          ],
        ),
      ),
    );
  }
}