import 'package:flutter/material.dart';
import '../../widgets/custom_bottom_navigation_bar.dart';
import '../../widgets/custom_appbar.dart';

abstract class AbstractScreen extends StatefulWidget {
  const AbstractScreen({super.key});
}

abstract class AbstractScreenState<Page extends AbstractScreen>
    extends State<Page> {
  final FocusNode focusNode = FocusNode();

  //TODO (issue 5): AQUI TENGO QUE IMPLEMENTAR EL languageProvider
  // late LanguageServiceProvider languageProvider;

  double taxValue = 0;
  double maxWidth = 0;
  double maxHeight = 0;
  double fontSize = 0;
  double width = 0;
  double height = 0;

  @override
  void initState() {
    super.initState();
    focusNode.requestFocus();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }
}

mixin AbstractScreenMixin<Page extends AbstractScreen>
    on AbstractScreenState<Page> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      //aqui tengo que implementar mis futuros proviers
      // atmSettingProvider =
      //     Provider.of<AtmSettingConsumerProvider>(context, listen: false);
      // videoProvider = Provider.of<VideoScreenProvider>(context, listen: false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarWidget(),
      body: bodyWidget(),
      bottomNavigationBar: bottomNavigationBarWidget(),
    );
  }

  CustomAppBar appbarWidget() {
    return const CustomAppBar(title: 'Issue nº5',);
  }

  Widget bodyWidget() {
    return Container();
  }

  CustomBottomNavigationBar bottomNavigationBarWidget(){
    return const CustomBottomNavigationBar();
  }
}
