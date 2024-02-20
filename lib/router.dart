import 'package:bu_ride/app/auth/views/admin_login_view.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

void nav({required String destination, required BuildContext context}) {
  Routemaster.of(context).push(destination);
}

//! these routes would be desplayed when the admin is logged out
final loggedOutRoute = RouteMap(
  routes: {
    '/': (_) => const MaterialPage(
          child: AdminLoginView(),
        ),
  },
  onUnknownRoute: (path) => const MaterialPage(
    child: Scaffold(),
  ),
);

//! these routes would be displayed when the admin is logged in
final loggedInRoute = RouteMap(
  routes: const {
    // '/': (_) => const MaterialPage(
    //       child: BaseNavWrapper(),
    //     ),
    // '/create-quiz': (_) => const MaterialPage(
    //       child: CreateQuizView(),
    //     ),
    // '/create-quiz/quiz-questions/:quizId': (routeData) => MaterialPage(
    //       child: QuizQuestionsView(
    //         quizId: routeData.pathParameters['quizId']!,
    //       ),
    //     ),
    // '/quiz-questions/:quizId': (routeData) => MaterialPage(
    //       child: QuizQuestionsView(
    //         quizId: routeData.pathParameters['quizId']!,
    //       ),
    //     ),
    // '/notifications': (_) => const MaterialPage(
    //       child: NotificationsView(),
    //     ),
    // '/product-details/:productId': (routeData) => MaterialPage(
    //       child: BuyerProductDetailsView(
    //         productId: routeData.pathParameters['productId']!,
    //       ),
    //     ),
  },
  onUnknownRoute: (path) => const MaterialPage(
    child: Scaffold(),
  ),
);
