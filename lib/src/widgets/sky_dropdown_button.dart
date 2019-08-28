import 'package:flutter/material.dart';
import 'package:flutter_skywalker_core/src/widgets/sky_text.dart';

typedef String OptionTitleResolver<T>(T t);

String _defaultTitleResolver(Object val) {
  return val.toString();
}

// TODO: REFACTOR THIS TO USE CUPERTINO PICKER TOO

class SkyDropdownButton<T> extends StatefulWidget {
  final List<T> items;
  final Color textColor;
  final Color dropdownIconColor;
  final double fontSize;
  final OptionTitleResolver<T> resolver;
  final Function onChanged;
  final T currentItem;

  const SkyDropdownButton({
    Key key,
    this.items,
    this.resolver = _defaultTitleResolver,
    this.textColor = Colors.black,
    this.dropdownIconColor = Colors.blue,
    this.fontSize = 15,
    this.onChanged,
    this.currentItem,
  }) : super(key: key);

  @override
  _SkyDropdownButtonState createState() => _SkyDropdownButtonState<T>(
        items: items,
        textColor: textColor,
        fontSize: fontSize,
        dropdownIconColor: dropdownIconColor,
        resolver: resolver,
        onChanged: onChanged,
        currentItem: currentItem,
      );
}

class _SkyDropdownButtonState<T> extends State<SkyDropdownButton<T>> {
  final List<T> items;
  final Color textColor;
  final Color dropdownIconColor;
  final double fontSize;
  final OptionTitleResolver<T> resolver;
  final Function onChanged;

  List<DropdownMenuItem<T>> _dropDownMenuItems;
  T currentItem;

  _SkyDropdownButtonState({
    this.onChanged,
    this.items,
    this.textColor,
    this.fontSize,
    this.dropdownIconColor,
    this.resolver,
    this.currentItem,
  }) : assert(null != resolver);

  @override
  void initState() {
    _dropDownMenuItems = _buildDropdownItems();
    currentItem = _dropDownMenuItems[0].value;
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
            value: currentItem,
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
    onChanged(selectedOption);
    setState(() {
      currentItem = selectedOption;
    });
  }
}
