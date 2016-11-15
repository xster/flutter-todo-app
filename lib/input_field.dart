import 'package:flutter/material.dart';

class InputField extends FormField<InputValue> {
  InputField({
  Key key,
  GlobalKey focusKey,
  TextInputType keyboardType: TextInputType.text,
  Icon icon,
  String labelText,
  String hintText,
  TextStyle style,
  bool hideText: false,
  bool isDense: false,
  bool autofocus: false,
  int maxLines: 1,
  InputValue initialValue: InputValue.empty,
  ValueChanged<InputValue> onChanged,
  FormFieldSetter<InputValue> onSaved,
  FormFieldValidator<InputValue> validator,
  }) : super(
      key: key,
      initialValue: initialValue,
      onSaved: onSaved,
      validator: validator,
      builder: (FormFieldState<InputValue> field) {
        return new Input(
            key: focusKey,
            keyboardType: keyboardType,
            icon: icon,
            labelText: labelText,
            hintText: hintText,
            style: style,
            hideText: hideText,
            isDense: isDense,
            autofocus: autofocus,
            maxLines: maxLines,
            value: field.value,
            onChanged: (InputValue value) {
              onChanged(value);
              field.onChanged(value);
            },
            errorText: field.errorText,
            );
      },
      );
}

class _InputField extends StatelessWidget {
  InputValue initialValue;
  String label;
  ValueChanged<InputValue> onChanged;
  ValueChanged<InputValue> onSubmitted;

  _InputField(
      {this.initialValue, this.label, this.onChanged, this.onSubmitted});

  Widget build(BuildContext context) {
    return new FormField<InputValue>(
        key: this.key,
        initialValue: this.initialValue,
        builder: (FormFieldState<InputValue> field) {
          return new Input(
              labelText: label,
              hintText: label,
              onChanged: this.onChanged,
              onSubmitted: this.onSubmitted,
              );
        },
        );
  }
}
