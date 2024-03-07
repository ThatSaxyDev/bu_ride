import 'package:bu_ride/app/auth/providers/auth_providers.dart';
import 'package:bu_ride/models/admin_midel.dart';
import 'package:bu_ride/shared/app_constants.dart';
import 'package:bu_ride/shared/app_extensions.dart';
import 'package:bu_ride/shared/app_widgets/app_divider.dart';
import 'package:bu_ride/shared/app_widgets/button.dart';
import 'package:bu_ride/shared/app_widgets/custom_flex.dart';
import 'package:bu_ride/shared/app_widgets/text_input.dart';
import 'package:bu_ride/theme/palette.dart';
import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class SettingsViews extends ConsumerStatefulWidget {
  const SettingsViews({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsViewsState();
}

class _SettingsViewsState extends ConsumerState<SettingsViews> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emaailController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _userNameController.dispose();
    _emaailController.dispose();
    _bioController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  AdminModel? admin;

  void getUser() async {
    await Future.delayed(100.ms).then((value) {
      admin = ref.watch(userDataControllerProvider.notifier).user!;
      _fullNameController.text = admin!.fullName;
      _userNameController.text = admin!.userName;
      _emaailController.text = admin!.emailAddress;
      _phoneController.text = admin!.phoneNumber;
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    // getUser();
  }

  @override
  Widget build(BuildContext context) {
    AdminModel admin = ref.watch(userDataControllerProvider.notifier).user!;
    _fullNameController.text = admin.fullName;
    _userNameController.text = admin.userName;
    _emaailController.text = admin.emailAddress;
    _phoneController.text = admin.phoneNumber;
    final authState = ref.watch(authStateNotifierProvider);
    final authStateNotifier = ref.read(authStateNotifierProvider.notifier);
    return SizedBox(
      height: height(context),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(left: 36.rW(context)),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              90.sbH(context),
              'Account Setting'.txt(
                size: 30,
                fontWeight: FontWeight.w600,
                color: primaryBlue,
              ),
              // const Gap(20),
              // 'Your Profile Picture'.txt(size: 20),
              // const Gap(20),
              // CircleAvatar(
              //   radius: 50,
              //   backgroundImage: NetworkImage(admin.profilePhoto),
              // ),
              const Gap(41),
              AppDivider(
                width: 1000,
                borderWidth: 0.5,
                color: neutralBlack.withOpacity(0.2),
              ),
              const Gap(34),
              SeparatedRow(
                separatorBuilder: () => const Gap(20),
                children: [
                  TextInputWidget(
                    width: 450,
                    hintText: 'Please enter your full name',
                    inputTitle: 'Full Name',
                    controller: _fullNameController,
                    borderColor: Colors.blueGrey.withOpacity(0.3),
                  ),
                  TextInputWidget(
                    width: 450,
                    hintText: 'Please enter your email',
                    inputTitle: 'Email',
                    controller: _emaailController,
                    borderColor: Colors.blueGrey.withOpacity(0.3),
                    readOnly: true,
                  ),
                ],
              ),
              const Gap(24),
              SeparatedRow(
                separatorBuilder: () => const Gap(20),
                children: [
                  TextInputWidget(
                    width: 450,
                    hintText: 'Please enter your username',
                    inputTitle: 'Username',
                    controller: _userNameController,
                    borderColor: Colors.blueGrey.withOpacity(0.3),
                  ),
                  TextInputWidget(
                    width: 450,
                    hintText: 'Please enter your phone number',
                    inputTitle: 'Phone Number',
                    controller: _phoneController,
                    borderColor: Colors.blueGrey.withOpacity(0.3),
                  ),
                ],
              ),
              const Gap(24),
              TextInputWidget(
                height: 187,
                fieldHeight: 158,
                width: 920,
                maxLines: 5,
                hintText: 'Write your Bio here e.g your hobbies, interests ETC',
                inputTitle: 'Bio',
                controller: _bioController,
                borderColor: Colors.blueGrey.withOpacity(0.3),
              ),
              const Gap(34),
              authState.isLoading
                  ? const SizedBox(
                      width: 201,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : BButton(
                      width: 201,
                      onTap: () {
                        authStateNotifier.editAdmin(
                          fullname: _fullNameController.text.trim(),
                          username: _userNameController.text.trim(),
                          phoneNumber: _phoneController.text.trim(),
                          bio: _bioController.text.trim(),
                          context: context,
                        );
                      },
                      text: 'Update Profile',
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
