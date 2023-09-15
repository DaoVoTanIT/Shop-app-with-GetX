import 'package:cmms/common/constant/colors.dart';
import 'package:cmms/common/constant/styles.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class SliderCpn extends StatefulWidget {
  const SliderCpn(
      {Key? key,
      this.min = 0,
      this.max = 100,
      this.title = '',
      this.currentValue = 0,
      this.isDone = false})
      : super(key: key);
  final double min;
  final double max;
  final String title;
  final double currentValue;
  final bool isDone;
  @override
  State<SliderCpn> createState() => _SliderCpnState();
}

class _SliderCpnState extends State<SliderCpn> {
  late double currentValue = widget.currentValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SfSliderTheme(
          data: SfSliderThemeData(
            thumbColor: grey100,
            thumbRadius: 20,
            thumbStrokeWidth: 1,
            tickSize: const Size(1, 8),
            activeLabelStyle: h8(color: grayBlue),
            inactiveLabelStyle: h8(color: grayBlue),
            thumbStrokeColor: border,
          ),
          child: Slider(
            min: widget.min,
            max: widget.max,
            divisions: 20,
            label: widget.isDone ? '100' : currentValue.toInt().toString(),
            value: widget.isDone ? 100 : currentValue,
            inactiveColor: border,
            activeColor: tiffanyBlue,
            onChanged: (value) {
              setState(() {
                currentValue = value;
              });
            },
          ),
        )
      ],
    );
  }
}
