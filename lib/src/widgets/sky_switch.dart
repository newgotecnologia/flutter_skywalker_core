import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class SkySwitch extends StatefulWidget {
  final bool isSwitched;
  final Color activeTrackColor;
  final Color activeColor;
  final Function onChanged;

  const SkySwitch({
    Key key,
    this.isSwitched = false,
    this.activeTrackColor = Colors.lightBlue,
    this.activeColor = Colors.blue,
    this.onChanged,
  }) : super(key: key);

  @override
  _SkySwitchState createState() =>
      _SkySwitchState(isSwitched, activeTrackColor, activeColor, onChanged);
}

class _SkySwitchState extends State<SkySwitch> {
  bool isSwitched;
  Color activeTrackColor;
  Color activeColor;
  Function onChanged;

  _SkySwitchState(this.isSwitched, this.activeTrackColor, this.activeColor, this.onChanged);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      child: PlatformSwitch(
        value: isSwitched,
        onChanged: (value) {
          setState(() {
            isSwitched = value;
            onChanged(value);
          });
        },
        android: (context) {
          return MaterialSwitchData(activeTrackColor: activeTrackColor);
        },
        activeColor: activeColor,
      ),
    );
  }
}
