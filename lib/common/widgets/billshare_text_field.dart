import 'package:flutter/material.dart';
import 'package:bill_share/constants/app_colors.dart';
import 'package:bill_share/constants/font.dart';

class BillshareTextField extends StatefulWidget {
  final String? label;
  final bool obscure;
  final TextEditingController? controller;
  const BillshareTextField(
      {super.key, this.label, this.obscure = false, this.controller});

  @override
  State<BillshareTextField> createState() => _BillshareTextFieldState();
}

class _BillshareTextFieldState extends State<BillshareTextField> {
  late bool _obscure;

  @override
  void initState() {
    super.initState();
    _obscure = widget.obscure;
  }

  Widget? _buildSufix() {
    if (!widget.obscure) return null;
    return GestureDetector(
        onTap: () {
          setState(() => _obscure = !_obscure);
        },
        child: AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            child: _obscure
                ? Icon(
                    key: ValueKey('visible'),
                    Icons.visibility,
                    color: AppColors.black,
                  )
                : Icon(
                    key: ValueKey('invisible'),
                    Icons.visibility_off,
                    color: AppColors.black,
                  )));
  }

  @override
  Widget build(BuildContext context) {
    final regularBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: AppColors.grey),
    );
    final focusedBorder =
        regularBorder.copyWith(borderSide: BorderSide(color: AppColors.green));
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.5),
      child: TextFormField(
        controller: widget.controller,
        obscureText: _obscure,
        decoration: InputDecoration(
            labelText: widget.label,
            labelStyle: Font.h4Grey,
            contentPadding: EdgeInsets.all(12),
            border: regularBorder,
            enabledBorder: regularBorder,
            focusedBorder: focusedBorder,
            suffixIcon: _buildSufix()),
      ),
    );
  }
}
