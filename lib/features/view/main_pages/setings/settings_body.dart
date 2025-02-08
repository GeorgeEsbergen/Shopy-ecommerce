import 'package:flutter/material.dart';
import '../../../../core/utils/font_style.dart';
import '../../../../core/widgets/divider.dart';
import '../../../../core/widgets/language.dart';
import 'widgets/logout_dialog.dart';
import 'widgets/setting_item.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: AppFonts.b20_600,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              const SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          "https://img.freepik.com/free-vector/cosmetic-products-hair-care-water-splash_107791-2525.jpg?t=st=1738778236~exp=1738781836~hmac=92e319f1b881d847fc51514d9d4e925156acf6038c01ec04a59a6c2760e52137&w=1380"),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name and LName",
                          style: AppFonts.b14_600,
                        ),
                        Text(
                          "george@gmail.com",
                          style: AppFonts.b14_600,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30),
              SettingsItems(
                onTap: () {},
                name: 'Profile',
                icon: Icons.person_2_outlined,
              ),
              const mainDivider(),
              SettingsItems(
                onTap: () {},
                name: 'About App',
                icon: Icons.info_outline,
              ),
              const mainDivider(),
              const LanguageWidget(),
              const mainDivider(),
              SettingsItems(
                onTap: () {
                  LogoutDialog(context);
                },
                name: 'Log out',
                icon: Icons.logout_sharp,
                color: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
