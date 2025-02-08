// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import '../../../../core/utils/font_style.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../core/widgets/main_button.dart';
import 'widgets/form.dart';

class ProfileBody extends StatelessWidget {
  ProfileBody({super.key});
  final profileKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: AppFonts.b22_600,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: AppResp(context).size.width,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              const CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    "https://img.freepik.com/free-vector/cosmetic-products-hair-care-water-splash_107791-2525.jpg?t=st=1738778236~exp=1738781836~hmac=92e319f1b881d847fc51514d9d4e925156acf6038c01ec04a59a6c2760e52137&w=1380"),
              ),
              SignupForm(
                signupKey: profileKey,
              ),
              const SizedBox(height: 20),
              MainButton(
                onTap: () {
                  profileKey.currentState!.validate();
                },
                name: 'Update',
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
