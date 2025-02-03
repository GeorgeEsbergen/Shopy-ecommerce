// ignore_for_file: must_be_immutable

import 'package:e_commerce_with_supabase/core/utils/colors.dart';
import 'package:e_commerce_with_supabase/features/view/main_pages/favourite/favourite.dart';
import 'package:e_commerce_with_supabase/features/view/main_pages/home/home.dart';
import 'package:e_commerce_with_supabase/features/view/main_pages/profile/profile.dart';
import 'package:e_commerce_with_supabase/features/view/main_pages/store/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../cubit/bnv/bnv_cubit.dart';

class BNV extends StatelessWidget {
  BNV({super.key});
  static String routeName = "NAV Bar";
  List<Widget> pages = const [
    Home(),
    Store(),
    Favourite(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BnvCubit(),
      child: BlocBuilder<BnvCubit, BnvState>(builder: (context, state) {
        BnvCubit cubit = context.read<BnvCubit>();
        return Scaffold(
          body: SafeArea(
            child: Container(
              padding: const EdgeInsets.only(right: 16, left: 16, top: 30),
              child: pages[cubit.currentIndex],
            ),
          ),
          bottomNavigationBar: Container(
            
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: GNav(
    
                onTabChange: (value) {
                  cubit.changePage(value);
                },
                rippleColor: Colors.black,
                hoverColor: Colors.black,
                haptic: true,
                tabBorderRadius: 15,
                tabActiveBorder: Border.all(color: Colors.black, width: 1),
                curve: Curves.linear,
                duration: const Duration(milliseconds: 400),
                gap: 8, // the tab button gap between icon and text
                color: AppColors.gray, // unselected icon color
                activeColor: AppColors.white, // selected icon and text color
                iconSize: 24, // tab button icon size
                tabBackgroundColor:
                    AppColors.black, // selected tab background color
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 12), // navigation bar padding
                tabs: const [
                  GButton(
                    icon: Icons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: Icons.store,
                    text: 'Store',
                  ),
                  GButton(
                    icon: Icons.favorite,
                    text: 'Favorite',
                  ),
                  GButton(
                    icon: Icons.person,
                    text: 'Profile',
                  )
                ]),
          ),
        );
      }),
    );
  }
}
