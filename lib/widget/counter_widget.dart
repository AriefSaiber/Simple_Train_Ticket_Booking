import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  final int min;
  final int max;
  final int initialValue;
  final ValueChanged<int>? onChanged;

  const CounterWidget({
    Key? key,
    this.min = 0,
    this.max = 100,
    this.initialValue = 0,
    this.onChanged,
  }) : super(key: key);

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  late int _counter;

  @override
  void initState() {
    super.initState();
    _counter = widget.initialValue;
  }

  void _increment() {
    if (_counter < widget.max) {
      setState(() {
        _counter++;
      });
      widget.onChanged?.call(_counter);
    }
  }

  void _decrement() {
    if (_counter > widget.min) {
      setState(() {
        _counter--;
      });
      widget.onChanged?.call(_counter);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          child: IconButton(
            onPressed: _decrement,
            icon: Icon(Icons.remove),
          ),
        ),
        Text(
          '$_counter',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        IconButton(
          onPressed: _increment,
          icon: Icon(Icons.add),
        ),
      ],
    );
  }
}
