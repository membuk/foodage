import 'package:flutter/material.dart';
import 'package:foodageapp/providers/utils.dart';

class CustomDropDown<T> extends StatefulWidget {
  final List<DropdownMenuItem<T>> items;
  final T? selectedItem;
  final Function(T?)? onChanged;

  const CustomDropDown(
      {required this.items, this.selectedItem, this.onChanged, super.key});

  @override
  State<CustomDropDown<T>> createState() => _CustomDropDownState<T>();
}

class _CustomDropDownState<T> extends State<CustomDropDown<T>> {
  T? selectedItem;

  @override
  void initState() {
    super.initState();

    selectedItem = widget.selectedItem;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: 200,
      child: DropdownButton<T>(
          isExpanded: true,
          underline: Container(
            height: 1,
            color: Utils.appColor.inactiveColor,
          ),
          value: selectedItem,
          items: widget.items,
          onChanged: (T? item) {
            selectedItem = item;

            if (widget.onChanged != null) {
              widget.onChanged!(item);
            }
          }),
    );
  }
}
