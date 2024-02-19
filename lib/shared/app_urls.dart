abstract class AppUrls {
  //! paystack
  static const String payStackBaseUrl = 'https://checkout.paystack.com/';
  //! baseUrl
  static const String baseUrl = 'https://tent-proxy.onrender.com/';
  // static const String baseUrl = 'https://api.thetent.app/';

  //! auth
  static const String signup = '/auth/register';
  static const String login = '/auth/login';
  static const String sendSMSOtp = '/auth/send-sms-otp';
  static const String verifySMSOtp = '/auth/verify-sms-otp';
  static const String sendEmailOtp = '/auth/send-email-otp';
  static const String verifyEmailOtp = '/auth/verify-email-otp';
  static const String refreshTokens = '/auth/refresh-token';
  static const String sendResetPasswordMail = '/auth/send-reset-password-email';
  static const String changePassword = '/auth/password';
  static const String logout = '/auth/logout';
  static const String deactivateAccount = '/auth/deactivate';
  static const String deleteAccount = '/auth/profile';
  static const String addAddress = '/auth/address';
  static String addressUrl({required String addressId}) =>
      "/auth/address/$addressId";

  //! profile
  static const String updateProfile = '/auth/profile';
  static const String updateProfilePhoto = '/auth/update-profile-picture';
  static const String getUserDetails = '/profile';
  static String getUserDetailsFromId({required String userId}) =>
      "/profile/$userId";
  static String getTicketDetails({required String ticketId}) =>
      "/ticket/$ticketId";
  static const String switchOnCreatorMode = 'auth/creator/on';
  static const String switchOffCreatorMode = 'auth/creator/off';
  static const String getUsersTents = '/tents';
  static const String getUsersPosts = '/posts';
  static const String getUsersTickets = '/tickets';
  static const String getUsersPinnedEvents = '/event/pinned';
  static const String getFollowers = '/followers';
  static const String getFollowing = '/following';
  static const String followUrl = '/follow';
  static const String accountTiers = '/account-tiers';

  //! event
  static const String pinEvent = '/event/pinned';
  static const String happeningRightNow = '/happening-right-now';
  static String getTentInfo({required String tentId}) => "/tent/$tentId";

  //! posts
  static const String createPost = "/post";
  static String getPostDetails({required String postId}) => "/post/$postId";
  static const String comment = '/comment';
  static String getRepliesToComment(
          {required String postId, required String commentId}) =>
      "/post/$postId/comment/$commentId/replies";
  static const String reactToComment = '/comment/react';
  static const String replyToComment = '/comment/reply';
  static String getCommentsOnPosts({required String postId}) =>
      "/post/$postId/comments";
  static String getAnotherUsersPosts({required String userId}) =>
      "/profile/$userId/posts";
  static const String likePost = "/like";
  static const String requestForFeaturedPost = "/featured-post";

  //! search
  static String search({required String userId}) => "/profile/$userId";

  static const String searchh = "/search";

  //! creator
  static const String createATent = "/creator/tent";
  static const String createATicket = "/creator/ticket";
  static const String getCreatedTents = '/creator/tents';
  static const String getTicketsRevenue = '/creator/tickets-and-revenue';
  static const String getTicketsGraph = '/creator/tickets-graph';
  static const String getTopTentSales = '/creator/top-tents';
  static const String getFeatureRequests = '/creator/feature-requests';
  static const String acceptFeatureRequests =
      '/creator/feature-requests/accept';
  static const String rejectFeatureRequests =
      '/creator/feature-requests/reject';

  //! payment
  static const String createTicketTransaction =
      '/payment/create-transaction/ticket';
  static const String createAccountUpgradeTransaction =
      '/payment/create-transaction/account-upgrade';
  static String markTransactionAsFailed({required String transactionRef}) =>
      "/payment/update-transaction/ticket/$transactionRef/failed";
  static String markAccountUpgradeTransactionAsFailed(
          {required String transactionRef}) =>
      "/payment/update-transaction/account-upgrade/$transactionRef/failed";
}
