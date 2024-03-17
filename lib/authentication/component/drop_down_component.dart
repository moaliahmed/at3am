import 'package:flutter/material.dart';

class DropDownComponent extends StatelessWidget {
   DropDownComponent({super.key});
String dropDownValue='number';
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(12.0),
      child: DropdownMenu(
          width: MediaQuery.of(context).size.width * .85,
          hintText: 'Select',
          inputDecorationTheme: InputDecorationTheme(
            isDense: true,
            contentPadding:
            const EdgeInsets.symmetric(horizontal: 16),
            constraints: BoxConstraints.tight(
                const Size.fromHeight(40)),
            border: UnderlineInputBorder(),
          ),
          onSelected: (value) {},
          dropdownMenuEntries: [
            DropdownMenuEntry(value: '', label: 'doner'),
            DropdownMenuEntry(
                value: '', label: 'someone need food'),
          ]),
    );
  }
}
