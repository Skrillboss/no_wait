import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback actions;
  final String title;

  const CustomAppBar({
    super.key,
    required this.actions,
    this.title = 'Falta el titulo',
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(title),
      elevation: 0.0,
      actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () => actions.call()
          ),
      ],
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
