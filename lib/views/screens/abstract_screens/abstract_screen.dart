import 'package:flutter/material.dart';
import '../../widgets/custom_bottom_navigation_bar.dart';
import '../../widgets/custom_appbar.dart';

abstract class AbstractScreen extends StatefulWidget {
  const AbstractScreen({super.key});
}

abstract class AbstractScreenState<Page extends AbstractScreen>
    extends State<Page> {
  final FocusNode focusNode = FocusNode();


  double fontSizeTitle = 24;
  double fontSizeSubTitle = 20;
  double fontSizeText = 14;
  double widthOfScreen = 0;
  double heightOfScreen = 0;

  @override
  void initState() {
    super.initState();
    focusNode.requestFocus();
  }

  @override
  void didChangeDependencies() {
    final size = MediaQuery.of(context).size;
    widthOfScreen = size.width;
    heightOfScreen = size.height;

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
    return CustomAppBar(
      actions: (){},
    );
  }

  Widget bodyWidget() {
    return Container();
  }

  CustomBottomNavigationBar bottomNavigationBarWidget() {
    return const CustomBottomNavigationBar();
  }
}
