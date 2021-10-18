import 'package:flutter/material.dart';


class SideNavigationBar extends StatelessWidget {
  const SideNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        /// Дильназ это твоя страница
      ),
    );
  }
}

