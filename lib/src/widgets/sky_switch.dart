import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class SkySwitch extends StatefulWidget {
  final bool isSwitched;
  final Color activeTrackColor;
  final Color activeColor;

  const SkySwitch(
      {Key key, this.isSwitched, this.activeTrackColor, this.activeColor})
      : super(key: key);

  @override
  _SkySwitchState createState() =>
      _SkySwitchState(isSwitched, activeTrackColor, activeColor);
}

class _SkySwitchState extends State<SkySwitch> {
  bool isSwitched;
  Color activeTrackColor;
  Color activeColor;

  _SkySwitchState(this.isSwitched, this.activeTrackColor, this.activeColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      child: PlatformSwitch(
        value: isSwitched,
        onChanged: (value) {
          setState(() {
            isSwitched = value;
          });
        },
        android: (context) {
          return MaterialSwitchData(activeTrackColor: activeTrackColor);
        },
        activeColor: Colors.green,
      ),
    );
  }
}
