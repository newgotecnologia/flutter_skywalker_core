import 'package:flutter/material.dart';
import 'package:flutter_skywalker_core/src/widgets/sky_text.dart';

class SkyDropdownButton extends StatefulWidget {
  final List<String> items;
  final Color textColor;
  final Color dropdownIconColor;
  final double fontSize;

  const SkyDropdownButton({
    Key key,
    this.items,
    this.textColor = Colors.black,
    this.dropdownIconColor = Colors.blue,
    this.fontSize = 15,
  }) : super(key: key);

  @override
  _SkyDropdownButtonState createState() => _SkyDropdownButtonState(
        items: items,
        textColor: textColor,
        fontSize: fontSize,
        dropdownIconColor: dropdownIconColor,
      );
}

class _SkyDropdownButtonState extends State<SkyDropdownButton> {
  final List items;
  final Color textColor;
  final Color dropdownIconColor;
  final double fontSize;
  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _currentItem;

  _SkyDropdownButtonState(
      {this.items, this.textColor, this.fontSize, this.dropdownIconColor});

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _currentItem = _dropDownMenuItems[0].value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.cover,
      child: DropdownButton(
        items: _dropDownMenuItems,
        value: _currentItem,
        onChanged: changedDropDownItem,
        icon: Icon(
          Icons.keyboard_arrow_down,
          color: dropdownIconColor,
        ),
        style: TextStyle(fontSize: fontSize, color: textColor),
        isDense: true,
      ),
    );
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = List();
    for (String item in this.items) {
      // here we are creating the drop down menu items, you can customize the item right here
      // but I'll just use a simple text for this
      items.add(DropdownMenuItem(
          value: item,
          child: SkyText(
            item,
            textColor: textColor,
            fontSize: fontSize,
          )));
    }
    return items;
  }

  void changedDropDownItem(String selectedOption) {
    setState(() {
      _currentItem = selectedOption;
    });
  }
}
