import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled75/getx/controller/sign_up_controller.dart';
import 'package:untitled75/theme/j-path-colors.dart';

SignUpController Controller = Get.find();

class CustomInputField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final Widget? prefix;
  final bool suffixIcon;
  final bool? isDense;
  final bool enable;
  final bool obscureText;
  final TextEditingController? controller;
  final void Function(String value)? onChanged;
  final void Function()? onTap;

  CustomInputField({
    Key? key,
    required this.labelText,
    required this.hintText,
    this.suffixIcon = false,
    this.onTap,
    this.isDense,
    this.obscureText = false,
    this.controller,
    this.onChanged,
    this.enable = true,
    this.prefix,
  }) : super(key: key);

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.9,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.labelText,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          TextFormField(
            onTap: () => widget.onTap?.call(),
            obscureText: (widget.obscureText && _obscureText),
            readOnly: !widget.enable,
            decoration: InputDecoration(
              isDense: (widget.isDense != null) ? widget.isDense : false,
              hintText: widget.hintText,
              prefix: widget.prefix,
              suffixIcon: widget.suffixIcon
                  /* ? Obx(
                      () {
                        return IconButton(
                            icon: Controller.checked.value && _obscureText
                                ? Icon(Icons.remove_red_eye)
                                : Icon(Icons.visibility_off_outlined),
                            color: Colors.black54,
                            onPressed: () {
                              Controller.UpdateSecure(_obscureText);
                            });
                      },
                    )*/

                  ? IconButton(
                      icon: Icon(
                        _obscureText
                            ? Icons.remove_red_eye
                            : Icons.visibility_off_outlined,
                        color: JPathColors.iconButtonColor,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    )
                  : null,
              suffixIconConstraints: (widget.isDense != null)
                  ? const BoxConstraints(maxHeight: 33)
                  : null,
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            /*validator: (textValue) {
              if (textValue == null || textValue.isEmpty) {
                return 'required!';
              }
              return null;
            },*/
            controller: widget.controller,
            onChanged: widget.onChanged,
          ),
        ],
      ),
    );
  }
}
