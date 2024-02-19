// // ignore_for_file: public_member_api_docs, sort_constructors_first
// // ignore_for_file: use_build_context_synchronously
// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import 'package:payscore/features/auth/providers/auth_providers.dart';
// import 'package:payscore/services/session/providers/session_timer_providers.dart';
// import 'package:payscore/shared/app_extensions.dart';
// import 'package:payscore/shared/app_widgets/button.dart';
// import 'package:payscore/shared/app_widgets/pin_input_box.dart';
// import 'package:payscore/shared/utils/nav.dart';
// import 'package:payscore/shared/utils/snack_bar.dart';
// import 'package:payscore/shared/utils/type_defs.dart';
// import 'package:payscore/theme/dart';

// class SessionTimeoutDialogue extends ConsumerStatefulWidget {
//   final BuildContext cntxt;
//   const SessionTimeoutDialogue({
//     super.key,
//     required this.cntxt,
//   });

//   @override
//   ConsumerState<SessionTimeoutDialogue> createState() =>
//       _SessionTimeoutDialogueState();
// }

// class _SessionTimeoutDialogueState
//     extends ConsumerState<SessionTimeoutDialogue> {
//   final TextEditingController _pinController = TextEditingController();
//   Timer? timer;

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     logOutin3minutes();
//   }

//   void logOutin3minutes() {
//     timer = Timer(100.seconds, () {
//       ref.read(sessionTimerControllerProvider.notifier).cancelSessionTimer();
//       ref.read(authControllerProvider.notifier).logout(context: widget.cntxt);
//     });
//   }

//   @override
//   void dispose() {
//     _pinController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     bool isLoading = ref.watch(authControllerProvider);
//     return Scaffold(
//       backgroundColor: Colors.black26.withOpacity(0.3),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Center(
//               child: Container(
//                 height: 240.0.h,
//                 width: 327.0.w,
//                 decoration: BoxDecoration(
//                     color: neutralWhite,
//                     borderRadius: BorderRadius.circular(8.0.r)),
//                 padding:
//                     EdgeInsets.symmetric(vertical: 24.0.h, horizontal: 18.0.w),
//                 margin: EdgeInsets.only(top: 250.h),
//                 child: Column(
//                   children: [
//                     //! NOTICE
//                     Text('Your Session has Expired',
//                         style: TextStyle(
//                             fontSize: 14.sp,
//                             fontWeight: FontWeight.w600,
//                             color: neutralBlack)),

//                     //! SPACER
//                     12.sbH,

//                     //! NOTICE 2
//                     Text('Enter your 4-Digit pin to continue',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             fontSize: 12.sp,
//                             fontWeight: FontWeight.w500,
//                             color: neutralBlack.withOpacity(0.6))),

//                     //! SPACER
//                     20.sbH,

//                     //! PIN SECTION
//                     PinInputBox(
//                         controller: _pinController,
//                         length: 4,
//                         onCompleted: (pin) {}),

//                     //! SPACER
//                     const Spacer(),

//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         //! LOG OUT
//                         BButton(
//                           onTap: () {
//                             timer!.cancel();
//                             ref
//                                 .read(sessionTimerControllerProvider.notifier)
//                                 .cancelSessionTimer();

//                             //! remove user data to log out
//                             ref
//                                 .read(authControllerProvider.notifier)
//                                 .logout(context: widget.cntxt);
//                           },
//                           height: 45.h,
//                           width: 115.h,
//                           radius: 5.r,
//                           showBorder: true,
//                           color: Colors.transparent,
//                           textColor: Colors.red,
//                           borderColor: Colors.red,
//                           text: 'Log out',
//                         ),

//                         21.sbW,

//                         //! CONTINUE
//                         IgnorePointer(
//                           ignoring: isLoading,
//                           child: BButton(
//                             height: 45.h,
//                             width: 115.w,
//                             isText: false,
//                             item: isLoading
//                                 ? SizedBox.square(
//                                     dimension: 25.h,
//                                     child: const CircularProgressIndicator(
//                                       color: Colors.white,
//                                     ),
//                                   )
//                                 : 'Continue'.txt16(
//                                     fontW: F.w6,
//                                     color: neutralWhite,
//                                   ),
//                             onTap: () async {
//                               if (_pinController.text.length != 4) {
//                                 showBanner(
//                                   context: widget.cntxt,
//                                   theMessage: 'Your pin has 4 digits',
//                                   theType: NotificationType.failure,
//                                 );
//                               } else {
//                                 ref
//                                     .read(authControllerProvider.notifier)
//                                     .refreshTokenWithCode(
//                                       code: _pinController.text.trim(),

//                                       //! do this if refresh fails
//                                       leftSideEffect: () {
//                                         timer!.cancel();
//                                         ref
//                                             .read(sessionTimerControllerProvider
//                                                 .notifier)
//                                             .cancelSessionTimer();

//                                         //! remove user data to log out
//                                         ref
//                                             .read(
//                                                 authControllerProvider.notifier)
//                                             .logout(context: widget.cntxt);
//                                       },

//                                       //! do this if refresh succeeds
//                                       rightSideEffect: () {
//                                         timer!.cancel();

//                                         ref
//                                             .read(sessionTimerControllerProvider
//                                                 .notifier)
//                                             .resetSessionTimer();

//                                         goBack(widget.cntxt);
//                                       },
//                                     );
//                               }
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
