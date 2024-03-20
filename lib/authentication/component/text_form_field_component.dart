import 'package:flutter/material.dart';
import '../../core/color_manger.dart';

class TextFormFieldComponent extends StatefulWidget {
  const TextFormFieldComponent(
      {super.key,
      required this.textEditingController,
      required this.title,
      required this.icons,
      this.hide = false});

  final TextEditingController textEditingController;
  final String title;
  final IconData icons;
  final bool hide;

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
                        : Icons.visibility_off_outlined,color:  ColorManager.litePrimary,
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

// import 'package:flutter/material.dart';
//
// class TextFormFieldComponent extends StatelessWidget {
//   TextFormFieldComponent(
//       {super.key,
//         required this.controller,
//         required this.type,
//         required this.validate,
//         required this.label,
//         required this.prefix,
//         this.isPassword = false,
//         this.suffix,
//         this.suffixPressed,
//         this.isClickable = true,
//       });
//
//   final TextEditingController controller;
//   final TextInputType type;
//   bool isPassword;
//   final Function validate;
//   final String label;
//   final IconData prefix;
//   IconData? suffix;
//   VoidCallback? suffixPressed;
//   final bool isClickable;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(12.0),
//       child: TextFormField(
//         controller: controller,
//         keyboardType: type,
//         obscureText: isPassword,
//         style: const TextStyle(fontSize: 16),
//         decoration: InputDecoration(
//           labelText: label,
//           prefixIcon: Icon(prefix),
//           suffixIcon: suffix != null
//               ? IconButton(
//             onPressed: suffixPressed,
//             icon: Icon(
//               suffix,
//             ),
//           )
//               : null,
//           border: OutlineInputBorder(),
//         ),
//       ),
//
//     );
//   }
// }

