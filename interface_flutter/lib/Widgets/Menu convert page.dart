import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Menuconvertpage extends StatefulWidget {
  final Function(String) onChanged;

  const Menuconvertpage({super.key, required this.onChanged});

  @override
  State<Menuconvertpage> createState() => _MenuconvertpageState();
}

class _MenuconvertpageState extends State<Menuconvertpage> {
  List<String> items = ["English", "Arabic"];
  String selectedItem = "English";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 120,
      child: DropdownButtonFormField<String>(
        dropdownColor: const Color(0xff616BE6),
        decoration: InputDecoration(
          focusedBorder: _buildMenuBorder(Colors.green),
          errorBorder: _buildMenuBorder(Colors.red),
          enabledBorder: _buildMenuBorder(const Color(0xff616BE6)),
        ),
        value: selectedItem,
        items: items.map((item) =>
            DropdownMenuItem(value: item, child: Text(item))).toList(),
        onChanged: (item) {
          if (item != null) {
            setState(() => selectedItem = item);
            widget.onChanged(item);
          }
        },
        validator: (item) {
          if (item?.isEmpty ?? true) {
            return "Please select a language";
          }
          return null;
        },
      ),
    );
  }

  OutlineInputBorder _buildMenuBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: color, width: 1.5),
    );
  }
}
