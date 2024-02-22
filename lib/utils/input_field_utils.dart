import 'package:flutter/material.dart';

import 'appTheme.dart';
import 'app_styles.dart';
import 'image_utils.dart';


enum FieldState { unfocused, error, success }

class InputFieldUtils {
  const InputFieldUtils._internal();

  static Widget labelText(BuildContext context, String? labelText) {
    return Visibility(
      visible: labelText?.isNotEmpty == true,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        width: MediaQuery.of(context).size.width,
        child: Text(
          labelText ?? '',
          style: InputFieldUtils.hintStyle(Colors.black),
        ),
      ),
    );
  }

  static TextStyle hintStyle([Color? color]) {
    return Textify.hint.copyWith(color: color);
  }

  static TextStyle helperStyle() {
    return hintStyle(AppTheme.grayColor).copyWith(fontSize: 12);
  }

  static TextStyle errorStyle() {
    return hintStyle(AppTheme.errorColor).copyWith(fontSize: 12);
  }

  static TextStyle textStyle([Color? color]) {
    return Textify.paragraph1.copyWith(color: color, decoration: TextDecoration.none);
  }

  static InputDecoration inputDecorator(
      BuildContext context, {
        GlobalKey<FormFieldState>? fieldKey,
        bool enabled = true,
        String? hint,
        Widget? prefix,
        Widget? suffix,
      }) {
    return InputDecoration(
      counter: const SizedBox.shrink(),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      enabled: enabled,
      prefixIcon: prefix,
      suffixIcon: suffix,
      hintText: hint,
      filled: !enabled,
      fillColor: Colors.black12,
      hintStyle: InputFieldUtils.hintStyle(AppTheme.grayColor),
      helperStyle: InputFieldUtils.helperStyle(),
      helperMaxLines: 2,
      errorStyle: InputFieldUtils.errorStyle(),
      errorMaxLines: 2,
      enabledBorder: InputFieldUtils.inputBorder(
        InputFieldUtils.stateColor(fieldKey),
      ),
      focusedBorder: InputFieldUtils.inputBorder(
        Theme.of(context).colorScheme.primary,
      ),
      disabledBorder: InputFieldUtils.inputBorder(
        Theme.of(context).disabledColor,
      ),
      errorBorder: InputFieldUtils.inputBorder(
        Theme.of(context).colorScheme.error,
      ),
      focusedErrorBorder: InputFieldUtils.inputBorder(
        Theme.of(context).colorScheme.error,
      ),
    );
  }

  static OutlineInputBorder inputBorder(
      Color color, [
        double borderRadius = 15,
      ]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      borderSide: BorderSide(
        color: color,
        width: 1,
      ),
    );
  }

  static Widget? prefixIcon(dynamic icon, [Color? color]) {
    if (icon == null) {
      return null;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: iconChild(icon, color),
    );
  }

  static Widget? iconChild(dynamic icon, [Color? color]) {
    if (icon is IconData) {
      return Icon(icon, color: color);
    } else if (icon is String) {
      return ImageUtils.getLocalSvgImage(icon, color: color);
    }
    return null;
  }

  static Color stateColor(GlobalKey<FormFieldState>? fieldKey) {
    final state = fieldState(fieldKey);
    if (state == FieldState.error) {
      return AppTheme.errorColor;
    } else if (state == FieldState.success) {
      return AppTheme.successColor;
    } else {
      return AppTheme.grayColor;
    }
  }

  static FieldState fieldState(GlobalKey<FormFieldState>? fieldKey) {
    if (hasError(fieldKey)) {
      return FieldState.error;
    } else if (isSuccess(fieldKey)) {
      return FieldState.success;
    } else {
      return FieldState.unfocused;
    }
  }

  static bool hasError(GlobalKey<FormFieldState>? fieldKey) {
    return fieldKey?.currentState?.hasError == true;
  }

  static bool isSuccess(GlobalKey<FormFieldState>? fieldKey) {
    final fieldValue = fieldKey?.currentState?.value as String?;
    return fieldValue?.isNotEmpty == true && !hasError(fieldKey);
  }
}
