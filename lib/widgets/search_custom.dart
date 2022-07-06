import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../untils/constants.dart';
import '../untils/untils.dart';

class SearchCustom extends StatefulWidget {
  final String? hintText;
  const SearchCustom({Key? key, this.hintText}) : super(key: key);

  @override
  State<SearchCustom> createState() => _SearchCustomState();
}

class _SearchCustomState extends State<SearchCustom> {
  final FocusNode _focus = FocusNode();

  void _onFocusChange() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _focus,
      textInputAction: TextInputAction.search,
      onFieldSubmitted: (value) {
        // if (onSearchTap != null) {
        //   onSearchTap!(controller.text);
        //   debugPrint(controller.text);
        // }
      },
      // controller: controller,
      // focusNode: focusNode,
      showCursor: true,
      cursorColor: ConstColors.black,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: widget.hintText,
        hintStyle: const TextStyle(
            fontSize: Dimens.body,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.normal,
            color: ConstColors.backGroundColor),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimens.radiusButton),
          borderSide: const BorderSide(color: Colors.black, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimens.radiusButton),
          borderSide: const BorderSide(color: Colors.grey, width: 0.5),
        ),
        contentPadding: const EdgeInsets.all(Dimens.marginView),
        prefixIcon: Container(
          margin: const EdgeInsets.only(left: Dimens.heightSmall),
          padding: const EdgeInsets.only(
              left: Dimens.marginView, right: Dimens.marginView),
          child: GestureDetector(
            child: SvgPicture.asset(
              Images.search,
              width: DimenUtilsPX.pxToPercentage(context, 30),
              height: DimenUtilsPX.pxToPercentage(context, 30),
            ),
            onTap: () {
              debugPrint('Search');
              // if (onSearchTap != null) {
              //   onSearchTap!(controller.text);
              // }
            },
          ),
        ),
      ),
      style: const TextStyle(
        fontSize: Dimens.body,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
    );
  }
}
