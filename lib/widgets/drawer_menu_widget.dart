import 'package:flutter/material.dart';

import '../untils/constants.dart';

class DrawerMenuWidget extends StatelessWidget {
  final VoidCallback? onClicked;
  const DrawerMenuWidget({Key? key, this.onClicked}) : super(key: key);

  @override
  Widget build(BuildContext context) => IconButton(
    icon: const Icon(Icons.menu),
    color: ConstColors.white,
    onPressed: onClicked,
  );
}
