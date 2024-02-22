import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../Utils/appTheme.dart';
import '../Utils/input_field_utils.dart';
import 'debouncer.dart';


class CustomTextField extends StatefulWidget {
  final String? labelText;
  final AutovalidateMode autoValidateMode;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String?>? onChanged;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  final dynamic prefixIcon;
  final dynamic suffixIcon;
  final VoidCallback? onSuffixIconPressed;
  final VoidCallback? onFieldTap;
  final String? initialValue;
  final String? hint;
  final bool obscureText;
  final bool enabled;
  final bool showSuffix;
  final bool readOnly;
  final int? maxLength;
  final int maxLines;
  final double borderRadius;

  const CustomTextField({
    Key? key,
    this.labelText,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
    this.controller,
    this.textInputAction,
    this.keyboardType = TextInputType.text,
    this.textCapitalization = TextCapitalization.none,
    this.inputFormatters,
    this.onChanged,
    this.validator,
    this.onSaved,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixIconPressed,
    this.onFieldTap,
    this.initialValue,
    this.hint,
    this.obscureText = false,
    this.enabled = true,
    this.showSuffix = true,
    this.readOnly = false,
    this.maxLength,
    this.maxLines = 1,
    this.borderRadius = 15,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final _fieldKey = GlobalKey<FormBuilderFieldState>();
  final _debouncer = Debouncer(milliseconds: 100);

  @override
  Widget build(BuildContext context) {
    final prefix = InputFieldUtils.prefixIcon(
      widget.prefixIcon,
      InputFieldUtils.stateColor(_fieldKey),
    );
    final suffix = _suffixIcon();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InputFieldUtils.labelText(context, widget.labelText),
        FormBuilderTextField(
          readOnly: widget.readOnly,
          name: widget.labelText ?? '',
          key: _fieldKey,
          style: InputFieldUtils.textStyle(AppTheme.primaryTextColor),
          initialValue: widget.initialValue,
          autovalidateMode: widget.autoValidateMode,
          decoration: InputFieldUtils.inputDecorator(
            context,
            fieldKey: _fieldKey,
            enabled: widget.enabled,
            hint: widget.hint,
            prefix: prefix,
            suffix: suffix,
          ).copyWith(
            contentPadding: EdgeInsets.fromLTRB(
              prefix == null ? 16 : 0,
              24,
              suffix == null ? 16 : 0,
              12,
            ),
          ),
          textInputAction: widget.textInputAction,
          keyboardType: widget.keyboardType,
          textCapitalization: widget.textCapitalization,
          inputFormatters: widget.inputFormatters,
          controller: widget.controller,
          onChanged: (value) {
            if (widget.onChanged != null) {
              widget.onChanged!(value);
            }
            _debouncer.run(() {
              setState(() {});
            });
          },
          validator: widget.validator,
          onSaved: widget.onSaved,
          obscureText: widget.obscureText,
          obscuringCharacter: '*',
          enabled: widget.enabled,
          maxLength: widget.maxLength,
          maxLines: widget.maxLines,
          onTap: widget.onFieldTap,
        ),
      ],
    );
  }

  Widget? _suffixIcon() {
    if (widget.showSuffix == false) {
      return null;
    }

    return InkWell(
      borderRadius: BorderRadius.circular(32.0),
      onTap: disableSuffixTap ? null : widget.onSuffixIconPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: InputFieldUtils.iconChild(
          stateSuffixIcon,
          InputFieldUtils.stateColor(_fieldKey),
        ),
      ),
    );
  }

  dynamic get stateSuffixIcon {
    if (widget.suffixIcon != null) {
      return widget.suffixIcon;
    }

    final state = InputFieldUtils.fieldState(_fieldKey);
    if (state == FieldState.error) {
      return Icons.error_outline;
    } else if (state == FieldState.success) {
      return Icons.check_circle_outline;
    }
    return widget.suffixIcon;
  }

  bool get disableSuffixTap {
    return isStateSuccessOrError && widget.suffixIcon == null;
  }

  bool get isStateSuccessOrError {
    final state = InputFieldUtils.fieldState(_fieldKey);
    return state == FieldState.error || state == FieldState.success;
  }
}
