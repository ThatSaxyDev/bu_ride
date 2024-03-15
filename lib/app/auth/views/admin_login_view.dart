import 'package:bu_ride/app/auth/providers/auth_providers.dart';
import 'package:bu_ride/shared/app_extensions.dart';
import 'package:bu_ride/shared/app_widgets/button.dart';
import 'package:bu_ride/shared/app_widgets/text_input.dart';
import 'package:bu_ride/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdminLoginView extends ConsumerStatefulWidget {
  const AdminLoginView({super.key});

  static const String name = '/admin-login';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AdminLoginViewState();
}

class _AdminLoginViewState extends ConsumerState<AdminLoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authStateNotifierProvider);
    final authStateNotifier = ref.read(authStateNotifierProvider.notifier);
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
                image: DecorationImage(
                  image: AssetImage('authBackground'.png),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: SizedBox(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 120.rW(context)),
                child: Column(
                  children: [
                    100.sbH(context),
                    Image.asset(
                      'bu_logo'.png,
                      height: 100.rH(context),
                      width: 103.rW(context),
                    ),
                    60.sbH(context),
                    'Welcome back'.txt(
                        size: 32,
                        color: primaryBlue,
                        fontWeight: FontWeight.w700),
                    20.sbH(context),
                    'Enter your email and password to sign in'.txt(
                        size: 14, color: grey600, fontWeight: FontWeight.w600),

                    20.sbH(context),

                    //! email
                    TextInputWidget(
                      inputTitle: 'Email',
                      hintText: 'you@example.com',
                      controller: _emailController,
                    ),
                    36.sbH(context),

                    //! password
                    TextInputWidget(
                      inputTitle: 'Password',
                      hintText: '********',
                      controller: _passwordController,
                    ),
                    // 36.sbH(context),

                    // Row(
                    //   children: [
                    //     Switch(value: true, onChanged: (newValue) {}),
                    //     12.9.sbW(context),
                    //     'Remember me'.txt(size: 16),
                    //     const Spacer(),
                    //     'Forgot Password?'.txt(
                    //       size: 16,
                    //       color: primaryBlue,
                    //       fontWeight: FontWeight.w500,
                    //     ),
                    //   ],
                    // ),
                    72.sbH(context),
                    authState.isLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : BButton(
                            onTap: () {
                              authStateNotifier.loginAdmin(
                                  email: _emailController.text.trim(),
                                  password: _passwordController.text.trim(),
                                  context: context);
                            },
                            width: double.infinity,
                            text: 'Enter',
                          ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
