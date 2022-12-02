import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PercentDisk extends StatefulWidget {
  final double value;
  const PercentDisk({super.key, required this.value});

  @override
  State<PercentDisk> createState() => _PercentDiskState();
}

class _PercentDiskState extends State<PercentDisk> {
  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 40.0,
      lineWidth: 13.0,
      animation: true,
      percent: widget.value,
      center: Text(
        "${(100 * widget.value).toStringAsFixed(1)}%",
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
      ),
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: Theme.of(context).primaryColorLight,
    );
  }
}
