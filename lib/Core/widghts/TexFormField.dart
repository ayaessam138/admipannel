import 'package:afcooadminpanel/Core/shared_prefrence_value.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextformFieldWidght extends StatelessWidget {
  TextformFieldWidght(
      {super.key,
      this.HintText,
      // required this.icon,
      required this.controller,
      required this.onSaved,
      this.validator,
      this.focusNode,
      this.keyboardType,
      this.maxLines = 1});
  final String? HintText;
  // final Widget icon;
  final TextEditingController controller;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      // textDirection: SharedPreferenceValue.GetLocal()=='en'?TextDirection.ltr:TextDirection.rtl ,
      // onTap:  () => focusNode?.unfocus(),
      onEditingComplete: () => focusNode?.unfocus(),
      keyboardType: keyboardType,
      focusNode: focusNode,
      validator: validator,
      onSaved: onSaved,
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal:8,vertical: 16.0),
          isDense: true,
          filled: true,
          hintStyle: const TextStyle(fontFamily: 'SST Arabic'),
          fillColor: Colors.white,
          hintText: HintText ?? '',
          // prefixIcon: icon,
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff3C8DBC))),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffB7B7B7))),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffFBF9F4))
              //
              )),
    );
  }
}

class TextformFieldWidghtwithCounter extends StatelessWidget {
  TextformFieldWidghtwithCounter(
      {Key? key,
      this.HintText,
      required this.controller,
      required this.onChanged,
      this.validator,
      this.focusNode,
      this.keyboardType,
      this.maxLines = 1,
      required this.onPressedIncrement,
      required this.onPressedDecrement})
      : super(key: key);

  final String? HintText;
  final TextEditingController controller;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final int? maxLines;
  final void Function()? onPressedIncrement;
  final void Function()? onPressedDecrement;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      focusNode: focusNode,
      validator: validator,
      onChanged: onChanged,
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
        isDense: true,
        filled: true,
        fillColor: Colors.white,
        hintText: HintText ?? '',
        suffixIcon: Column(
          children: [
            GestureDetector(
                onTap: onPressedIncrement,
                child: Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: Container(
                      color: Color(0xffE9E9ED),
                      // decoration: ShapeDecoration(
                      //     color: Colors.red,
                      //     shape: CircleBorder(),),
                      child: const Icon(
                        Icons.arrow_drop_up,
                      )),
                )),
            GestureDetector(
                onTap: onPressedDecrement,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 6.0),
                  child: Container(
                      color: Color(0xffE9E9ED),
                      child: const Icon(Icons.arrow_drop_down)),
                )),

            // IconButton(
            //     icon:
            //     onPressed:onPressedIncrement
            // ),
            // IconButton(
            //   icon:
            //   onPressed: () {
            //
            //   },
            // ),
          ],
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff3C8DBC)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffB7B7B7)),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffFBF9F4)),
        ),
      ),
    );
  }
}

class TextformFieldWidghticon extends StatelessWidget {
  TextformFieldWidghticon(
      {super.key,
      required this.HintText,
      required this.icon,
      required this.controller,
      required this.onChanged,
      this.validator,
      this.focusNode,
      this.keyboardType,
      this.maxLines = 1,
      this.readOnly = false});
  final String HintText;
  final Widget icon;
  final TextEditingController controller;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final int? maxLines;
  final bool readOnly;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // textDirection: SharedPreferenceValue.GetLocal() == 'en'
      //     ? TextDirection.ltr
      //     : TextDirection.rtl,
      // onTap:  () => focusNode?.unfocus(),
      onEditingComplete: () => focusNode?.unfocus(),
      keyboardType: keyboardType,
      focusNode: focusNode,
      validator: validator,
      onChanged: onChanged,
      controller: controller,
      maxLines: maxLines,
      readOnly: readOnly,
      decoration: InputDecoration(
          isDense: true,
          filled: true,
          hintStyle: TextStyle(fontFamily: 'SST Arabic'),
          fillColor: Colors.white,
          hintText: HintText,
          suffixIcon: icon,
          border: const OutlineInputBorder()),
    );
  }
}