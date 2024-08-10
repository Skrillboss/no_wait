import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_turno/views/widgets/custom_appbar.dart';
import '../../features/user/domain/entities/user.dart';
import '../../util/util.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserProfileView extends StatelessWidget {
  UserProfileView({super.key});

  final User user = Util.getSampleUser();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppLocalizations.of(context)!.profile,
        actions: () {},
      ),
      body: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    double widthFromScreen = MediaQuery.of(context).size.width;
    double heightFromScreen = MediaQuery.of(context).size.height;

    return Center(
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
                        height: 50,
                        alignment: Alignment.topRight,
                        child: IconButton(
                          icon: const Icon(Icons.settings),
                          onPressed: () {},
                        ),
                      ),
                      _buildColumnUserInformation(context)
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Column _buildColumnUserInformation(BuildContext context) {
    final List<Widget> rowsUserInfo = _buildRowUserInformation(context);

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

  List<Widget> _buildRowUserInformation(BuildContext context) {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppLocalizations.of(context)!.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            user.name,
            style: const TextStyle(color: Colors.indigo, fontSize: 16),
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
            user.nickName,
            style: const TextStyle(color: Colors.indigo, fontSize: 16),
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
            user.email,
            style: const TextStyle(color: Colors.indigo, fontSize: 16),
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
            user.phoneNumber,
            style: const TextStyle(color: Colors.indigo, fontSize: 16),
          )
        ],
      ),
      if (user.paymentInfo != null)
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppLocalizations.of(context)!.cardNumber,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              user.paymentInfo!.cardNumber,
              style: const TextStyle(color: Colors.indigo, fontSize: 16),
            )
          ],
        ),
      if (user.business != null)
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppLocalizations.of(context)!.business,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              user.business!.name,
              style: const TextStyle(color: Colors.indigo, fontSize: 16),
            )
          ],
        ),
    ];
  }
}
