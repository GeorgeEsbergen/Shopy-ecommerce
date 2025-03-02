import 'package:e_commerce_with_supabase/features/cubit/login/login_cubit.dart';
import 'package:e_commerce_with_supabase/features/view/auth/login/login.dart';
import 'package:e_commerce_with_supabase/features/view/entry_pages/orders/orders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/font_style.dart';
import '../../../../core/widgets/custom_indicator.dart';
import '../../../../core/widgets/divider.dart';
import '../../../../core/widgets/language.dart';
import '../../../view_model/auth/user_data.dart';
import '../../entry_pages/profile/profile.dart';
import 'widgets/logout_dialog.dart';
import 'widgets/setting_item.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    GetUserDataModel? getdata = context.read<LoginCubit>().getUserDataModel;
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
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          "https://img.freepik.com/free-vector/cosmetic-products-hair-care-water-splash_107791-2525.jpg?t=st=1738778236~exp=1738781836~hmac=92e319f1b881d847fc51514d9d4e925156acf6038c01ec04a59a6c2760e52137&w=1380"),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          getdata!.name ?? "Known Name",
                          style: AppFonts.b14_600,
                        ),
                        Text(
                          getdata.email ?? "Known email",
                          style: AppFonts.b14_600,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30),
              SettingsItems(
                onTap: () => Navigator.of(context).pushNamed(Profile.routeName),
                name: 'Profile',
                icon: Icons.person_2_outlined,
              ),
              const mainDivider(),
              SettingsItems(
                onTap: () => Navigator.of(context).pushNamed(Orders.routeName),
                name: 'My Orders',
                icon: Icons.shopping_bag_outlined,
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
              BlocConsumer<LoginCubit, LoginState>(builder: (context, state) {
                return state is LogOutLoading
                    ? const CustomCircleIndicator()
                    : SettingsItems(
                        onTap: () {
                          LogoutDialog(context, logOut: () async {
                            await context.read<LoginCubit>().logout();
                          });
                        },
                        name: 'Log out',
                        icon: Icons.logout_sharp,
                        color: Colors.red,
                      );
              }, listener: (context, state) {
                if (state is LogOutSuccess) {
                  Navigator.of(context).pushReplacementNamed(Login.routeName);
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
