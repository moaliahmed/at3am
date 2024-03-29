import 'package:flutter/material.dart';
import '../../core/color_manger.dart';

class TextFormFieldComponent extends StatefulWidget {
  const TextFormFieldComponent({
    super.key,
    required this.textEditingController,
    required this.title,
    required this.icons,
    this.hide = false,
    this.keyboardType=TextInputType.text,
    required this.validator,
    this.maxLength,
  });
  final String? Function(String?) validator;
  final TextEditingController textEditingController;
  final TextInputType keyboardType;
  final String title;
  final IconData icons;
  final bool hide;
  final int? maxLength;

  @override
  State<TextFormFieldComponent> createState() => _TextFormFieldComponentState();
}

class _TextFormFieldComponentState extends State<TextFormFieldComponent> {
  late bool _passwordVisible;

  @override
  void initState() {
    super.initState();
    _passwordVisible = !widget.hide;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
        maxLength:widget.maxLength ,
        keyboardType: widget.keyboardType,
        validator: widget.validator,
        controller: widget.textEditingController,
        style: const TextStyle(fontSize: 16),
        decoration: InputDecoration(
          suffixIcon: widget.hide
              ? IconButton(
                  onPressed: () {
                    setState(() => _passwordVisible = !_passwordVisible);
                  },
                  icon: Icon(
                    // Based on passwordVisible state choose the icon
                    _passwordVisible
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: ColorManager.litePrimary,
                  ),
                )
              : const Text(''),
          prefixIcon: Icon(
            widget.icons,
            color: ColorManager.litePrimary,
          ),
          hintText: widget.title,
          hintStyle:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        obscureText: !_passwordVisible,
      ),
    );
  }
}
