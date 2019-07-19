import 'package:flutter/material.dart';
import 'package:flutter_skywalker_core/src/widgets/sky_text.dart';

typedef String OptionTitleResolver<T>(T t);

class SkyDropdownButton<T> extends StatefulWidget {
  final List<T> items;
  final Color textColor;
  final Color dropdownIconColor;
  final double fontSize;
  final OptionTitleResolver<T> resolver;

  const SkyDropdownButton({
    Key key,
    this.items,
    this.resolver,
    this.textColor = Colors.black,
    this.dropdownIconColor = Colors.blue,
    this.fontSize = 15,
  }) : super(key: key);

  static SkyDropdownButton<bool> yesOrNo({
    yesTitle = "Yes",
    noTitle = "No",
    textColor = Colors.black,
    dropdownIconColor = Colors.blue,
    fontSize = 15,
  }) {
    return SkyDropdownButton<bool>(
      textColor: textColor,
      dropdownIconColor: dropdownIconColor,
      fontSize: fontSize,
      items: [true, false],
      resolver: (bool val) {
        if (val) {
          return yesTitle;
        }
        return noTitle;
      },
    );
  }

  @override
  _SkyDropdownButtonState createState() => _SkyDropdownButtonState<T>(
        items: items,
        textColor: textColor,
        fontSize: fontSize,
        dropdownIconColor: dropdownIconColor,
      );
}

class _SkyDropdownButtonState<T> extends State<SkyDropdownButton<T>> {
  final List<T> items;
  final Color textColor;
  final Color dropdownIconColor;
  final double fontSize;
  final OptionTitleResolver<T> resolver;

  List<DropdownMenuItem<T>> _dropDownMenuItems;
  T _currentItem;

  _SkyDropdownButtonState({
    this.items,
    this.textColor,
    this.fontSize,
    this.dropdownIconColor,
    this.resolver,
  });

  @override
  void initState() {
    _dropDownMenuItems = _buildDropdownItems();
    _currentItem = _dropDownMenuItems[0].value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      child: FittedBox(
        fit: BoxFit.contain,
        child: DropdownButtonHideUnderline(
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
        ),
      ),
    );
  }

  List<DropdownMenuItem<T>> _buildDropdownItems() {
    List<DropdownMenuItem<T>> items = List();
    for (T item in this.items) {
      // here we are creating the drop down menu items, you can customize the item right here
      // but I'll just use a simple text for this
      items.add(DropdownMenuItem(
        value: item,
        child: SkyText(
          resolver(item),
          textColor: textColor,
          fontSize: fontSize,
        ),
      ));
    }
    return items;
  }

  void changedDropDownItem(T selectedOption) {
    setState(() {
      _currentItem = selectedOption;
    });
  }
}
