import 'package:admin_panel/ui/app/constants/constants.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropDown<T> extends StatefulWidget {
  const DropDown({
    required this.label,
    required this.items,
    required this.itemContent,
    required this.onSelected,
    Key? key,
  }) : super(key: key);

  final String label;
  final List<T> items;
  final Widget Function(T) itemContent;
  final Function(T) onSelected;

  @override
  State<DropDown<T>> createState() => _DropDownState<T>();
}

class _DropDownState<T> extends State<DropDown<T>> {
  T? selectedItem;

  void selectItem(T item) => setState(() {
        selectedItem = item;
      });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        hint: Text(
          widget.label,
          style: AppTextStyle.h2,
          overflow: TextOverflow.ellipsis,
        ),
        items: widget.items
            .map((item) => DropdownMenuItem<T>(
                  value: item,
                  child: widget.itemContent(item),
                ))
            .toList(),
        value: selectedItem,
        onChanged: <LinkType>(value) {
          widget.onSelected(value);
          selectItem(value);
        },
        icon: const Icon(
          Icons.arrow_forward_ios_outlined,
        ),
        buttonDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: Colors.black87,
          ),
          color: Colors.white,
        ),
        iconSize: 14,
        iconEnabledColor: AppColors.lile_500,
        iconDisabledColor: Colors.grey,
        buttonHeight: 50,
        buttonWidth: 160,
        buttonPadding: const EdgeInsets.only(left: 14, right: 14),
        itemHeight: 40,
        itemPadding: const EdgeInsets.only(left: 14, right: 14),
        dropdownMaxHeight: 250,
        dropdownWidth: 400,
        dropdownPadding: null,
        dropdownElevation: 3,
        scrollbarRadius: const Radius.circular(40),
        scrollbarThickness: 6,
        scrollbarAlwaysShow: true,
        offset: const Offset(-20, 0),
      ),
    );
  }
}
