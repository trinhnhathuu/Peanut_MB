import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/demensions.dart';

class CustomDropdown<T> extends StatefulWidget {
  final List<T> items;
  final T? selectedItem;
  final Function(T?) onChanged;
  final String? labelText;
  final String? hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final double? height;
  final double? widthDropMenuItem;
  final TextStyle? textStyle;
  final TextStyle? labelTextStyle;
  final TextStyle? hintTextStyle;
  final Widget Function(T)? itemBuilder; 
  final BorderRadius?  borderRadius;// Optional custom item builder

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
    this.textStyle,
    this.labelTextStyle,
    this.hintTextStyle,
    this.itemBuilder, 
    this.borderRadius// Add itemBuilder to the constructor
  }) : super(key: key);

  @override
  State<CustomDropdown<T>> createState() => _CustomDropdownState<T>();
}

class _CustomDropdownState<T> extends State<CustomDropdown<T>> {
  T? _selectedItem;

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.selectedItem;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      isExpanded: true,
      menuMaxHeight: widget.height,
      style: widget.textStyle ?? TextStyle(
        color: Colors.black,
        fontSize: PDimensions.FONT_SIZE_H6,
      ),
      value: _selectedItem,
      items: widget.items.map((T value) {
        return DropdownMenuItem<T>(
          value: value,
          child: SizedBox(
            width: widget.widthDropMenuItem,
            child: widget.itemBuilder != null 
                ? widget.itemBuilder!(value) 
                : Text(
                    value.toString(),
                    style: widget.textStyle ?? TextStyle(
                      color: Colors.black,
                      fontSize: PDimensions.FONT_SIZE_H6,
                    ),
                  ),
          ),
        );
      }).toList(),
      onChanged: (T? newValue) {
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
                  const SizedBox(width: 8),
                  Icon(widget.suffixIcon),
                ],
              )
            : null,
           border: OutlineInputBorder(
            borderRadius: widget.borderRadius ?? BorderRadius.circular(10.0), // Sử dụng giá trị mặc định là 10.0 nếu giá trị borderRadius là null
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: widget.borderRadius  ?? BorderRadius.circular(10.0), // Sử dụng giá trị mặc định là 10.0 nếu giá trị borderRadius là null
            borderSide: BorderSide.none,
          ),
        focusedBorder:  OutlineInputBorder(
         borderRadius: widget.borderRadius  ?? BorderRadius.circular(10.0), // Sử dụng giá trị mặc định là 10.0 nếu giá trị borderRadius là null
       borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 16.0),
      ),
    );
  }
}
