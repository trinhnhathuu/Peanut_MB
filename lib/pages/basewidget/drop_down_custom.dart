import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/demensions.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> items;
  final String? selectedItem;
  final Function(String?) onChanged;
  final String? labelText;
  final String? hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final double? height;
  final double? widthDropMenuItem;
  final TextStyle? textStyle; // Thêm thuộc tính textStyle
  final TextStyle? labelTextStyle; // Thêm thuộc tính labelTextStyle
  final TextStyle? hintTextStyle; // Thêm thuộc tính hintTextStyle


  const CustomDropdown({
    Key? key,
    required this.items,
    this.selectedItem,
    required this.onChanged,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.height,
    this.widthDropMenuItem,
    this.textStyle, // Thêm thuộc tính textStyle vào constructor
    this.labelTextStyle, // Thêm thuộc tính labelTextStyle vào constructor
    this.hintTextStyle, // Thêm thuộc tính hintTextStyle vào constructor
  }) : super(key: key);

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? _selectedItem;

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.selectedItem;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      padding: EdgeInsets.only(
        top: 10,
      ),
      isExpanded: true,
      menuMaxHeight: widget.height,
      style: widget.textStyle ?? TextStyle( // Sử dụng widget.textStyle hoặc tạo một TextStyle mặc định nếu widget.textStyle là null
        color: Colors.black,
        fontSize: PDimensions.FONT_SIZE_H6,
      ),
      value: _selectedItem!.isNotEmpty ? _selectedItem : null,
      items: widget.items.map((String item) {
        return DropdownMenuItem(
          value: item,
          child: SizedBox(
            width: widget.widthDropMenuItem,
            child: Text(item),
          ),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          _selectedItem = newValue;
        });
        widget.onChanged(newValue);
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: widget.labelText,
        hintText: widget.hintText,
          labelStyle: widget.labelTextStyle,
          hintStyle: widget.hintTextStyle,
        prefixIcon: widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
        suffixIcon: widget.suffixIcon != null
            ? Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: 8),
            Icon(widget.suffixIcon),
          ],
        )
            : null,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.zero,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.zero,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      ),
    );
  }
}
