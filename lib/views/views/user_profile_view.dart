import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:todo_turno/views/provider/views_list_provider/views_list_provider.dart';
import 'package:todo_turno/views/views/forms/login_user_view.dart';
import '../../features/user/application/provider/user_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../features/user/application/use_cases/logout_user.dart';

class UserProfileView extends StatelessWidget {
  UserProfileView({super.key});

  final LogoutUser logoutUser = GetIt.instance<LogoutUser>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    double widthFromScreen = MediaQuery.of(context).size.width;
    double heightFromScreen = MediaQuery.of(context).size.height;
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    final ViewsListProvider viewsListProvider =
        Provider.of<ViewsListProvider>(context);

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.green, Colors.blue],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft),
      ),
      alignment: Alignment.center,
      child: SizedBox(
        height: (heightFromScreen * 0.65),
        width: (widthFromScreen * 0.9),
        child: Column(
          children: [
            SizedBox(
              height: (heightFromScreen * 0.2),
              child: IconButton(
                icon: SvgPicture.asset(
                  'assets/svg/user-icon-black.svg',
                ),
                onPressed: () {},
              ),
            ),
            Container(
              height: (heightFromScreen * 0.35),
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: const BorderRadius.all(Radius.circular(30))),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: const Icon(Icons.settings),
                        onPressed: () {},
                      ),
                    ),
                    _buildColumnUserInformation(context, userProvider),
                  ],
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                userProvider.logOut.call();
                logoutUser.call();
                viewsListProvider.setProfileView = LoginUserView();
              },
              icon: const Icon(Icons.logout),
            )
          ],
        ),
      ),
    );
  }

  Column _buildColumnUserInformation(
      BuildContext context, UserProvider userProvider) {
    final List<Widget> rowsUserInfo =
        _buildRowUserInformation(context, userProvider);

    final List<Widget> spacedRowsUserInfo = [];

    for (int i = 0; i < rowsUserInfo.length; i++) {
      spacedRowsUserInfo.add(rowsUserInfo[i]);

      if (i < rowsUserInfo.length - 1) {
        spacedRowsUserInfo.add(const SizedBox(height: 10));
      }
    }

    return Column(
      children: spacedRowsUserInfo,
    );
  }

  List<Widget> _buildRowUserInformation(
      BuildContext context, UserProvider userProvider) {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppLocalizations.of(context)!.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            userProvider.getUser!.name,
            style: const TextStyle(fontSize: 16),
          )
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppLocalizations.of(context)!.nickname,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            userProvider.getUser!.nickName,
            style: const TextStyle(fontSize: 16),
          )
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppLocalizations.of(context)!.email,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(
              width: 160,
              child: Text(
                overflow: TextOverflow.ellipsis,
                userProvider.getUser!.email,
                style: const TextStyle(fontSize: 16),
              ))
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppLocalizations.of(context)!.phone,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            userProvider.getUser!.phoneNumber,
            style: const TextStyle(fontSize: 16),
          )
        ],
      ),
      if (userProvider.getUser!.paymentInfo != null)
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppLocalizations.of(context)!.cardNumber,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              userProvider.getUser!.paymentInfo!.cardNumber,
              style: const TextStyle(fontSize: 16),
            )
          ],
        ),
      if (userProvider.getUser!.business != null)
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppLocalizations.of(context)!.business,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              userProvider.getUser!.business!.name,
              style: const TextStyle(fontSize: 16),
            )
          ],
        ),
    ];
  }
}
