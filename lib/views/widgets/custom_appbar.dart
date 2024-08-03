import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;
  final bool? canGoToHome;
  final String title;

  const CustomAppBar({
    super.key,
    this.actions,
    this.canGoToHome,
    this.title = 'Issue nº5',
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: _getLeading(canGoToHome, context),
      centerTitle: true,
      title: Text(title),
      elevation: 0.0,
      actions: actions,
      backgroundColor: Colors.transparent,
    );
  }

  Widget? _getLeading(bool? state, BuildContext context) {
    if (state == null) {
      return null;
    } else if (state == true) {
      return IconButton(
        icon: const Icon(Icons.add_alert, color: Colors.white),
        onPressed: () => {}, // Aquí puedes agregar la funcionalidad deseada
      );
    } else {
      return IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.of(context).pop(),
      );
    }
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
